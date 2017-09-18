class TileBlocker:
    def __init__(self, tile_blocker, loc_data):
        self.key = tile_blocker.keys()[0]
        self.name = loc_data.get(self.key, self.key)
        blocker_data = tile_blocker[self.key]
        self.prerequisites = self._prerequisites(blocker_data)

    def _prerequisites(self, blocker_data):
        try:
            prerequisites = next(iter(
                subkey for subkey in blocker_data
                if subkey.keys()[0] == 'prerequisites'
            ))['prerequisites']
        except (StopIteration):
            prerequisites = []

        return prerequisites
