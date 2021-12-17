class Cards
  CARDS = %w[T 2 3 4 5 6 7 8 9 10 J Q K].freeze
  CARD_SUITS = %w[<3 <> + ^].freeze

  attr_reader :card

  def initialize
    @card = designate
  end

  def designate
    CARDS[rand(CARDS.length)].concat(CARD_SUITS[rand(CARD_SUITS.length)])
  end
end
