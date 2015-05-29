
local physics = require( "physics" )
local gameUI = require("gameUI")
Deck = {

showcard,
trefle = {},
pique = {},
coeur = {},
carreau = {},
physics = require( "physics" )
}
function Deck:new(id)
    print('New Deck is created: ' .. tostring(id))
    	local instance = {}
	setmetatable(instance, self)
	self.__index = self
    self:addFamily('trefle')
    self:addFamily('pique')
    self:addFamily('coeur')
    self:addFamily('carreau')
    --print(tostring(self.trefle.Z2.png))
    return self
end

function Deck:showCard(familyName, number)
    print("Deck:showCard : " .. familyName, number)
--    local png = 'cards\\' .. tostring(familyName) .. tostring(Number)
--    local id_showcard = #self.showcard + 1
--    print('id showcard: ' ..id_showcard)
--    self.showcard[id_showcard] = display.newImage( 'crate.png', 120, 392 ) 
--    
--    physics:addBody( self.showcard[id_showcard] )
--    
--    self.showcard[id_showcard]:addEventListener( "touch", gameUI.dragBody ) -- Make the object draggable
--    self.showcard[id_showcard].isFixedRotation = true

local png = self[familyName][number]
print("showing this cards : " .. png)
local card = display.newImage( self[familyName][number], 120, 392 )
physics.addBody( card )
card:addEventListener( "touch", gameUI.dragBody ) -- Make the object draggable.

end

function Deck:test(tt)
    print ('test  ' .. tt)
end

function Deck:addFamily(familyName)
    print("creating family = " .. tostring(familyName))

    if familyName == 'trefle' then
        number = 1
        elseif familyName == 'pique' then
        number = 2
        elseif familyName == 'coeur' then
        number = 3
        elseif familyName == 'carreau' then
        number = 4
    end

    --Get the path of the .png
    print("F:\\GIT\\Karavan\\Korona2\\cards\\" .. tostring(number) .. '.png')
    local basePath = "F:\\GIT\\Karavan\\Korona2\\cards\\"
    
    self[familyName][1] = basePath .. tostring(number) .. '.png'
    self[familyName][2] = basePath .. tostring(number*2) .. '.png'
    self[familyName][3] = basePath .. tostring(number*3).. '.png'
    self[familyName][4] = basePath .. tostring(number*4).. '.png'
    self[familyName][5] = basePath .. tostring(number*5).. '.png'
    self[familyName][6] = basePath .. tostring(number*6).. '.png'
    self[familyName][7] = basePath .. tostring(number*7).. '.png'
    self[familyName][8] = basePath .. tostring(number*8).. '.png'
    self[familyName][9] = basePath .. tostring(number*9).. '.png'
    self[familyName][10] = basePath .. tostring(number*10).. '.png'
    self[familyName][11] = basePath .. tostring(number*11).. '.png'
    self[familyName][12] = basePath .. tostring(number*12).. '.png'
    self[familyName][13] = basePath .. tostring(number*13).. '.png'
    print(self[familyName][13])
end








------
-- --  An object of type Deck represents a deck of playing cards.  The deck
-- --  is a regular poker deck that contains 52 regular cards and that can
-- --  also optionally include two Jokers.
-- --
--Deck {
--
--    ----
--     -- An array of 52 or 54 cards.  A 54-card deck contains two Jokers,
--     -- in addition to the 52 cards of a regular poker deck.
--     --
--    Card[]
--
--    ----
--     -- Keeps track of the number of cards that have been dealt from
--     -- the deck so far.
--     --/
--    cardsUsed;
--
--    ----
--     -- Constructs a regular 52-card poker deck.  Initially, the cards
--     -- are in a sorted order.  The shuffle() method can be called to
--     -- randomize the order.  (Note that "new Deck()" is equivalent
--     -- to "new Deck(false)".)
--     --/
--    Deck() {
--        this(false);  // Just call the other constructor in this class.
--    }
--
--    ----
--     -- Constructs a poker deck of playing cards, The deck contains
--     -- the usual 52 cards and can optionally contain two Jokers
--     -- in addition, for a total of 54 cards.   Initially the cards
--     -- are in a sorted order.  The shuffle() method can be called to
--     -- randomize the order.
--     -- @param includeJokers if true, two Jokers are included in the deck; if false,
--     -- there are no Jokers in the deck.
--     --
--    public Deck(boolean includeJokers) {
--        if (includeJokers)
--            deck = new Card[54];
--        else
--            deck = new Card[52];
--        int cardCt = 0; // How many cards have been created so far.
--        for ( int suit = 0; suit <= 3; suit++ ) {
--            for ( int value = 1; value <= 13; value++ ) {
--                deck[cardCt] = new Card(value,suit);
--                cardCt++;
--            }
--        }
--        if (includeJokers) {
--            deck[52] = new Card(1,Card.JOKER);
--            deck[53] = new Card(2,Card.JOKER);
--        }
--        cardsUsed = 0;
--    }
--
--    ----
--     -- Put all the used cards back into the deck (if any), and
--     -- shuffle the deck into a random order.
--     --
--    public void shuffle() {
--        for ( int i = deck.length-1; i > 0; i-- ) {
--            int rand = (int)(Math.random()--(i+1));
--            Card temp = deck[i];
--            deck[i] = deck[rand];
--            deck[rand] = temp;
--        }
--        cardsUsed = 0;
--    }
--
--    ----
--     -- As cards are dealt from the deck, the number of cards left
--     -- decreases.  This function returns the number of cards that
--     -- are still left in the deck.  The return value would be
--     -- 52 or 54 (depending on whether the deck includes Jokers)
--     -- when the deck is first created or after the deck has been
--     -- shuffled.  It decreases by 1 each time the dealCard() method
--     -- is called.
--     --
--    public int cardsLeft() {
--        return deck.length - cardsUsed;
--    }
--
--    ----
--     -- Removes the next card from the deck and return it.  It is illegal
--     -- to call this method if there are no more cards in the deck.  You can
--     -- check the number of cards remaining by calling the cardsLeft() function.
--     -- @return the card which is removed from the deck.
--     -- @throws IllegalStateException if there are no cards left in the deck
--     --/
--    public Card dealCard() {
--        if (cardsUsed == deck.length)
--            throw new IllegalStateException("No cards are left in the deck.");
--        cardsUsed++;
--        return deck[cardsUsed - 1];
--        // Programming note:  Cards are not literally removed from the array
--        // that represents the deck.  We just keep track of how many cards
--        // have been used.
--    }
--
--    ----
--     -- Test whether the deck contains Jokers.
--     -- @return true, if this is a 54-card deck containing two jokers, or false if
--     -- this is a 52 card deck that contains no jokers.
--     --
--    public boolean hasJokers() {
--        return (deck.length == 54);
--    }
--
--} -- end class Deck