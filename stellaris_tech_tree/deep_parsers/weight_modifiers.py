# -*- coding: utf-8 -*-

from django.utils.translation import ugettext
import re
import yaml
import sys

localization_map = {}

def parse(modifier, loc_data):
    global localization_map
    localization_map = loc_data

    if len(modifier) == 1:
        modifier.append({'always': 'yes'})

    try:
        factor = next(iter(key for key in modifier
                           if list(key)[0] == 'factor'))['factor']
        adjustment = _localize_factor(factor)
    except StopIteration:
        add = next(iter(line for line in modifier
                        if list(line)[0] == 'add'))['add']
        adjustment = _localize_add(add)

    unparsed_conditions = [line for line in modifier \
                           if list(line)[0] not in ['factor', 'add']]
    if len(unparsed_conditions) > 1:
        unparsed_conditions = [{'AND': unparsed_conditions}]

    conditions = [_parse_condition(condition)
                  for condition
                  in unparsed_conditions]

    yaml_output = yaml.dump({adjustment: conditions}, indent=4,
                            default_flow_style=False,
                            allow_unicode=True)
    pseudo_yaml = re.sub(r'(\xd7[\d.]+):\n\s*- ', r'(\1)',
                         yaml_output).replace('- ', u'• ')
    return pseudo_yaml

def _parse_condition(condition):
    key = next(iter(condition))
    value = condition[key]
    return globals()['_localize_' + key.lower()](value)

def _expert(expert):
    return {
        'Physics': ugettext('Physics'),
        'Society': ugettext('Society'),
        'Engineering': ugettext('Engineering'),
    }.get(expert, 'Shouldn\'t be here')

def _localize_factor(factor):
    return u'\xD7{}'.format(factor)


def _localize_add(add):
    sign = '' if add == 0 else '+' if add > 0 else '-';
    return '{}{}'.format(sign, add)


def _localize_has_ethic(value):
    ethic = localization_map[value]
    return ugettext('Has {} Ethic').format(ethic)

def _localize_has_not_ethic(value):
    ethic = localization_map[value]
    return ugettext('Does NOT have {} Ethic').format(ethic)

def _localize_has_civic(value):
    civic = localization_map[value]
    return ugettext('Has {} Government Civic').format(civic)

def _localize_has_valid_civic(value):
    civic = localization_map[value]
    return ugettext('Has {} Government Civic').format(civic)

def _localize_has_ascension_perk(value):
    perk = localization_map[value]
    return ugettext('Has {} Ascension Perk').format(perk)

def _localize_has_megastructure(value):
    megastructure = localization_map[value]
    return ugettext('Has Megatructure {}').format(megastructure)

def _localize_has_policy_flag(value):
    policy_flag = localization_map[value]
    return ugettext('Has {} Policy').format(policy_flag)


def _localize_has_trait(value):
    trait = localization_map[value]
    return ugettext('Has {} Trait').format(trait)

def _localize_has_authority(value):
    authority = localization_map[value]
    return ugettext('Has {} Authority').format(authority)

def _localize_host_has_dlc(dlc):
    # dlc = localization_map[value]
    return ugettext('Host does has the {} DLC').format(dlc)

def _localize_host_has_not_dlc(dlc):
    # dlc = localization_map[value]
    return ugettext('Host does NOT have the {} DLC').format(dlc)

def _localize_has_technology(value):
    try:
        technology = localization_map[value]
    except KeyError:
        technology = value

    return ugettext('Has {} Technology').format(technology)


def _localize_has_not_technology(value):
    try:
        technology = localization_map[value]
    except KeyError:
        technology = value

    return ugettext('Does NOT have {} Technology').format(technology)


def _localize_has_modifier(value):
    modifier = localization_map[value]
    return ugettext('Has the {} modifier').format(modifier)


def _localize_has_not_modifier(value):
    modifier = localization_map[value]
    return ugettext('Does NOT have the {} modifier').format(modifier)


def _localize_is_country_type(value):
    return ugettext('Is of the {} country type').format(value)


def _localize_ideal_planet_class(value):
    return ugettext('Is ideal class').format(value)


def _localize_is_planet_class(value):
    planet_class = localization_map[value]
    return ugettext('Is {}').format(planet_class)


def _localize_has_government(value):
    government = localization_map[value]
    return ugettext('Has {}').format(government)


def _localize_is_colony(value):
    return ugettext('Is a Colony') if value == 'yes' \
        else ugettext('Is NOT a Colony')


def _localize_allows_slavery(value):
    return ugettext('Allows Slavery') if value == 'yes' \
        else ugettext('Does NOT allow Slavery')


def _localize_has_federation(value):
    return ugettext('Is in a Federation') if value == 'yes' \
        else ugettext('Is NOT in a Federation')

def _localize_num_owned_planets(value):
    operator, value = _operator_and_value(value)
    return ugettext('Number of owned planets is {} {}').format(operator, value)

def _localize_count_owned_pops(value):
    operator, value = _operator_and_value(value[1]['count'])
    return ugettext('Number of enslaved planets {} {}').format(operator, value)

def _localize_num_communications(value):
    operator, value = _operator_and_value(value)
    return ugettext('Number of owned planets is {} {}').format(operator, value)


def _localize_has_communications(value):
    return ugettext('Has communications with your Empire')


def _localize_is_ai(value):
    return ugettext('Is AI controlled') if value == 'yes' else ugettext('Is NOT AI controlled')


def _localize_is_same_species(value):
    localized_value = 'Dominant' \
                      if value.lower() == 'root' \
                         else localization_map[value]
    return ugettext('Is of the {} Species').format(localized_value)


def _localize_is_species(value):
    localized_value = 'Dominant' \
                      if value.lower() == 'root' \
                         else localization_map[value]
    article = 'an' if localized_value[0].lower() in 'aeiou' else 'a'

    return ugettext('Is {} {}').format(article, localized_value)


def _localize_is_species_class(value):
    localized_value = localization_map[value]
    article = 'an' if localized_value[0].lower() in 'aeiou' else 'a'

    return ugettext('Is {} {}').format(article, localized_value)


def _localize_is_enslaved(value):
        return ugettext('Pop is enslaved') if value == 'yes' else ugettext('Pop is NOT enslaved')


def _localize_years_passed(value):
    operator, value = _operator_and_value(value)
    return ugettext('Number of years since game start is {} {}').format(operator, value)


def _localize_not_years_passed(value):
    operator, value = _operator_and_value(value)
    return ugettext('Number of years since game start is NOT {} {}').format(operator, value)


def _localize_has_country_flag(value):
    return ugettext('Has {} country flag').format(value)


def _localize_has_not_country_flag(value):
    return ugettext('Does NOT have {} country flag').format(value)


def _localize_research_leader(values, negated=False):
    leader = ugettext('Research Leader ({})').format(_expert(values[0]['area'].title()))
    if negated:
        leader = ugettext('NOT ') + leader

    localized_conditions = []
    for condition in values[1:]:
        key = list(condition)[0]
        value = condition[key]
        localized_condition = {
            'has_trait': lambda: _localize_has_expertise(value),
            'has_level': lambda: _localize_has_level(value),
            'OR' : lambda: _localize_or(values)
        }[key]()
        localized_conditions.append(localized_condition)

    return {leader: localized_conditions}


def _localize_not_research_leader(values):
    return _localize_research_leader(values, negated=True)


def _localize_has_level(value):
    operator, level = _operator_and_value(value)
    return ugettext('Skill level is {} {}').format(operator, level)

def _localize_has_expertise(value):
    expertise = localization_map[value]
    if expertise.startswith('Expertise'):
        truncated = expertise.replace('Expertise: ', '')
        condition = ugettext('Is {} Expert').format(truncated)
    else:
        condition = ugettext('Is {}').format(expertise)

    return condition

def _localize_area(value):
    # WTF is this?
    # Version 1.3 and earlier
    return ugettext('physics') if value == 'physics' else ''

def _localize_any_system_within_border(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any System within Borders'): parsed_values}

def _localize_not_any_system_within_border(values):
    # Version 1.3 and earlier
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('NOT Any System within Borders'): parsed_values}

def _localize_is_in_cluster(value):
    return ugettext('Is in a {} Cluster').format(value)


def _localize_any_country(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any Country'): parsed_values}

def _localize_any_relation(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any Relation'): parsed_values}

def _localize_any_owned_pop(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any empire Pop'): parsed_values}

def _localize_not_any_owned_pop(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('NOT any owned Pop'): parsed_values}


def _localize_any_owned_planet(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any owned Planet'): parsed_values}


def _localize_any_planet(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any Planet'): parsed_values}


def _localize_not_any_owned_planet(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('NOT any owned Planet'): parsed_values}


def _localize_any_tile(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any Tile'): parsed_values}


def _localize_has_blocker(value):
    blocker = localization_map[value]
    return ugettext('Has {} Tile Blocker').format(blocker)


def _localize_any_neighbor_country(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any Neighbor Country'): parsed_values}


def _localize_has_resource(value):
    resource, amount = value[0]['type'], value[1]['amount']
    operator, amount = _operator_and_value(amount)
    localized_resource = localization_map[resource]

    return ugettext('Has {} {} {}').format(operator, amount, localized_resource)

def _localize_has_any_megastructure_in_empire(value):
    return ugettext('Has any megastructure in empire') if value == 'yes' else ugettext('Does NOT have any megastructure in empire')

def _localize_is_ftl_restricted(value):
    return ugettext('Is FTL restricted') if value == 'yes' else ugettext('Is NOT FTL restricted')

def _localize_has_not_authority(value):
    localized_machine_intelligence = localization_map[value]
    return ugettext('{} has NOT authority').format(localized_machine_intelligence)

def _localize_has_not_policy_flag(value):
    # Version 1.3 and earlier
    return ugettext('{} Slavery for all species').format(localization_map[value])

def _localize_not_is_same_species(value):
    # ROOT
    # I don't know what's this, I didn't play launch version before
    # Version 1.0 only
    return ugettext('Is NOT same species with ROOT species')

def _localize_always(value):
    return ugettext('Always') if value == 'yes' else ugettext('Never')


def _localize_and(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('All of the following'): parsed_values}


def _localize_or(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any of the following'): parsed_values}


def _localize_nor(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('None of the following'): parsed_values}


def _localize_not(value):
    key = list(value[0])[0]
    nested_value = value[0][key]

    if key == 'OR':
        # Redirect to localization of NOR:
        negation = _parse_condition({'NOR': nested_value})
    else:
        negated_key = key.replace('has_', 'has_not_') if 'has_' in key \
                      else 'not_' + key
        negated_condition = {negated_key: value[0][key]}
        negation = _parse_condition(negated_condition)

    return negation


def _operator_and_value(data):
    if type(data) is int:
        operator = ugettext('equal to')
        value = data
    elif type(data) is dict:
        operator = {
            '>': ugettext('greater than'),
            '<': ugettext('less than')
        }[list(data)[0]]
        value = next(iter(data.values()))

    return operator, value
