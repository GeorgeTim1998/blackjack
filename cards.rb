class Cards
  CARDS = %w[T 2 3 4 5 6 7 8 9 10 J Q K].freeze
  CARDS_AMOUNT = 13
  CARD_SUITS = %w[<3 <> + ^].freeze
  CARD_SUITS_AMOUNT = 4

  attr_writer :card

  def initialize
    @card = designate
  end

  def designate
    CARDS[rand(CARDS_AMOUNT)].concat(CARD_SUITS[rand(CARD_SUITS_AMOUNT)])
  end
end
