class Army:
    def __init__(self, army, loc_data):
        self.key = next(iter(army))
        self.name = loc_data.get(self.key, self.key)
        army_data = army[self.key]
        self.prerequisites = self._prerequisites(army_data)

    def _prerequisites(self, army_data):
        try:
            prerequisites = next(iter(
                subkey for subkey in army_data
                if next(iter(subkey)) == 'prerequisites'
            ))['prerequisites']
        except (StopIteration):
            prerequisites = []

        return prerequisites
