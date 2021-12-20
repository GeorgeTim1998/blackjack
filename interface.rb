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

    game_body
  end

  def interface_gets
    puts 'Your action is: '.blue
    gets.chomp
  end

  def game_body
    action_puts
    loop do
      if tree_cards_each?(@game.player, @game.dealer)
        put_endgame_stats(@game.player, @game.dealer)
        who_won?(@game.player.points, @game.dealer.points)
        break
      else
        action = interface_gets
        switch_player_action(action)
      end
    end
  end

  def switch_player_action(action)
    case action
    when 0
      @game.dealer_action
    when 1
      @game.hit(@game.player)
      put_game_stats(@game.player, @game.dealer)
      @game.dealer_action
    when 3
      put_endgame_stats(@game.player, @game.dealer)
    else
      warning!
    end
  end

  def put_game_stats(player, dealer)
    puts "Your cards: #{player.cards.inspect}".red
    puts "Points: #{player.points}".red

    mask_dealer_cards(dealer.cards)
  end

  def put_endgame_stats(player, dealer)
    puts "Your cards: #{player.cards.inspect}".red
    puts "Points: #{player.points}".red

    puts "Your cards: #{dealer.cards.inspect}".yellow
    puts "Points: #{dealer.points}".yellow

    who_won?
  end

  def tree_cards_each?(player, dealer)
    player.cards.length == 3 && dealer.cards.length == 3
  end
  
  def who_won?(player_points, dealer_points)
    
  end

  def warning!
    puts 'No such action! Try again!'.light_blue
  end

  def mask_dealer_cards(cards)
    print 'Dealer cards: '.yellow
    cards.length.times { print '*'.yellow }
    puts
  end

  def action_puts
    puts 'You can perform several actions:'.blue
    puts 'Stand: 0'
    puts 'Hit: 1'
    puts 'Open cards: 2'
  end
end
