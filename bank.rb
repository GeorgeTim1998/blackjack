class Bank
  attr_accessor :account

  def initialize
    @account = 100
  end

  def deposit
    @account -= 10 if possible?
  end

  def deposit_money(money)
    @account += money
  end

  def possible?
    @account >= 10
  end
end
