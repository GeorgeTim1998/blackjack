require_relative 'require'

class Interface
  attr_accessor :action, :end_game
  attr_reader :game

  def initialize
    puts 'Commensing the Blackjack game...'.green
    puts 'Enter your name:'.blue
    action = interface_gets
    @end_game = 0
    @game = Blackjack.new(action)
    put_game_stats(@game.player, @game.dealer)

    play

    initialize if try_again?
  end

  def play
    game_body
    endgame_stats(@game.player, @game.dealer)
    if @game.tie?
      puts "\nIt's a tie!"
      return_bets(@game.player, @game.dealer)
    else
      puts "\n#{@game.who_won?(@game.player, @game.dealer)} won!"
    end
  end

  def interface_gets
    puts 'Your action is: '.blue
    gets.chomp
  end

  def game_body
    loop do
      break if ending_game?

      player_action
      break if ending_game?

      puts "\nDealer acts:".yellow
      @game.dealer_action
      put_game_stats(@game.player, @game.dealer)
    end
  end

  def try_again?
    puts 'Wanna play again? y/n'
    action = interface_gets

    case action
    when 'y'
      true
    when 'n'
      false
    end
  end

  def ending_game?
    @game.three_cards_each?(@game.player, @game.dealer) || @end_game == 1
  end

  def player_action
    action_puts
    action = interface_gets
    switch_player_action(action, @game.player)
  end

  def switch_player_action(action, player)
    case action
    when '0'
      player.stand
    when '1'
      @game.hit(player)
      put_game_stats(player, @game.dealer)
    when '2'
      @end_game = 1
    else
      warning!
    end
  end

  def put_game_stats(player, dealer)
    puts "Your cards: #{player.cards.inspect}".red
    puts "Points: #{player.points}".red

    mask_dealer_cards(dealer.cards)
  end

  def endgame_stats(player, dealer)
    puts "\nGame is finished".blue
    puts "Your cards: #{player.cards.inspect}".red
    puts "Points: #{player.points}".red

    puts "Dealer cards: #{dealer.cards.inspect}".yellow
    puts "Points: #{dealer.points}".yellow
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
    puts "\nYou can perform several actions:".blue
    puts 'Stand: 0'
    puts 'Hit: 1'
    puts 'Open cards: 2'
  end
end
