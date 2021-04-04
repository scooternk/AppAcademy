require_relative "board"

b = Board.new(5)

#grid = b.hidden_ships_grid

#Board.print_grid(grid)

#print b[[0,0]]

b[[0,0]] = :S
b[[3,3]] = :S
b[[2,1]] = :X
b[[0,2]] = :X
b.cheat
#b.attack([0,0])
Board.print_grid(b.hidden_ships_grid)
puts ""

#Board.print_grid(grid)
#b.print

#b.place_random_ships
