# frozen_string_literal: true

require 'minitest/autorun'
require './fraction'

# Helper function for testing rationals
def assert_rational(fraction, num, dnom)
  assert fraction.numerator == num
  assert fraction.denominator == dnom
end

class Test_Fraction < Minitest::Test
  def test_enforce_whole_numbers
    skip 'WHOLE_NUMBERS is true' unless Fraction::WHOLE_NUMBERS == true
    assert_raises ArgumentError do
      Fraction.improper_fraction(-1, 2, 3)
    end
  end

  # fraction tests
  def test_improper_fraction
    r = Fraction.improper_fraction(1, 2, 3)
    assert_rational(r, 5, 3)
  end

  # parser tests
  def test_parse_int
    r = Fraction.parse('1')
    assert_rational(r, 1, 1)
  end

  def test_parse_fraction
    r = Fraction.parse('1/2')
    assert_rational(r, 1, 2)
  end

  def test_parse_mixed
    r = Fraction.parse('1_2/3')
    assert_rational(r, 5, 3)
  end

  # string tests
  def test_int_to_string
    r = Fraction.improper_fraction(1, 0, 0)
    assert Fraction.to_string(r) == '1'
  end

  def test_fraction_to_string
    r = Fraction.improper_fraction(0, 2, 3)
    assert Fraction.to_string(r) == '2/3'
  end

  def test_mixed_number_to_string
    r = Fraction.improper_fraction(1, 2, 3)
    assert Fraction.to_string(r) == '1_2/3'
  end

  def test_example_run
    r = Fraction.parse('1/2') * Fraction.parse('3_3/4')
    assert Fraction.to_string(r) == '1_7/8'

    r = Fraction.parse('2_3/8') + Fraction.parse('9/8')
    assert Fraction.to_string(r) == '3_1/2'
  end
end
