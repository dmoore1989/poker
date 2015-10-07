require_relative 'card'
class Deck
  attr_reader :cards

  CARD_VALUE = (2..14).to_a
  DECK_OF_CARDS = {:C => CARD_VALUE, :H => CARD_VALUE, :D => CARD_VALUE, :S => CARD_VALUE}

  def initialize(shuffle = true)
    @cards = create_deck
    shuffle_cards if shuffle
  end

  def create_deck
    deck = []
    DECK_OF_CARDS.each_key do |suit|
      DECK_OF_CARDS[suit].each do |value|
        deck << Card.new(value, suit)
      end

    end
    deck
  end

  def shuffle_cards
    cards.shuffle!
  end



end
