require "minitest/autorun"
require "currency"

class CurrencyTest < Minitest::Test

  def test_can_create_new_instance_with_new
    amount = 10
    currency_code = "USD"
    money = Currency.new(amount, currency_code)
    refute_nil money
  end

  def test_currency_has_an_amount_and_currency_code
    amount = 20
    currency_code = "CAD"
    money = Currency.new(20, "CAD")
    assert_equal money.amount, 20
    assert_equal money.currency_code, "CAD"
  end

  def test_equals_another_currency_obj_with_same_amount_and_currency_code
    amount = 50
    currency_code = "USD"
    money = Currency.new(50, "USD")
    assert_equal money, Currency.new(50, "USD")
  end

  def test_can_be_added_to_another_currency_obj_with_the_same_currency_code
    money = Currency.new(10, "USD")
    money_deux = Currency.new(20, "USD")
    result = money.amount + money_deux.amount
    assert_equal 30, result
  end

  def test_can_be_subtracted_by_another_currency_obj_with_the_same_currency_code
    money = Currency.new(60, "CAD")
    money_deux = Currency.new(40, "CAD")
    result = money.amount - money_deux.amount
    asssert_equal 20, result
  end

  def test_raises_a_different_currency_code_error_when_you_try_to_add_or_subtract_two_currency_objs_with_different_currency_codes
    money = Currency.new(70, "CAD")
    money_deux = Currency.new(30, "USD")
    assert_not_same("CAD", "USD")
    result = money.amount - money_deux.amount
    assert_equal nil, result

    result_deux = money.amount + money_deux.amount
    assert_equal nil, result_deux
  end


  def test_can_be_multiplied_by_a_fixnum_or_float_and_return_a_currency_obj
    money = Currency.new(40, "USD")
    Fixnum = 3
    float = .1
    result = money.amount * Fixnum
    assert_not_nil result

    result_deux = money.amount * float
    assert_not_nil result_deux
  end

end
