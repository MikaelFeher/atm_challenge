class Account

  attr_reader :pin_code, :balance, :account_status, :exp_date

  STANDARD_VALIDITY_YEARS = 5

  def initialize
    @pin_code = rand(1000..9999)
    @balance = 0
    @exp_date = set_exp_date
    @account_status = :active

  end

  def deactivate
    @account_status = :deactivated
  end

  private
  def set_exp_date
    Date.today.next_year(STANDARD_VALIDITY_YEARS).strftime("%m/%y")
  end

end
