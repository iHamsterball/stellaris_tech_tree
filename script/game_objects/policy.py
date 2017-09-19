from pprint import pprint
import sys

class Policy:
    def __init__(self, policy, loc_data):
        self.key = list(policy)[0]
        self.name = loc_data.get('policy_' + self.key, self.key)
        self._loc_data = loc_data

        policy_data = policy[self.key]
        self.options = self._options(policy_data, loc_data)

    def _options(self, policy_data, loc_data):
        return [Option(entry['option'], loc_data)
                for entry in policy_data
                if list(entry)[0] == 'option']


class Option:
    def __init__(self, option_data, loc_data):
        self.name = self._name(option_data, loc_data)
        self.prerequisites = self._prerequisites(option_data)


    def _name(self, option_data, loc_data):
        unlocalized = next(iter(
            subkey for subkey in option_data if list(subkey)[0] == 'name'
        ))['name']

        return loc_data[unlocalized]

    def _prerequisites(self, option_data):
        try:
            prerequisites = next(iter(
                subkey for subkey in option_data
                if list(subkey)[0] == 'prerequisites'
            ))['prerequisites']
        except (StopIteration):
            prerequisites = []

        return prerequisites
