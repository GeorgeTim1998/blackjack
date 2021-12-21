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

  def claim_money(money)
    @money.deposit_money(money)
  end
end
