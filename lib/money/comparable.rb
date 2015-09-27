module Comparable
  def ==(other)
    if other.instance_of?(String)
      first_amount = self.convert_to('USD')
      second_amount = other
    else
      first_amount = self.amount
      second_amount = other.amount
    end
    first_amount.to_f == second_amount.to_f
  end

  def >(other)
    self.amount > other.amount
  end

  def <(other)
    self.amount.to_f < other.convert_to('USD').to_f
  end
end