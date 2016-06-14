require './lib/account.rb'

describe Account do

  let(:person) { instance_double('Person', name: 'Mikael') }
  subject { described_class.new({owner: person}) }

  it 'is expected to have an expiry date on initialize' do
    expected_date = Date.today.next_year(5).strftime("%m/%y")
    expect(subject.exp_date).to eq expected_date
  end

  it 'account created with a $0 balance' do
    expect(subject.balance).to eq 0
  end

  it 'account active on initialize?' do
    expect(subject.account_status).to eq :active
  end

  it 'deactivates the account using instance method' do
    subject.deactivate
    expect(subject.account_status).to eq :deactivated
  end

  it 'pin exists on initialize' do
    expect(subject.pin_code).not_to eq nil
  end

  it 'make sure pin is 4 digits' do
    pin_length = Math.log10(subject.pin_code).to_i + 1
      expect(pin_length).to eq 4
  end

  it 'is expected to have an owner' do
    expect(subject.owner).to eq person
  end

  it 'is expected to raise error if no owner is set' do
    expect { described_class.new }.to raise_error 'An account owner is required'
  end

end
