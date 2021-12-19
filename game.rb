require_relative 'require'
class Blackjack
  attr_reader :player, :dealer, :player_points, :dealer_points

  COUNT_POINTS = { 'T': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9, '10': 10,
                   'J': 10, 'Q': 10, 'K': 10 }.freeze
  WINING_POINTS = 21

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

  def how_many_aces?(cards)
    ace_amount = 0
    cards.each { |card_obj| ace_amount += 1 if card_obj.card[0] == 'T' }
    ace_amount
  end

  def value_cards(player)
    aces = how_many_aces? player.cards
    case aces
    when 0
      value_cards_no_ace(player)
    when 1 || 2
      value_1_or_2_aces(player)
    else
      value_cards_3_aces
    end
  end

  def value_cards_2_aces(player)
    if player.cards.length == 2
      11 + 1
    else
      two_aces_3_cards_if(player)
    end
  end

  def value_cards_3_aces
    11 + 1 + 1
  end

  def value_1_or_2_aces(player)
    min_value = value_cards_no_ace(player)
    max_value = min_value + 10

    if max_value > WINING_POINTS
      min_value
    else
      max_value
    end
  end
end
