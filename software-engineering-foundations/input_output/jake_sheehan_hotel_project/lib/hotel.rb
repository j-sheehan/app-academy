require_relative "room"

class Hotel
    def initialize(name, hash)
        @name = name
        @rooms = {}

        hash.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    ### Get methods ###
    def name 
        @name.split.map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    ### Instance methods ###
    def room_exists?(room_name)
        @rooms.key?(room_name)
    end

    def check_in(person, room)
        if room_exists?(room)
            if @rooms[room].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        !(@rooms.values.all? { |room| room.full? })
    end

    def list_rooms
        @rooms.keys.each do |room|
            space = @rooms[room].available_space
            puts "#{room}. #{space}"
        end
    end

end
