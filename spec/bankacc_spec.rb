require 'simplecov'
SimpleCov.start

require 'bankacc'

RSpec.describe 'bankacc.rb' do
  describe '#BankAccount.initialize' do
    it 'should be defined' do
      test_client = Client.new(1, "Janusz", "Wojak")
      expect { BankAccount.new(test_klient) }.not_to raise_error
    end
  end
end