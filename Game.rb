# 4 Letter Master Mind
# Autor: Kevin Kerney, Ivana Curic


# Array with predefined solutions
codes = %w[ABCD DCAB BACD ADBC BDCA]

# Pick a random solution from "codes"
code = codes[rand(codes.size)-1]

# Variables for guesses, rounds and current input
guesses = 0
maxRounds = 10
curCombination = nil

# Introductive description
puts "Welcome to Mastermind! Search for the right combination of the letters A, B, C and D"
puts "The pattern will look like this: _ _ _ _"

# Game loop
while guesses < maxRounds
  puts "This is your #{guesses + 1}. try out of #{maxRounds}."
  puts "Type in the combination!"

# Input  
  curCombination = STDIN.gets.upcase

# Check if input has the right format
  if curCombination.size-1 != 4 or not curCombination =~ /[[A-D]]/
    puts "INPUT WRONG! Please type in your 4 letter combination containing A, B, C, D"
    next
  end

# Variables for indicating right or wrong letter
  posRight = 0
  posWrong = 0

# Check if input matches the combination
  for i in 1..curCombination.size-1

# Indicating wrong positions 
    if curCombination[i-1] == code[i-1]
      posRight = posRight+1
    end
    
# Indicating right positions   
    if curCombination[i-1].chr != code[i-1] && curCombination[i-1] =~ /^#{curCombination[i-1]}/
      posWrong = posWrong+1
    end
  end  

# Count current round  
  guesses = guesses + 1

# Output
  puts "Right positions #{posRight}"
  puts "Wrong positions #{posWrong}"
  
# Ends game if combination is right
  if posRight == 4
    puts "That's the right combination! You succeeded!"
    exit
  end
end

# Maximum rounds exeeded -> Lost  
puts "You lost! You have no tries left. The right combination is #{code}"
exit

