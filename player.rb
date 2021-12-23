require_relative 'require'
class Player
  attr_reader :cards, :money, :name
  attr_accessor :points

  def initialize(name, deck)
    @name = name
    @cards = [deck.designate, deck.designate]
    @money = Bank.new
  end

  def hit(deck)
    @cards << deck.designate
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

  def claim_money(money)
    @money.deposit_money(money)
  end
end
