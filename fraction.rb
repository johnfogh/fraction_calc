# frozen_string_literal: true

# Fraction -
module Fraction
  # According to the spec, we should only handle whole numbers
  # rather than integers.
  # set WHOLE_NUMBERS to false to handle integers.
  WHOLE_NUMBERS = true

  # parse -
  # Parses a string for integers, mixed numbers, and fractions
  # returns a rational improper fraction
  def self.parse(str)
    int, num, dnom = 0
    parts = str.gsub('/', '_').split('_')
    case parts.length
    when 1
      int = parts[0]
    when 2
      num = parts[0]
      dnom = parts[1]
    when 3
      int = parts[0]
      num = parts[1]
      dnom = parts[2]
    else
      raise ArgumentError, 'Wrong number of parameters'
    end
    Fraction.improper_fraction(int.to_i, num.to_i, dnom.to_i)
  end

  # improper_fraction -
  # Converts an integer, mixed number or fraction to rational
  def self.improper_fraction(int = 0, num = 0, dnom = 0)
    if WHOLE_NUMBERS == true
      [int, num, dnom].map { |n| raise ArgumentError, 'Whole numbers only' if n.negative? }
    end
    return Rational(int, 1) if num.zero? || dnom.zero?

    Rational((int * dnom) + num, dnom)
  end

  # to_string -
  # Reduces an improper fraction to a mixed number, fraction, or integer
  # and converts to string
  def self.to_string(fraction)
    gcd = fraction.denominator.gcd(fraction.numerator)
    num = fraction.numerator / gcd
    dnom = fraction.denominator / gcd
    int = num / dnom
    num = num.remainder(dnom)
    str = []
    str << int.to_s if int != 0
    str << "#{num}/#{dnom}" unless num.zero? || dnom.zero?
    str.join('_')
  end
end
