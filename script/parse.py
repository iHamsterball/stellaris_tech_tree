#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
from lex import tokens
from os import listdir, makedirs, path
from ply.yacc import yacc
from pprint import pprint
import argparse
import codecs
import json
import operator
import re
import yaml
import sys
from game_objects import Army, ArmyAttachment, BuildablePop, Building, \
    Component, Edict, Policy, Resource, SpaceportModule, Technology, \
    TechnologyJSONEncoder, TileBlocker

# Process CLI arguments:
def valid_label(label):
    if not re.match(r'^\w+$', label):
        raise argparse.ArgumentTypeError('Must match [a-z0-9_]')
    elif not path.isdir(path.join('public', label)):
        makedirs(path.join('public', label))

    return label.lower()


def valid_dirs(directory):
    if not path.isdir(directory):
        message = "'{}' not found or not a directory".format(directory)
        raise argparse.ArgumentTypeError(message)

    return directory

arg_parser = argparse.ArgumentParser(
    description='Parse Stellaris tech and localization files')
arg_parser.add_argument('label', type=valid_label)
arg_parser.add_argument('directories', nargs='+', type=valid_dirs)

args = arg_parser.parse_args()
tree_label = args.label
directories = args.directories

def eprint(string):
    sys.stderr.write(string + '\n')


def p_script(tokens):
    'script : statements'
    tokens[0] = tokens[1]


def p_statement_statements(tokens):
    'statements : statement statements'
    tokens[0] = tokens[1] + tokens[2]


def p_statements_empty(tokens):
    'statements : empty'
    tokens[0] = []


def p_empty(tokens):
    'empty :'
    pass


def p_key(tokens):
    '''key : STRING
           | BAREWORD'''
    tokens[0] = tokens[1]


def p_keys(tokens):
    'keys : key keys'
    tokens[0] = [tokens[1]] + tokens[2] if type(tokens[1]) is str else \
                [tokens[1], tokens[2]]


def p_keys_empty(tokens):
    'keys : empty'
    tokens[0] = []


def p_statement_var_assign(tokens):
    'statement : VARIABLE EQUALS NUMBER'
    number = int(tokens[3]) if '.' not in tokens[3] else float(tokens[3])
    tokens[0] = [{tokens[1]: number}]


def p_statement_binop(tokens):
    'statement : binop'
    tokens[0] = tokens[1]


def p_expression_variable(tokens):
    'expression : VARIABLE'
    tokens[0] = tokens[1]


def p_expression_key(tokens):
    'expression : key'
    tokens[0] = tokens[1]

def p_expression_number(tokens):
    'expression : NUMBER'
    tokens[0] = tokens[1]


def p_binop(tokens):
    '''binop : key EQUALS expression
             | key GTHAN expression
             | key LTHAN expression'''
    operator = tokens[2]

    if re.match(r'^-?\d+$', str(tokens[3])):
        roperand = int(tokens[3])
    elif re.match(r'^-?\d+\.\d+$', str(tokens[3])):
        roperand = float(tokens[3])
    else:
        roperand = tokens[3]


    tokens[0] = [{tokens[1]: roperand}] if operator == '=' else \
                [{tokens[1]: {operator: roperand}}]


def p_list(tokens):
    '''list : LBRACE keys RBRACE'''
    tokens[0] = tokens[2]


def p_expression_list(tokens):
    'expression : list'
    tokens[0] = tokens[1]


def p_block(tokens):
    'block : LBRACE statements RBRACE'
    tokens[0] = tokens[2]


def p_expression_block(tokens):
    'expression : block'
    tokens[0] = tokens[1]


def p_error(p):
    raise Exception("Syntax error in input: {}".format(str(p)))


def get_file_paths(file_paths, directory):
    if not path.isdir(directory):
        return []

    for filename in listdir(directory):
        file_path = path.join(directory, filename)
        if not path.isfile(file_path) \
           or 'README' in file_path \
           or not file_path.endswith('.txt'):
            continue

        eprint('Loading {} ...'.format(filename))

        # If filename already loaded, replace old one with new:
        path_to_delete = next(iter(
            file_path for file_path
            in file_paths
            if path.basename(file_path) == filename
        ), None)
        if path_to_delete is not None:
            eprint('Replacing {} ...'.format(path.basename(path_to_delete)))
            file_paths.remove(path_to_delete)

        file_paths.append(path.join(directory, filename))

    return file_paths


def localized_strings():
    loc_data = { }
    for file_path in loc_file_paths:
        eprint('Loading {} ...'.format(path.basename(file_path)))
        not_yaml_lines = codecs.open(file_path, 'r', 'utf-8-sig').readlines()
        not_yaml = ''
        for line in not_yaml_lines:
            quote_instances = [i for i, char in enumerate(line)
                               if char == u'"']

            if len(quote_instances) >= 2:
                # Some lines have invalid data after terminal quote:
                last = quote_instances[-1]
                line = line[:last + 1] + '\n'

                if len(quote_instances) > 2:
                    second = quote_instances[1]
                    line = line[0:second] \
                           + line[second:last].replace(u'"', r'\"') \
                           + line[last:]

            not_yaml += line

        still_not_yaml = re.sub(r'£\w+  |§[A-Z!]', '', not_yaml)
        resembles_yaml = re.sub(r'(?<=\w):\d (?=")', ': ', still_not_yaml)
        actual_yaml = re.sub(r'^[ \t]+', '  ', resembles_yaml, flags=re.M)

        file_data = yaml.load(actual_yaml, Loader=yaml.Loader)
        loc_map = file_data['l_polish']
        loc_data.update(loc_map)

    return loc_data

tech_file_paths = []
army_file_paths = []
army_attachment_file_paths = []
building_file_paths = []
buildable_pop_file_paths = []
component_file_paths = []
edict_file_paths = []
policy_file_paths = []
resource_file_paths = []
spaceport_module_file_paths = []
tile_blocker_file_paths = []
loc_file_paths = []
skip_terms = ['events?', 'tutorials?', 'pop_factions?', 'name_lists?',
              'messages?', 'mandates?', 'projects?', 'sections?',
              'triggers?', 'traits?']
has_skip_term = re.compile(r'(?:{})_'.format('|'.join(skip_terms)))

for directory in directories:
    tech_dir = path.join(directory, 'common/technology')
    tech_file_paths = get_file_paths(tech_file_paths, tech_dir)

    army_dir = path.join(directory, 'common/armies')
    army_file_paths = get_file_paths(army_file_paths, army_dir)

    army_attachment_dir = path.join(directory, 'common/army_attachments')
    army_attachment_file_paths = get_file_paths(army_attachment_file_paths,
                                                army_attachment_dir)

    buildable_pop_dir = path.join(directory, 'common/buildable_pops')
    buildable_pop_file_paths = get_file_paths(buildable_pop_file_paths,
                                              buildable_pop_dir)

    building_dir = path.join(directory, 'common/buildings')
    building_file_paths = get_file_paths(building_file_paths, building_dir)

    component_dir = path.join(directory, 'common/component_templates')
    component_file_paths = get_file_paths(component_file_paths, component_dir)

    edict_dir = path.join(directory, 'common/edicts')
    edict_file_paths = get_file_paths(edict_file_paths, edict_dir)

    policy_dir = path.join(directory, 'common/policies')
    policy_file_paths = get_file_paths(policy_file_paths, policy_dir)

    resource_dir = path.join(directory, 'common/strategic_resources')
    resource_file_paths = get_file_paths(resource_file_paths, resource_dir)

    spaceport_module_dir = path.join(directory, 'common/spaceport_modules')
    spaceport_module_file_paths = get_file_paths(spaceport_module_file_paths,
                                                 spaceport_module_dir)

    tile_blocker_dir = path.join(directory, 'common/tile_blockers')
    tile_blocker_file_paths = get_file_paths(tile_blocker_file_paths,
                                                 tile_blocker_dir)

    loc_dir = path.join(directory, 'localisation/polish')
    loc_file_paths += [path.join(loc_dir, filename) for filename
                       in listdir(loc_dir)
                       if path.isfile(path.join(loc_dir, filename))
                       and filename.endswith('l_polish.yml')
                       and not has_skip_term.search(filename)]

loc_data = localized_strings()

pdx_tech_scripts = '\r\n'.join([open(file_path).read() for file_path
                                in tech_file_paths])
pdx_army_scripts = '\r\n'.join([open(file_path).read() for file_path
                                in army_file_paths])
pdx_army_attachment_scripts = '\r\n'.join([open(file_path).read() for file_path
                                           in army_attachment_file_paths])
pdx_buildable_pop_scripts = '\r\n'.join([open(file_path).read() for file_path
                                         in buildable_pop_file_paths])
pdx_building_scripts = '\r\n'.join([open(file_path).read() for file_path
                                    in building_file_paths])
pdx_component_scripts = '\r\n'.join([open(file_path).read() for file_path
                                     in component_file_paths])
pdx_edict_scripts = '\r\n'.join([open(file_path).read() for file_path
                                 in edict_file_paths])
pdx_policy_scripts = '\r\n'.join([open(file_path).read() for file_path
                                  in policy_file_paths])
pdx_resource_scripts = '\r\n'.join([open(file_path).read() for file_path
                                    in resource_file_paths])
pdx_spaceport_module_scripts = '\r\n'.join([open(file_path).read()
                                            for file_path
                                            in spaceport_module_file_paths])
pdx_tile_blocker_scripts = '\r\n'.join([open(file_path).read()
                                        for file_path
                                        in tile_blocker_file_paths])
pdx_parser = yacc()
parsed_scripts = {
    'technology': pdx_parser.parse(pdx_tech_scripts),
    'army': pdx_parser.parse(pdx_army_scripts),
    'army_attachment': pdx_parser.parse(pdx_army_attachment_scripts),
    'buildable_pop': pdx_parser.parse(pdx_buildable_pop_scripts),
    'building': pdx_parser.parse(pdx_building_scripts),
    'component': pdx_parser.parse(pdx_component_scripts),
    'edict': pdx_parser.parse(pdx_edict_scripts),
    'policy': pdx_parser.parse(pdx_policy_scripts),
    'resource': pdx_parser.parse(pdx_resource_scripts),
    'spaceport_module': pdx_parser.parse(pdx_spaceport_module_scripts),
    'tile_blocker': pdx_parser.parse(pdx_tile_blocker_scripts)
}

armies = [Army(entry, loc_data) for entry in parsed_scripts['army']
          if not next(iter(entry)).startswith('@')]
army_attachments = [ArmyAttachment(entry, loc_data)
                    for entry
                    in parsed_scripts['army_attachment']
                    if not next(iter(entry)).startswith('@')]
buildable_pops = [BuildablePop(entry, loc_data)
                  for entry
                  in parsed_scripts['buildable_pop']
                  if not next(iter(entry)).startswith('@')]
buildings = [Building(entry, loc_data)
             for entry
             in parsed_scripts['building']
             if not next(iter(entry)).startswith('@')]
components = [Component(next(iter(entry.values())), loc_data)
              for entry
              in parsed_scripts['component']
              if not next(iter(entry)).startswith('@')]
edicts = [Edict(next(iter(entry.values())), loc_data)
          for entry
          in parsed_scripts['edict']
          if not next(iter(entry)).startswith('@')]
policies = [Policy(entry, loc_data)
            for entry
            in parsed_scripts['policy']
            if not next(iter(entry)).startswith('@')]
resources = [Resource(entry, loc_data)
             for entry
             in parsed_scripts['resource']
             if not next(iter(entry)).startswith('@')]
spaceport_modules = [SpaceportModule(entry, loc_data)
                     for entry
                     in parsed_scripts['spaceport_module']
                     if not next(iter(entry)).startswith('@')]
tile_blockers = [TileBlocker(entry, loc_data)
                 for entry
                 in parsed_scripts['tile_blocker']
                 if not next(iter(entry)).startswith('@')]
at_vars = {}
technologies = []

for entry in parsed_scripts['technology']:
    if next(iter(entry)).startswith('@'):
        at_var = next(iter(entry))
        at_vars[at_var] = entry[at_var]
        continue

    tech = Technology(entry, armies, army_attachments, buildable_pops,
                      buildings, components, edicts, policies, resources,
                      spaceport_modules, tile_blockers, loc_data, at_vars)
    if not tech.is_start_tech \
       and tech.base_weight * tech.base_factor == 0 \
       and len(tech.weight_modifiers) == 0:
        continue

    technologies.append(tech)


technologies.sort(key=operator.attrgetter('tier'))
technologies.sort(
    key=lambda tech: {'physics': 1, 'society': 2, 'engineering': 3}[tech.area])
jsonified = json.dumps(technologies, indent=2, separators=(',', ': '),
                       cls=TechnologyJSONEncoder)

open(path.join('public', tree_label, 'techs.json'), 'w').write(jsonified)
