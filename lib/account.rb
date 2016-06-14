class Account

  attr_reader :pin_code

  def initialize
    @pin_code = rand(1000..9999)
    @balance = 100
    @account_status = :active

  end

=begin
  def new_account(account_owner)

  def pin_code
    pin_code =
  end
=end

end
