module Arithmetic
  def +(other)
    summed_amount = self.amount + other.convert_to(self.currency, false)
    currency_precision(summed_amount, self.currency)
  end

  def -(other)
    # Difference is only possible if first value is greater than second value
    # Other condition like when second value is greater than first value is not handled
    summed_amount = self.amount - other.convert_to(self.currency, false)
    currency_precision(summed_amount, self.currency)
    # "#{self.amount - other.convert_to(self.currency).round(2)} #{self.currency}"
  end

  def /(value)
    begin
     currency_precision((self.amount / value),  self.currency)
    rescue Exception => e
      puts "Caught exception #{e}!"
    end
  end

  def *(value)
    currency_precision((self.amount * value),  self.currency)
  end
end