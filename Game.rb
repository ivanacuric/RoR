# 4 Letter Master Mind - Revised
# Autor: Kevin Kerney, Ivana Curic
require "pathname"
this_dir = Pathname.new(File.dirname(__FILE__))
require this_dir + "StringLib.rb"


class Game
  @codes = %w[ABCD DCAB BACD ADBC BDCA]
  @code = @codes[rand(@codes.size-1)]
  @guesses = 0
  @maxRounds = 10
  @curCombination = nil

  puts "Welcome to Mastermind! Search for the right combination of the letters A, B, C and D"
  puts "The pattern will look like this: _ _ _ _"

  while @guesses < @maxRounds
    puts "This is your #{@guesses + 1}. try out of #{@maxRounds}.\nType in the combination!"
    $inputString = StringLib.new("#{gets.upcase}")

    if $inputString.test == false
      puts "INPUT WRONG! Please type in your 4 letter combination containing A, B, C, D"
      next
    end

    $posRight = 0
    $posWrong = 0

    for i in 0...$inputString.size
      $posRight += 1 if $inputString.checkRight(@code, i)
      $posWrong += 1 if $inputString.checkWrong(@code, i)
    end

    @guesses += 1
    puts "Right positions #{$posRight}\nWrong positions #{$posWrong}"

    if $posRight == 4
      puts "That's the right combination! You succeeded!"
      exit
    end
  end

  puts "You lost! You have no tries left. The right combination is #{@code}"
  exit

end

