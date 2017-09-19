class Resource:
    def __init__(self, resource, loc_data):
        self.key = list(resource)[0]
        self.name = loc_data.get(self.key, self.key)
        resource_data = resource[self.key]
        self.prerequisites = self._prerequisites(resource_data)

    def _prerequisites(self, resource_data):
        try:
            prerequisites = next(iter(
                subkey for subkey in resource_data
                if list(subkey)[0] == 'prerequisites'
            ))['prerequisites']
        except (StopIteration):
            prerequisites = []

        return prerequisites
