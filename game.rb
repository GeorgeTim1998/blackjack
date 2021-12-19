require_relative 'require'
class Blackjack
  attr_reader :player, :dealer, :player_points, :dealer_points

  COUNT_POINTS = { 'T': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9, '10': 10,
                   'J': 10, 'Q': 10, 'K': 10, 'T*': 11 }.freeze # del 'T*'

  def initialize(name)
    @player = Player.new(name)
    @player_points = value_cards(@player)

    @dealer = Player.new('Dealer')
    @dealer_points = value_cards(@dealer)
  end

  def value_cards_no_ace(player)
    sum = 0
    player.cards.each { |card_obj| sum += COUNT_POINTS[card_obj.card[0].to_sym] }
    sum
  end

  def ace?(cards)
    ace_present = false
    cards.each { |card_obj| ace_present = true if card_obj.card[0] == 'T' }
    ace_present
  end

  def ace2?(cards)
    ace_amount = 0
    cards.each { |card_obj| ace_amount += 1 if card_obj.card[0] == 'T' }
    ace_amount
  end

  def value_cards(player)
    if ace? player.cards
      puts 'here'
      value_cards_ace(player)
    else
      puts 'there'
      value_cards_no_ace(player)
    end
  end

  def value_cards_ace(player)
    value_no_ace = value_cards_no_ace(player)
    value_ace = value_no_ace + 10
  end
end
