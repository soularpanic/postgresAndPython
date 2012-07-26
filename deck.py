class Deck:
    def __init__(self, name, cards={}):
        self.name = name
        self.cards = cards

    def addCard(self, cardName, quantity=1):
        if cardName in self.cards:
            self.cards[cardName] += quantity
        else:
            self.cards[cardName] = quantity

    def removeCard(self, cardName, quantity=1):
        if cardName in self.cards:
            self.cards[cardName] -= quantity
            if self.cards[cardName] <= 1:
                del self.cards[cardName]
