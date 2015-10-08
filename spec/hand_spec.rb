require 'hand'

describe Hand do
  let(:flush) { [Card.new(3, :H), Card.new(5, :H),Card.new(2, :H), Card.new(8, :H), Card.new(13, :H)] }
  let(:straight) { [Card.new(3, :H), Card.new(4, :S),Card.new(5, :H), Card.new(6, :H), Card.new(7, :H)] }
  let(:triple) { [Card.new(3, :S), Card.new(3, :H),Card.new(3, :H), Card.new(8, :H), Card.new(13, :H)] }
  let(:two_pair) { [Card.new(3, :H), Card.new(3, :H),Card.new(2, :H), Card.new(2, :S), Card.new(13, :H)] }
  let(:one_pair) { [Card.new(3, :H), Card.new(3, :H),Card.new(2, :S), Card.new(8, :H), Card.new(13, :H)] }
  let(:full_house) { [Card.new(3, :H), Card.new(3, :H),Card.new(3, :H), Card.new(8, :H), Card.new(8, :S)] }
  let(:straight_flush) { [Card.new(3, :H), Card.new(4, :H),Card.new(5, :H), Card.new(6, :H), Card.new(7, :H)] }
  let(:quad) { [Card.new(3, :H), Card.new(3, :H),Card.new(3, :H), Card.new(3, :S), Card.new(13, :H)] }
  let(:high) { [Card.new(3, :S), Card.new(5, :H),Card.new(2, :H), Card.new(8, :H), Card.new(13, :H)] }
  let(:royal) { [Card.new(10, :H), Card.new(11, :H),Card.new(12, :H), Card.new(13, :H), Card.new(14, :H)] }
  let(:ace_high) { [Card.new(10, :H), Card.new(11, :H),Card.new(12, :H), Card.new(13, :H), Card.new(14, :S)] }
  let(:ace_low) { [Card.new(3, :H), Card.new(5, :H),Card.new(2, :S), Card.new(4, :H), Card.new(14, :H)] }
  let(:hand) { Hand.new(flush) }


  describe '#initialize' do

    it 'sets the instance variable to the hand it was given' do
      expect(hand.cards).to eq(flush)
    end
  end


  describe 'evaluate' do

    context 'given a particular hand' do

      it 'returns high card' do
        expect(Hand.new(high).evaluate).to eq(:high)
      end

      it 'returns one pair' do
        expect(Hand.new(one_pair).evaluate).to eq(:one_pair)
      end

      it 'returns two pair' do
        expect(Hand.new(two_pair).evaluate).to eq(:two_pair)
      end

      it 'returns three of a kind' do
        expect(Hand.new(triple).evaluate).to eq(:triple)
      end

      it 'returns straight without ace' do
        expect(Hand.new(straight).evaluate).to eq(:straight)
      end

      it 'returns straight with high ace' do
        expect(Hand.new(ace_high).evaluate).to eq(:straight)
      end

      it 'returns straight with low ace' do
        expect(Hand.new(ace_low).evaluate).to eq(:straight)
      end


      it 'returns flush' do
        expect(Hand.new(flush).evaluate).to eq(:flush)
      end

      it 'returns full house' do
        expect(Hand.new(full_house).evaluate).to eq(:full_house)
      end

      it 'returns four of a kind' do
        expect(Hand.new(quad).evaluate).to eq(:quads)
      end

      it 'returns straight flush' do
        expect(Hand.new(straight_flush).evaluate).to eq(:straight_flush)
      end

      it 'returns royal flush' do
        expect(Hand.new(royal).evaluate).to eq(:royal_flush)
      end

    end
  end


end
