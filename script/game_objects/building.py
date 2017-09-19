class Building:
    def __init__(self, building, loc_data):
        self.key = list(building)[0]
        self.name = loc_data.get(self.key, self.key)

        building_data = building[self.key]
        self.prerequisites = self._prerequisites(building_data)

    def _prerequisites(self, building_data):
        try:
            prerequisites = next(iter(
                subkey for subkey in building_data
                if list(subkey)[0] == 'prerequisites'
            ))['prerequisites']
        except (StopIteration):
            prerequisites = []

        return prerequisites
