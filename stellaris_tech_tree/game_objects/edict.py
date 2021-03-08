class Edict:
    def __init__(self, edict, loc_data):
        key = list(edict)[0]
        edict_data = edict.get(key)
        name = self._name(key, edict_data)
        self.name = loc_data.get('edict_' + name, name)
        self.prerequisites = self._prerequisites(edict_data)

    def _name(self, key, edict_data):
        try:
            name = next(iter(
                subkey for subkey in edict_data
                if list(subkey)[0] == 'name'
            ))['name'] if key in ['country_edict', 'planet_edict'] else key
            print(name)
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
