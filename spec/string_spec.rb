require 'simplecov'
SimpleCov.start

require 'string'

RSpec.describe 'string.rb' do
  describe 'String.shuffle' do
    it 'should be defined' do
      expect { 'to jest tekst'.shuffle }.not_to raise_error
      expect { ''.shuffle }.not_to raise_error
    end

    it 'should contain same letters as before' do
      expect('ala ma kota'.shuffle.scan('a').count).to eq 4
      expect('ala ma kota'.shuffle.scan(' ').count).to eq 2
      expect(''.shuffle.scan('p').count).to eq 0
    end
  end

  describe 'String.sort' do
    it 'should be defined' do
      expect { 'pies'.sort }.not_to raise_error
      expect { ''.sort }.not_to raise_error
      expect { ('fd' * 50 + 'of' * 25).sort }.not_to raise_error
    end

    it 'should sort ascending' do
      expect('pies'.sort).to eql 'eips'
      expect(''.sort).to eql ''
      expect(('fd' * 50 + 'of' * 25).sort).to eql('d' * 50 + 'f' * 75 + 'o' * 25)
    end

    it 'case should not matter' do
      expect('Ala Ma Kota'.sort).to eql '  AaaaKlMot'
    end
  end

  describe 'String.sum_scanned_numbers' do
    it 'should be defined' do
      expect { 'pies'.sum_scanned_numbers }.not_to raise_error
      expect { ''.sum_scanned_numbers }.not_to raise_error
    end

    it 'should sum found integers inside string' do
      expect('test'.sum_scanned_numbers).to eql 0
      expect('liczba 500 dodac 100 rowna sie szescset'.sum_scanned_numbers).to eql 600
    end
  end

  describe 'String.remove_numbers!' do
    it 'string should not contain any number' do
      line = 'poprawny tekst'
      expect { line.remove_numbers! }.not_to change { line }
      line = 'niepoprawny 50 tekst'
      expect { line.remove_numbers! }.to change { line }
        .from('niepoprawny 50 tekst').to('niepoprawny  tekst')
    end
  end

  describe 'String.palindrome?' do
    it 'value check' do
      expect('palindrome'.palindrome?).to eq false
      expect('ala'.palindrome?).to eq true
    end
  end

  describe 'String.find_odd_numbers' do
    it 'should return array of integers' do
      expect('przykladowy 5 tekst 9 2'.find_odd_numbers).to be_a_kind_of Array
      expect('inny 2 9 44 18 tekst 231'.find_odd_numbers).to all be_an(Integer)
    end
  end

  describe 'String.evaluate_calculation_result' do
    it 'should raise error on bad format' do
      expect { 'zly format'.evaluate_calculation_result }
        .to raise_error 'Bad format'
      expect { '50*20'.evaluate_calculation_result }.not_to raise_error
    end

    it 'should give good results' do
      expect('5+8'.evaluate_calculation_result).to eql 13
      expect('9-7'.evaluate_calculation_result).to eql 2
      expect('2*3'.evaluate_calculation_result).to eql 6
      expect('50/2'.evaluate_calculation_result).to eql 25
    end
  end
end
