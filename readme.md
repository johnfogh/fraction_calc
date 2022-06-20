# fcalc

## Coding Challenge:
Write a command-line program in the language of your choice that will take
operations on fractions as an input and produce a fractional result.
Legal operators shall be *, /, +, - (multiply, divide, add, subtract)
Operands and operators shall be separated by one or more spaces
Mixed numbers will be represented by whole_numerator/denominator. e.g. "3_1/4"
Improper fractions and whole numbers are also allowed as operands
Example run:
? 1/2 * 3_3/4
= 1_7/8
?2_3/8 + 9/8
= 3_1/2

### fcalc.rb
This is basically just the commandline user interface. Running fcalc without
any arguments runs in interactive mode until the user enters "exit." Each line of
user input is expected to follow the format of VALUE OP VALUE. A value should be in 
the format of INT_NUMERATOR/DENOMINATOR. The accepted operators are  [*|/|+|-]

running fcalc with a quoted string argument (ex. ruby fcalc.rb "1_1/2 * 1_1/2")
operates like a typical unix program returning a string representation of a mixed
number and exiting.

### fraction.rb
I am using a module (Fraction) instead of a class because all we really need to do
is convert to an improper fraction and return it as a rational (built in type).
When we are done, we convert the rational to a string representation of a mixed
number, fraction, or integer.

Fraction provides the functionality to:
- parse a string into an improper fraction.
- create an improper fraction from an integer, numerator and a denominator.
- return a string representation of a mixednumber with reduced fraction.

***NOTE:*** The challenge specifies "whole numbers" rather than integers.
This is enforced with Fraction::WHOLE_NUMBERS. If you set this to false it will 
process integers instead of whole numbers. 
