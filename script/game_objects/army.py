class Army:
    def __init__(self, army, loc_data):
        self.key = army.keys()[0]
        self.name = loc_data.get(self.key, self.key)
        army_data = army[self.key]
        self.prerequisites = self._prerequisites(army_data)

    def _prerequisites(self, army_data):
        try:
            prerequisites = next(iter(
                subkey for subkey in army_data
                if subkey.keys()[0] == 'prerequisites'
            ))['prerequisites']
        except (StopIteration):
            prerequisites = []

        return prerequisites
