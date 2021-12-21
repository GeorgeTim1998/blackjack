require_relative 'require'
class Player
  attr_reader :cards, :money, :name
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
    true
  end

  def open_cards
    true
  end

  def claim_winning(money)
    @money.deposit_winnings(money)
  end
end
