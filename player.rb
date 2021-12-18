require_relative 'require'
class Player
  attr_reader :cards, :money

  def initialize(name)
    @name = name
    @cards = [Cards.new, Cards.new]
    @money = Bank.new
  end
end
