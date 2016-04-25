#!/usr/bin/python

from random import randint,shuffle

class deck:

    '''Create Deck With All Suits'''
    def __init__(self):
        self.deck = []
        self.fulldeck = []
        self.type_card = ["H","S","D","C"]
        create_deck()
        self.player1_cards = []
        self.player2_cards = []
        
    def create_deck(self)
        for i in range(4):
            self.deck.extend(list(range(2,15)))
            self.fulldeck.extend([str(s)+" "+ str(self.type_card[i]) for s in self.deck])
            del self.deck[:]

class player_cards:

    def __init__(self):
        self.player1_cards = []
        self.player2_cards = []
        self.distribute()

    def distribute(self):
        self.player1_cards = deck.fulldeck[len(deck.fulldeck)/2:]
        self.player2_cards = deck.fulldeck[:len(deck.fulldeck)/2]    
deck_cards = deck()
