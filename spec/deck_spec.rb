require 'deck'

describe Deck do
  let(:deck) {Deck.new}

  describe '#DECK_OF_CARDS' do
    it 'should be a hash of key value pairs' do
      expect(Deck::DECK_OF_CARDS).to be_instance_of(Hash)
    end
  end

  describe '#cards' do
    it "initialized with 52 items" do
      expect(deck.cards.size).to eq(52)
    end

    it "contains only card objects" do
      expect(deck.cards.all?{|card| card.is_a?(Card)}).to be true
    end

  end

  describe '#shuffle' do
    it 'shuffles cards randomly' do
      unshuffled_deck = Deck.new(false)
      expect(unshuffled_deck.shuffle_cards).to_not eq(unshuffled_deck)
    end

  end

  describe '#draw' do
    it 'should return an array of cards' do
      expect(deck.draw).to be_instance_of(Array)
    end

    it 'takes one card from the deck by default' do
      expect(deck.draw.length).to eq(1)
    end

    it 'takes specified number of cards' do
      expect(deck.draw(2).length).to eq(2)
      expect(deck.draw(4).length).to eq(4)
    end

    it 'returns [] for 0 cards' do
      expect(deck.draw(0)).to eq([])
    end

    it 'removes cards from deck when drawn' do
      deck.draw
      expect(deck.cards.size).to eq(51)
    end

    it 'cannot draw more than 5 cards from the deck at one time' do
      expect{deck.draw(6)}.to raise_error(DeckError)
    end

    it 'cannot draw negative number of cards' do
      expect{deck.draw(-1)}.to raise_error(DeckError)
    end

  end

end
