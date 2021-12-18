class Bank
  attr_accessor :account

  def initialize
    @account = 100
  end

  def bet
    @account -= 10
  end
end
