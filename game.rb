require_relative 'require'
class Blackjack
  attr_reader :player, :dealer, :player_points, :dealer_points

  COUNT_POINTS = { 'T': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9, '10': 10,
                   'J': 10, 'Q': 10, 'K': 10 }.freeze 
  WINING_POINTS = 21.freeze

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
    when 1
      value_cards_one_ace(player)
    when 2
      value_cards_2_aces(player)
    else
      value_cards_3_aces
    end
  end

  def value_cards_1_ace(player)
    value_no_ace = value_cards_no_ace(player)
    value_ace = value_no_ace + 10

    if value_ace > WINING_POINTS
      value_no_ace
    else
      value_ace
    end
  end

  def value_cards_2_aces(player)
    
  end

  def value_cards_3_aces
    11 + 1 + 1
  end
end
