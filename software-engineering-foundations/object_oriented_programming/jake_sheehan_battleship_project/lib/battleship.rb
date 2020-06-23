require_relative "board"
require_relative "player"

class Battleship
    ### Init ###
    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = (n * n) / 2
    end

    ### Instance methods ###
    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        end
        false
    end

    def win?
        if @board.num_ships == 0
            puts "you win"
            return true
        end
        false
    end

    def game_over?
        return true if self.win? || self.lose?
        false        
    end

    def turn
        move = @player.get_move
        @remaining_misses -= 1 if !@board.attack(move)
        @board.print
        puts @remaining_misses
    end

end
