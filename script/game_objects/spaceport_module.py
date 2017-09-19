class SpaceportModule:
    def __init__(self, spaceport_module, loc_data):
        self.key = list(spaceport_module)[0]
        self.name = loc_data.get('sm_' + self.key, self.key)
        module_data = spaceport_module[self.key]
        self.prerequisites = self._prerequisites(module_data)

    def _prerequisites(self, module_data):
        try:
            prerequisites = next(iter(
                subkey for subkey in module_data
                if list(subkey)[0] == 'prerequisites'
            ))['prerequisites']
        except (StopIteration):
            prerequisites = []

        return prerequisites
