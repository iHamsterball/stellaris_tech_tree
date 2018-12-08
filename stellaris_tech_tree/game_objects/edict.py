class Edict:
    def __init__(self, edict_data, loc_data):
        name = self._name(edict_data)
        self.name = loc_data.get('edict_' + name, name)
        self.prerequisites = self._prerequisites(edict_data)

    def _name(self, edict_data):
        try:
            name = next(iter(
                subkey for subkey in edict_data if list(subkey)[0] == 'name'
            ))['name']
        except (StopIteration):
            # Where is your name?
            name = ""
        return name

    def _prerequisites(self, edict_data):
        try:
            prerequisites = next(iter(
                subkey for subkey in edict_data
                if list(subkey)[0] == 'prerequisites'
            ))['prerequisites']
        except (StopIteration):
            prerequisites = []

        return prerequisites
