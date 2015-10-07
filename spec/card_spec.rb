require 'card'

describe Card do
  let(:card) {Card.new(13, :H)}
  describe '#value' do

    it 'is given on creation' do
      expect(card.value).to eq(13)

    end

    it 'cannot be changed by the user' do
      expect{card.value = 15}.to raise_error
    end

  end

  describe '#suit' do

    it 'is given on creation' do
      expect(card.suit).to eq(:H)

    end

    it 'cannot be changed by the user' do
      expect{card.suit = :C}.to raise_error
    end


  end


end
