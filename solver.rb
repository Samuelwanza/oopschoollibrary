class Solver
  def factorial(num)
    if num.negative?
      raise ArgumentError, 'Factorial is not defined for negative integers.'
    elsif num.zero?
      1
    else
      result = 1
      i = 1
      while i <= num
        result *= i
        i += 1
      end
      result
    end
  end

  # rubocop:disable Naming/MethodParameterName
  def fizzbuzz(n)
    if (n % 3).zero? && (n % 5).zero?
      'fizzbuzz'
    elsif (n % 3).zero?
      'fizz'
    elsif (n % 5).zero?
      'buzz'
    else
      n.to_s
    end
  end
  # rubocop:enable Naming/MethodParameterName

  def reverse(word)
    word.reverse
  end
end
