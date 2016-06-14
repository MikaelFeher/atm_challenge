class Person

  attr_reader :cash, :name, :account

  def initialize(attrs = {})
    @cash = 0
    @account
    set_name(attrs[:name])
  end



  private
  def set_name(obj)
    obj == nil ? missing_name : @name = obj
  end

  def missing_name
    raise 'A name is required'
  end

end
