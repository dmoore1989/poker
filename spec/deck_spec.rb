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

  describe 'shuffle' do
    it 'shuffles cards randomly' do
      unshuffled_deck = Deck.new(false)
      expect(unshuffled_deck.shuffle_cards).to_not eq(unshuffled_deck)
    end

  end

end
