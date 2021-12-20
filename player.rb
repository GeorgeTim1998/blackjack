require_relative 'require'
class Player
  attr_reader :cards, :money
  attr_accessor :points

  def initialize(name)
    @name = name
    @cards = [Deck.new, Deck.new]
    @money = Bank.new
  end

  def hit
    @cards << Deck.new
  end

  def bet
    @money.deposit
  end

  def stand
    True
  end

  def open_cards
    True
  end

  def claim_winning(money)
    @money.deposit_winnings(money)
  end
end
