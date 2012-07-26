import unittest
import deck as d

class DeckTest(unittest.TestCase):
    def setUp(self):
        self.seedCards = { 'Lightning Bolt': 3,
                           'Mountain': 20,
                           'Jackal Pup': 4 }
        self.deck = d.Deck('Sligh', self.seedCards)

    def testDefaultConstructor(self):
        deckName = 'RDW'
        defaultCards = {}
        deck = d.Deck(deckName)
        self.assertEquals(deckName, deck.name)
        self.assertEquals(defaultCards, deck.cards)

    def testCardConstructor(self):
        deckName = 'MBC'
        seedCards = {'Barter in Blood': 3}
        deck = d.Deck(deckName, seedCards)
        self.assertEquals(deckName, deck.name)
        self.assertEquals(seedCards, deck.cards)

    def testAddCard(self):
        cardName = 'Goblin Arsonist'
        self.deck.addCard(cardName)
        self.assertEquals(1, self.deck.cards[cardName])

    def testAddMultipleCards(self):
        cardName = 'Goblin Arsonist'
        quantity = 3
        self.deck.addCard(cardName, quantity)
        self.assertEquals(quantity, self.deck.cards[cardName])

    def testRemoveCard(self):
        cardName = 'Jackal Pup'
        expectedQuantity = self.deck.cards[cardName] - 1
        self.deck.removeCard(cardName)
        self.assertEquals(expectedQuantity, self.deck.cards[cardName])

    def testRemoveMultipleCards(self):
        cardName = 'Jackal Pup'
        numberToCut = 2
        expectedQuantity = self.deck.cards[cardName] - numberToCut
        self.deck.removeCard(cardName, numberToCut)
        self.assertEquals(expectedQuantity, self.deck.cards[cardName])


    def testRemoveAllCards(self):
        cardName = 'Mountain'
        numberToCut = 9001
        self.deck.removeCard(cardName, numberToCut)
        self.assertFalse(cardName in self.deck.cards)


if __name__ == '__main__':
    unittest.main()
