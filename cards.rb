require 'colorize'
class Deck
  # protected
  @@designated_cards = []

  CARDS = %w[T 2 3 4 5 6 7 8 9 10 J Q K].freeze
  CARD_SUITS = %w[<3 <> + ^].freeze

  attr_reader :card

  def initialize
    @card = designate
    @@designated_cards << @card
  end

  def designate
    # card = nil
    # loop do
    #   card = [CARDS[rand(CARDS.length)], CARD_SUITS[rand(CARD_SUITS.length)]]
    #   break unless @@designated_cards.include?(card) || @@designated_cards.length = 52
    # end
    card = generate
    card = generate while @@designated_cards.include? card
    card
  end

  def heh
    @@designated_cards.each { |item| puts(item[0]+item[1]) }
    puts @@designated_cards.length
  end

  def generate
    [CARDS[rand(CARDS.length)], CARD_SUITS[rand(CARD_SUITS.length)]]
  end
end
