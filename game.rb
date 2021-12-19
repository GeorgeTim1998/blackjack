require_relative 'require'
class Blackjack
  attr_reader :player, :dealer

  COUNT_POINTS = { 'T': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9, '10': 10,
                   'J': 10, 'Q': 10, 'K': 10, 'T*': 11 }.freeze

  def initialize(name)
    @player = Player.new(name)
    @dealer = Player.new('Dealer')
  end

  def value_player_cards(player)
    sum = 0
    player.cards.each { |card_obj| sum += COUNT_POINTS[card_obj.card[0].to_sym] }
    sum
  end
end
