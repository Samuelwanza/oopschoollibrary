class Solver
    def factorial(n)
      if n < 0 
        raise ArgumentError, "Factorial is not defined for negative integers."
      elsif n == 0
          1
      else
        result = 1
        i = 1
        while i <= n 
          result *=i 
          i+=1
        end
        result
      end
    end
  
    def reverse(word)
      word.reverse
    end
end