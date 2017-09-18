class ArmyAttachment:
    def __init__(self, attachment, loc_data):
        self.key = attachment.keys()[0]
        self.name = loc_data.get('army_attachment_' + self.key, self.key)
        attachment_data = attachment[self.key]
        self.prerequisites = self._prerequisites(attachment_data)

    def _prerequisites(self, attachment_data):
        try:
            prerequisites = next(iter(
                subkey for subkey in attachment_data
                if subkey.keys()[0] == 'prerequisites'
            ))['prerequisites']
        except (StopIteration):
            prerequisites = []

        return prerequisites
