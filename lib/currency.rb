class Currency
  attr_reader: :amount, :code
  
  def initialize(amount, code)
    @amount = amount
    @code = code
  end

  def ==(other)
    if self.amount == other.amount && self.code == other.code
      true
  end

  def +(other)
    if self.code != other.code
      raise DifferentCurrencyCodeError, "The codes of these currencies differ. The operation cannot be completed unless they have the same code."
    else
      Currency.new(self.amount + other.amount, self.code)
    end
  end

  def -(other)
    if self.code != other.code
      raise DifferentCurrencyCodeError, "The codes of these currencies differ. The operation cannot be completed unless they have the same code."
    else
      Currency.new(self.amount - other.amount, self.code)
    end
  end

  def *(Fixnum)
    self.amount * Fixnum
  end

  def *(Float)
    self.amount * Float
  end
end
