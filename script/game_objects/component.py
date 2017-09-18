class Component:
    def __init__(self, component_data, loc_data):
        self.key = self._key(component_data)
        self.name = loc_data.get(self.key, self.key)
        self.prerequisites = self._prerequisites(component_data)

    def _key(self, component_data):
        return next(iter(
            subkey for subkey in component_data if subkey.keys()[0] == 'key'
        ))['key']

    def _prerequisites(self, component_data):
        try:
            prerequisites = next(iter(
                subkey for subkey in component_data
                if subkey.keys()[0] == 'prerequisites'
            ))['prerequisites']
        except (StopIteration):
            prerequisites = []

        return prerequisites
