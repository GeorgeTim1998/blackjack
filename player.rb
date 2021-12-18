require_relative 'require'
class Player
  attr_reader :cards, :money

  def initialize(name)
    @name = name
    @cards = [Deck.new, Deck.new]
    @money = Bank.new
  end

  def hit
    @cards << Deck.new
  end

  def stand
    True
  end

  def open_cards
    True
  end
end
