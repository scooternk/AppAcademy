require_relative "room"

class Hotel
  
    #rooms = {room_name => capacity}
    def initialize(name, rooms)
        @name = name
        @rooms = Hash.new
        rooms.each {|name, capacity| @rooms[name] = Room.new(capacity)}
    end

    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
         @rooms
    end

    def room_exists?(name)
        @rooms.include?(name)
    end

    def check_in(guest, room_name)
        if !room_exists?(room_name)
            print "sorry, room does not exist"
            return false
        end

        if !@rooms[room_name].add_occupant(guest)
            print "sorry, room is full"
            return false
        end

        print "check in successful"
        true
   end

   def has_vacancy?
    @rooms.any? {|name, value| @rooms[name].available_space > 0}
   end

   def list_rooms
    @rooms.each {|name, room| print "#{name} #{room.available_space}\n"}
   end
end
