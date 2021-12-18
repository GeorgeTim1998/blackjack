require_relative 'require'
class Player
  def initialize(name)
    @name = name
    @cards = [Cards.new, Cards.new]
  end
end
