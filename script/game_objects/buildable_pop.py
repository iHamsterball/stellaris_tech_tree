import re

class BuildablePop:
    def __init__(self, buildable_pop, loc_data):
        self.key = buildable_pop.keys()[0]

        def localize(string):
            localized = loc_data[string] if type(string) is str \
                        else loc_data[string.group(1)]

            while '$' in localized:
                localized = re.sub(r'\$(\w+)\$', localize, localized)

            return localized

        self.name = localize(self.key)

        buildable_pop_data = buildable_pop[self.key]
        self.prerequisites = self._prerequisites(buildable_pop_data)

    def _prerequisites(self, buildable_pop_data):
        try:
            prerequisites = next(iter(
                subkey for subkey in buildable_pop_data
                if subkey.keys()[0] == 'prerequisites'
            ))['prerequisites']
        except (StopIteration):
            prerequisites = []

        return prerequisites
