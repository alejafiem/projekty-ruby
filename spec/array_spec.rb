require 'simplecov'
SimpleCov.start

require 'array'

RSpec.describe 'array.rb' do
  describe 'Array.sort_as_string' do
    it 'correct values' do
      expect([12, 14, '111', 18, 'ha', '9'].sort_as_string)
        .to eql(['111', '12', '14', '18', '9', 'ha'])
    end
  end

  describe 'Array @mem' do
    it 'doesnt raise error on empty array' do
      expect { [].pop_to_mem! }.not_to raise_error
      expect { [].push_from_mem! }.not_to raise_error
    end

    it 'pop_to_mem value check' do
      arr = [8, 2]
      arr.pop_to_mem!
      expect(arr).to contain_exactly 8
    end

    it '@mem value change' do
      arr = [9, 7, 2, 12]
      expect { arr.pop_to_mem! }.to change { arr.mem }.from(nil).to(12)
      expect { arr.pop_to_mem! }.to change { arr.mem }.from(12).to(2)
      expect { arr.push_from_mem! }.to change { arr.mem }.from(2).to(nil)
    end

    it 'push_from_mem value check' do
      arr = [20, 15, 10]
      arr.mem = 80
      arr.push_from_mem!
      expect(arr).to contain_exactly 20, 15, 10, 80
    end

    it 'give_mem shold increase array size' do
      arr1 = [8, 9]
      arr1.pop_to_mem!

      arr2 = [10, 11]

      expect { arr1.give_mem(arr2) }.to change { arr1.mem }.from(9).to(nil)
      expect(arr2).to contain_exactly 10, 11, 9
    end
  end

  describe 'Array.except_class' do
    it 'should get return only NilClass' do
      expect([5, 9, 10, 11, 'String', 18, nil].except_class(NilClass))
        .to eql [nil]
    end
  end

  describe 'Array.replace_each_odd_spot' do
    it 'should replace value one each odd spot' do
      expect([8, nil, 'Rafal', 2, 5, 'nil', nil].replace_each_odd_spot(0))
      .to eql [8, 0, 'Rafal', 0, 5, 0, nil]
    end
  end
end
