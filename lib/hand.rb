require_relative 'card'

class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def evaluate
    if royal_flush?
      :royal_flush
    elsif straight_flush?
      :straight_flush
    elsif quads?
      :quads
    elsif full_house?
      :full_house
    elsif flush?
      :flush
    elsif straight?
      :straight
    elsif triple?
      :triple
    elsif two_pair?
      :two_pair
    elsif one_pair?
      :one_pair
    else
      :high
    end

  end

  def values
    cards.map(&:value)
  end

  def suits
    cards.map(&:suit)
  end

  def one_pair?
    values.any? {|value| values.count(value) == 2}
  end

  def two_pair?
    pairs =values.select {|value| values.count(value) == 2}
    pairs.length == 4
  end

  def triple?
    values.any? { |value| values.count(value) == 3 }
  end

  def straight?
    return true if values.sort == [2,3,4,5,14]

    values.each_with_index do |value, index|
      next if index == values.size - 1
      return false unless values[index+1] - values[index] == 1
    end
    true
  end

  def flush?
    suits.count(suits.first) == 5
  end

  def full_house?
    triple? && one_pair?
  end

  def quads?
    values.any? { |value| values.count(value) == 4 }
  end

  def straight_flush?
    flush? && straight?
  end

  def royal_flush?
    values.sort == [10, 11, 12, 13, 14] && flush?
  end
end
