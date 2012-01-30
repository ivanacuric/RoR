



codes = ["ABCD", "DCAB"]

code = codes[rand(codes.size)-1]

guesses = 0
rounds = 10
curCombination = nil

puts "Welcome to Mastermind! Search for the right combination of the letters A, B, C and D"
puts "The pattern will look like this: _ _ _ _"

puts code

while guesses < rounds
  puts "This is your #{guesses + 1}. try"
  puts "Type in the combination!"
  
  curCombination = STDIN.gets.upcase
  
  if curCombination.size-1 != 4 or not curCombination =~ /[[A-D]]/
    puts "INPUT WRONG! Please type in your 4 letter combination containing A, B, C, D"
    next
  end
  
  posRight = 0
  posWrong = 0
  
  for i in 1..curCombination.size-1
    
    if curCombination[i-1] == code[i-1]
      posRight = posRight+1
    end
    
    
    if curCombination[i-1].chr != code[i-1] && curCombination[i-1] =~ /^#{curCombination[i-1]}/
      posWrong = posWrong+1
    end
  end  
  
  guesses = guesses + 1
  
  puts "Right positions #{posRight}"
  puts "Wrong positions #{posWrong}"
  
  if posRight == 4
    puts "That's the right combination! You succeeded!"
    exit
  end
end

