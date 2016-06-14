require './lib/account.rb'

describe Account do

=begin
  it 'is expected to have an expiry date on initialize' do
    expected_date = Date.today.next_year(5).strftime("%m/%y")
    expect(subject.exp_date).to eq expected_date
  end
=end

  it 'make sure pin is 4 digits' do
    pin_length = Math.log10(subject.pin_code).to_i + 1
      expect(pin_length).to eq 4
  end
end
