class Board
    ### Class methods ###
    def self.print_grid(grid)
        grid.each do |row|
            row.each do |col|
                if col == row[-1]
                    print "#{col}"
                else
                    print "#{col} "
                end
            end
            puts
        end
    end

    ### Init ###
    attr_reader :size
  
    def initialize(n)
        @n = n
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    ### Instance methods ###
    def [](pos)
        row, col = *pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = *pos
        @grid[row][col] = val
    end

    def num_ships
        count = 0

        @grid.each do |row|
            row.each do |col|
                count += 1 if col == :S
            end
        end

        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        ship_count = (@grid.flatten.length * 0.25).ceil.to_i

        ship_count.times do
            rand_row = rand(0...@n)
            rand_col = rand(0...@n)
            rand_pos = [rand_row, rand_col]

            until self[rand_pos] == :N
                rand_row = rand(0...@n)
                rand_col = rand(0...@n)
                rand_pos = [rand_row, rand_col]
            end

            self[rand_pos] = :S
        end
    end

    def hidden_ships_grid
        hidden_grid = []

        @grid.each do |row|
            new_row = row.map do |col|
                if col == :S
                    :N
                else
                    col
                end
            end
            hidden_grid << new_row
        end

        hidden_grid
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
