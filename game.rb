require_relative 'require'
class Blackjack
  attr_reader :player, :dealer, :player_points, :dealer_points

  COUNT_POINTS = { 'T': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9, '10': 10,
                   'J': 10, 'Q': 10, 'K': 10 }.freeze
  WINING_POINTS = 21
  DEALER_ACTION = 17

  def initialize(name)
    @player = Player.new(name)
    @player.points = value_cards(@player)

    @dealer = Player.new('Dealer')
    @dealer.points = value_cards(@dealer)
  end

  def value_usual(player)
    sum = 0
    player.cards.each { |card_obj| sum += COUNT_POINTS[card_obj.card[0].to_sym] }
    sum
  end

  def how_many_aces?(cards)
    ace_amount = 0
    cards.each { |card_obj| ace_amount += 1 if card_obj.card[0] == 'T' }
    ace_amount
  end

  def value_cards(player)
    case how_many_aces? player.cards
    when 0
      value_usual(player)
    when 1
      value_more_card_then_aces(player)
    when 2
      value_cards_2_aces(player)
    else
      value_cards_3_aces
    end
  end

  def value_cards_2_aces(player)
    if player.cards.length == 2
      11 + 1
    else
      value_more_card_then_aces(player)
    end
  end

  def value_more_card_then_aces(player)
    min_value = value_usual(player)
    max_value = min_value + 10

    if max_value > WINING_POINTS
      min_value
    else
      max_value
    end
  end

  def value_cards_3_aces
    11 + 1 + 1
  end

  def hit(player)
    player.hit if player.cards.length < 3
    player.points = value_cards(player)
  end

  def stats # delete later
    puts @player.cards.inspect.red
    puts "#{@player.points}".red

    puts @dealer.cards.inspect.blue
    puts "#{@dealer.points}".blue
  end

  def dealer_action
    if @dealer.points >= DEALER_ACTION
      @dealer.stand
    else
      hit(@dealer)
      @dealer.open_cards
    end
  end
end
