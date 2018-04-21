from ..deep_parsers.feature_unlocks import FeatureUnlocks
from ..deep_parsers.weight_modifiers import parse as parse_weight_modifiers
from json import JSONEncoder
import re


class Technology:
    def __init__(self, tech, armies, army_attachments, buildable_pops,
                 buildings, components, edicts, policies, resources,
                 spaceport_modules, tile_blockers, loc_data, at_vars):
        self.key = list(tech)[0]
        self._at_vars = at_vars
        self._loc_data = loc_data
        #self.name = loc_data.get(self.key, self.key)
        #print(self.key, self.name)

        tech_data = tech[self.key]

        self.name = self._name()
        self.description = self._description()
        self.area = next(iter(key for key in tech_data
                              if list(key)[0] == 'area'))['area']
        self.category = loc_data[
            next(iter(key for key in tech_data
                      if list(key)[0] == 'category'))['category'][0]
        ]

        self.tier = next(
            iter(key for key in tech_data if list(key)[0] == 'tier')
        )['tier']

        self.tier = self._is_repeatable_tech(tech_data)
        self.cost = self._cost(tech_data)
        self.base_weight = self._base_weight(tech_data)
        self.base_factor = self._base_factor(tech_data)
        self.weight_modifiers = self._weight_modifiers(tech_data)
        self.prerequisites = self._prerequisites(tech_data)
        self.is_start_tech = self._is_start_tech(tech_data)
        self.is_dangerous = self._is_dangerous(tech_data)
        self.is_rare = self._is_rare(tech_data)

        unlock_parser = FeatureUnlocks(armies, army_attachments,
                                       buildable_pops, buildings, components,
                                       edicts, policies, resources,
                                       spaceport_modules, tile_blockers,
                                       loc_data)
        self.feature_unlocks = unlock_parser.parse(self.key, tech_data)

    def _is_start_tech(self, tech_data):
        try:
            yes_no = next(iter(key for key in tech_data
                               if list(key)[0] == 'start_tech'))['start_tech']
            is_start_tech = True if yes_no == 'yes' else False
        except StopIteration:
            is_start_tech = True if self.tier == 0 else False

        return is_start_tech

    def _is_repeatable_tech(self, tech_data):
        string = next(iter(key for key
                           in tech_data
                           if list(key)[0] == 'tier'))['tier']
        return self._at_vars[string] if str(string).startswith('@') else string

    def _is_dangerous(self, tech_data):
        try:
            yes_no = next(iter(
                key for key in tech_data
                if list(key)[0] == 'is_dangerous'
            ))['is_dangerous']
            is_dangerous = True if yes_no == 'yes' else False
        except StopIteration:
            is_dangerous = False

        return is_dangerous

    def _is_rare(self, tech_data):
        try:
            yes_no = next(iter(key for key in tech_data
                               if list(key)[0] == 'is_rare'))['is_rare']
            is_rare = True if yes_no == 'yes' else False
        except StopIteration:
            is_rare = False

        return is_rare

    def _localize(self, key):
        return self._loc_data[key] if type(key) is str else self._loc_data[key.group(1)]

    def _name(self):
        name = ''
        try:
            name = self._loc_data[self.key]
            while '$' in name:
                name = re.sub(r'\$([\w\|\+=]+)\$', self._localize, name)
        except KeyError:
            pass
        return name

    def _description(self):
        try:
            description = self._loc_data[self.key + '_desc']
            while '$' in description:
                description = re.sub(r'\$([\w\|\+=]+)\$', self._localize, description)
            self.description = description
        except KeyError:
            description = None

        return description

    def _prerequisites(self, tech_data):
        if self.key in ['tech_biolab_1', 'tech_physics_lab_1',
                        'tech_engineering_lab_1']:
            prerequisites = ['tech_basic_science_lab_1']
        else:
            try:
                prerequisites = next(iter(
                    subkey for subkey in tech_data
                    if list(subkey)[0] == 'prerequisites'
                ))['prerequisites']
            except (StopIteration):
                prerequisites = []

        return prerequisites

    def _cost(self, tech_data):
        try:
            string = next(iter(key for key
                                in tech_data
                                if list(key)[0] == 'cost'))['cost']
        except StopIteration:
            string = '0'
        return self._at_vars[string] if str(string).startswith('@') else string

    def _base_weight(self, tech_data):
        try:
            string = next(iter(key for key
                               in tech_data
                               if list(key)[0] == 'weight'))['weight']
            weight = (self._at_vars[string]
                      if str(string).startswith('@')
                      else string)
        except StopIteration:
            weight = 0

        return weight

    def _base_factor(self, tech_data):
        try:
            string = next(
                iter(key for key in tech_data
                     if list(key)[0] == 'weight_modifier')
            )['weight_modifier'][0]['factor']
            factor = (self._at_vars[string]
                      if str(string).startswith('@')
                      else string)
        except (StopIteration, KeyError, IndexError):
            factor = 1.0

        return float(factor)

    def _weight_modifiers(self, tech_data):
        try:
            unparsed_modifiers = next(iter(
                key for key in tech_data if list(key)[0] == 'weight_modifier'
            ))['weight_modifier']
        except StopIteration:
            unparsed_modifiers = []

        return [parse_weight_modifiers(modifier['modifier'], self._loc_data)
                for modifier in unparsed_modifiers
                if list(modifier) == ['modifier']]


class TechnologyJSONEncoder(JSONEncoder):
    def default(self, object):
        if isinstance(object, Technology):
            encoder = {key: getattr(object, key) for key
                       in list(object.__dict__.keys())
                       if not key.startswith('_')}
        else:
            encoder = JSONEncoder.default(self, object)

        return encoder
