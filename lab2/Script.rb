require "../utilities"

def word
  print ("Enter some word ")
  word = gets.chomp

  if word[-2..-1] == "cs" 
     (p (2 ** word.length)) 
  else
     (p (word.reverse))
  end
end

def pokemons
  print ("How many pokemons will be? ")
  number_of_pokemons = gets.to_i

  pokemons = []

  number_of_pokemons.times do
    print ("Enter name of pokemon ")
    name = gets.chomp
    print ("Enter color of pokemon ")
    color = gets.chomp
    pokemons << { name => color }
  end

  p pokemons
end