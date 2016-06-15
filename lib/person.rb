require 'atm.rb'
require 'account.rb'


class Person

  attr_reader :cash, :name, :account

  def initialize(attrs = {})
    @cash = 0
    @name = set_name(attrs[:name])
  end


  def create_account
    @account = Account.new(owner: self)
  end

  def deposit(amount)
    @account.balance += amount
  end



  private
  def set_name(obj)
    obj == nil ? missing_name : @name = obj
  end

  def missing_name
    raise 'A name is required'
  end

end
