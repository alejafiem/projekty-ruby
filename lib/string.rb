# in lib/string .rb
class String
  def shuffle
    split('').shuffle.join
  end

  def sort
    chars.sort_by(&:downcase).join
  end

  def sum_scanned_numbers
    sum=0
    scan(/\d+/).map { |i| sum += i.to_i }
    sum
  end

  def remove_numbers!
    gsub!(/[0-9]/, '')
  end

  def palindrome?
    reverse == self
  end

  def find_odd_numbers
    a = []
    scan(/\d+/).map { |i| a.push i.to_i }
    a
  end

  def evaluate_calculation_result
    raise 'Bad format' unless self[/[0-9]*[\+\-\*\/][0-9]*/]
    a = split(/[\+\-\*\/]/)
    a = a.map { |i| i.to_i }
    symbol = self[/[\+\-\*\/]/]
    case symbol
    when '+'
      a[0] + a[1]
    when '-'
      a[0] - a[1]
    when '*'
      a[0] * a[1]
    when '/'
      a[0] / a[1]
    end
  end
end
