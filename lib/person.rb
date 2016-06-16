require 'atm.rb'
require 'account.rb'


class Person

  attr_accessor :cash, :name, :account

  def initialize(attrs = {})
    @cash = 0
    @name = set_name(attrs[:name])
  end

  def create_account
    @account = Account.new(owner: self)
  end

  def deposit(amount)
    @account.nil? ? has_no_account : deposit_funds(amount)
  end

  def withdraw(args = {})
    @account.nil? ? has_no_account : withdraw_funds(args)
  end


  private
  def set_name(obj)
    obj.nil? ? missing_name : @name = obj
  end

  def missing_name
    raise 'A name is required'
  end

  def has_no_account
    raise RuntimeError, 'No account present'
  end

  def deposit_funds(amount)
    @cash -= amount
    @account.balance += amount
  end

  def withdraw_funds(args)
    atm = setting_atm(args)
    account = @account
    amount = args[:amount]
    pin = args[:pin]
    response = atm.withdraw(amount, pin, account)
    response[:status] == true ? increase_cash(response) : response
  end

  def missing_atm
    raise RuntimeError, 'An ATM is required'
  end

  def increase_cash(response)
    @cash += response[:amount]
  end

  def setting_atm(args)
    args[:atm].nil? ? missing_atm : args[:atm]
  end

end
