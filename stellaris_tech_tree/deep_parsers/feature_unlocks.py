# -*- coding: utf-8 -*-

from django.utils.translation import ugettext
import re

class FeatureUnlocks:
    def __init__(self, armies, army_attachments, buildable_pops, buildings,
                 components, edicts, policies, resources, spaceport_modules,
                 tile_blockers, loc_data):
        self._armies = armies
        self._army_attachments = army_attachments
        self._buildable_pops = buildable_pops
        self._buildings = buildings
        self._components = components
        self._edicts = edicts
        self._policies = policies
        self._resources = resources
        self._spaceport_modules = spaceport_modules
        self._tile_blockers = tile_blockers

        def __localize(alt_key):
            return loc_data[alt_key]

        def _localize(string):
            print(string, type(string))
            try:
                localized = loc_data[string] if type(string) is str \
                            else loc_data[string.group(1)]
            except KeyError:
                if isinstance(string, str):
                    prefix = 'MOD_'
                    key = string
                    alt_key = (prefix + key).upper()
                    try:
                        localized = __localize(alt_key)
                    except KeyError:
                        prefix = 'MOD_COUNTRY_'
                        alt_key = (prefix + key).upper()
                        try:
                            localized = __localize(alt_key)
                        except KeyError:
                            prefix = 'MOD_POP_'
                            alt_key = (prefix + key).upper()
                            try:
                                localized = __localize(alt_key)
                            except KeyError:
                                prefix = 'MOD_PLANET_'
                                alt_key = (prefix + key).upper()
                                try:
                                    localized = __localize(alt_key)
                                except KeyError:
                                    # Give up.
                                    localized = string
                else:
                    localized = _localize('tech_gene_tailoring_POINTS')

            while '$' in localized:
                print(localized)
                localized = re.sub(r'\$([\w\|\+=]+)\$', _localize, localized)

            return localized

        self._localize = _localize

    # Modifiers gained as a result of completing research
    def parse(self, tech_key, tech_data):
        feature_flags = self._feature_flags(tech_data)
        custom_unlock_tooltip = self._unlocks(tech_data)
        unlocks = self._modifiers(tech_data) \
                  + custom_unlock_tooltip + feature_flags \
                  + ([] if custom_unlock_tooltip != []
                     else self._army_unlocks(tech_key)
                     + self._army_attachment_unlocks(tech_key)
                     + self._buildable_pop_unlocks(tech_key)
                     + self._building_unlocks(tech_key)
                     + feature_flags
                     + self._component_unlocks(tech_key)
                     + self._edict_unlocks(tech_key)
                     + self._policy_unlocks(tech_key)
                     + self._resource_unlocks(tech_key)
                     + self._spaceport_module_unlocks(tech_key)
                     + self._tile_blocker_unlocks(tech_key))

        return unlocks

    def _modifiers(self, tech_data):

        def localize(modifier):
            key = list(modifier)[0]
            try:
                value = ('{:+.0%}'.format(modifier[key])
                        if modifier[key] < 1
                        or int(modifier[key]) != modifier[key]
                        else '{:+d}'.format(int(modifier[key])))
            except TypeError:
                try:
                    value = self._localize(modifier[key])
                except AttributeError:
                    #description_parameters
                    value = ''

            if key == 'all_technology_research_speed':
                key = 'MOD_COUNTRY_ALL_TECH_RESEARCH_SPEED'
            elif key == 'science_ship_survey_speed':
                key = 'MOD_SHIP_SCIENCE_SURVEY_SPEED'

            localized = {self._localize(key): value}

            return '{}: {}'.format(next(iter(localized)), next(iter(localized.values())))

        try:
            acquired_modifiers = [localize(modifier) for modifier in next(iter(
               attribute for attribute in tech_data
               if list(attribute)[0] == 'modifier'
            ))['modifier']]
        except (StopIteration):
            acquired_modifiers = []

        return acquired_modifiers


    def _unlocks(self, tech_data):
        def localize(string):
            try:
                relocalize = lambda match: self._localize(match.group(1))
                localized = re.sub(r'\$(\w+)\$', relocalize,
                                   self._localize(string))
            except KeyError:
                localized = string

            return localized

        try:
            unlock_types = [unlock_type for unlock_type in next(iter(
                attribute for attribute in tech_data
                if list(attribute)[0] == 'prereqfor_desc'
            ))['prereqfor_desc']]
            feature_unlocks = [localize(list(unlock.values())[0][0]['title'])
                               for unlock in unlock_types]
        except (StopIteration):
            feature_unlocks = []

        return feature_unlocks

    def _feature_flags(self, tech_data):
        try:
            feature_flags = [
                ugettext('Unlocks Feature: ') + self._localize('feature_' + feature_flag)
                for feature_flag
                in next(iter(
                    attribute for attribute in tech_data
                    if list(attribute)[0] == 'feature_flags'
                ))['feature_flags']
            ]
        except (StopIteration):
            feature_flags = []

        return feature_flags

    def _army_unlocks(self, tech_key):
        unlocked_armies = [army for army in self._armies
                              if tech_key in army.prerequisites]
        return [ugettext('Unlocks Army: {}').format(army.name)
                for army in unlocked_armies]

    def _army_attachment_unlocks(self, tech_key):
        unlocked_attachments = [attachment for attachment
                                in self._army_attachments
                                if tech_key in attachment.prerequisites]
        return [ugettext('Unlocks Attachment: {}').format(attachment.name)
                for attachment in unlocked_attachments]

    def _buildable_pop_unlocks(self, tech_key):
        unlocked_buildable_pops = [buildable_pop for buildable_pop
                                   in self._buildable_pops
                                   if tech_key in buildable_pop.prerequisites]
        return [ugettext('Unlocks Buildable Pop: {}').format(buildable_pop.name)
                for buildable_pop in unlocked_buildable_pops]

    def _building_unlocks(self, tech_key):
        unlocked_buildings = [building for building in self._buildings
                              if tech_key in building.prerequisites]
        return [ugettext('Unlocks Building: {}').format(building.name)
                for building in unlocked_buildings]

    def _component_unlocks(self, tech_key):
        unlocked_components = [component for component in self._components
                              if tech_key in component.prerequisites]
        return [ugettext('Unlocks Component: {}').format(component.name)
                for component in unlocked_components]

    def _edict_unlocks(self, tech_key):
        unlocked_edicts = [edict for edict in self._edicts
                              if tech_key in edict.prerequisites]
        return [ugettext('Unlocks Edict: {}').format(edict.name)
                for edict in unlocked_edicts]

    def _policy_unlocks(self, tech_key):
        def relevant_options(policy):
            return [{'name': option.name,
                     'policy_name': policy.name }
                    for option in policy.options
                    if tech_key in option.prerequisites]

        unlocked_options = [option for options
                            in [relevant_options(policy)
                                for policy in self._policies]
                            for option in options]

        return [ugettext('Unlocks Policy: {} - {}').format(option['policy_name'],
                                                 option['name'])
                for option in unlocked_options]

    def _resource_unlocks(self, tech_key):
        unlocked_resources = [resource for resource in self._resources
                              if tech_key in resource.prerequisites]
        return [ugettext('Reveals Resource: {} ([[{}]])').format(resource.name,
                                                       resource.key)
                for resource in unlocked_resources]

    def _spaceport_module_unlocks(self, tech_key):
        unlocked_modules = [module for module in self._spaceport_modules
                            if tech_key in module.prerequisites]
        return [ugettext('Unlocks Module: {}').format(module.name)
                for module in unlocked_modules]

    def _tile_blocker_unlocks(self, tech_key):
        unlocked_blockers = [blocker for blocker in self._tile_blockers
                             if tech_key in blocker.prerequisites]
        return [ugettext('Clear Blockers: {}').format(blocker.name)
                for blocker in unlocked_blockers]
