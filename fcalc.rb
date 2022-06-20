# frozen_string_literal: true

# !/usr/bin/env ruby
# Needs: chmod +x fcalc.rb

require './fraction'

def main
  if ARGV.length.zero?
    interactive_mode
    return
  end
  args = ARGV[0].split(' ')
  puts process(args)
rescue ArgumentError
  help
end

def interactive_mode
  puts 'Interactive mode - type "exit" to quit.'
  loop do
    print '? '
    str = gets.chomp
    break if str.downcase == 'exit'

    args = str.split(' ')
    puts "=#{process(args)}"
  end
end

def process(args = [])
  raise ArgumentError unless args.length == 3

  val_a = MixedNum.parse(args[0])
  val_b = MixedNum.parse(args[2])
  op = args[1].to_sym
  raise ArgumentError, 'No Operator' unless %i[+ - / *].include?(op)

  result = val_a.send(op, val_b)
  MixedNum.to_string(result)
end

def help
  puts 'Help:'
  puts 'VALUE is in the format of "1_1/2"'
  puts 'OP is one of "+, -, *, /"'
  puts
  puts 'ruby fcalc.rb "[VALUE OP VALUE]"'
  puts 'runs once and returns the calulated value.'
  puts
  puts 'ruby fcalc.rb'
  puts 'runs interactive mode and takes input in the form of VALUE OP VALUE'
  puts 'and displays the calculated value. type "exit" to quit.'
end

main
