class Room
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    ### Get methods ###
    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    ### Instance methods ###
    def full?
        @capacity == @occupants.length
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(name)
        if !(self.full?)
            @occupants << name
            return true
        else
            return false
        end
    end

end