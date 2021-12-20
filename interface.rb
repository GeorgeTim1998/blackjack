require_relative 'require'

class Interface
  attr_accessor :action
  attr_reader :game

  def initialize
    puts 'Commensing the Blackjack game...'.green
    puts 'Enter your name:'.blue
    action = interface_gets

    @game = Blackjack.new(action)
    put_game_stats

    game_body(game)
  end

  def interface_gets
    puts 'Your action is: '.blue
    gets.chomp
  end

  def game_body(game)
    game_puts

    loop do
      interface_gets

    end
  end

  def put_game_stats
    puts "Your cards: #{@game.player.cards.inspect}".red
    puts "Points: #{@game.player.points}".red

    mask_dealer_cards(@game.dealer.cards)
  end

  def mask_dealer_cards(cards)
    print 'Dealer cards: '.yellow
    cards.length.times { print '*'.yellow }
    puts
  end

  def game_puts
    puts 'You can perform several actions:'.blue
    puts 'Stand: 0'
    puts 'Hit: 1'
    puts 'Open cards: 2'
  end
end
