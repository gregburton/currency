class Currency
  attr_reader: :amount, :code
  def initialize(amount, code)

  end

  @amount = amount
  @code = code

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

  def mult_fixnum
    
  end



  # Should be able to be multiplied by a Fixnum or Float and return a Currency object

@rates = { USD 1.0, CAD 1.11}

  # Should be able to take a Currency object and a requested currency code that is the same currency code as the Currency object's and return a Currency object equal to the one passed in (that is, currency_converter.convert(Currency.new(1, :USD), :USD) == Currency.new(1, :USD))

  # Should be able to take a Currency object that has one currency code it knows and a requested currency code and return a new Currency object with the right amount in the new currency code

  # Should be able to be created with a Hash of three or more currency codes and conversion rates

  # Should be able to convert Currency in any currency code it knows about to Currency in any other currency code it knows about.

  # Should raise an UnknownCurrencyCodeError when you try to convert from or to a currency code it doesn't know about.
end
