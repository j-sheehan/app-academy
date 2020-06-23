class Dog

    # Init method
    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    ### Get methods ###

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def favorite_foods
        @favorite_foods
    end

    ### Set methods ###

    def age=(new_age)
        @age = new_age
    end

    ### Instance methods ###

    def bark
        if @age > 3
            return @bark.upcase
        else
            return @bark.downcase
        end
    end

    def favorite_food?(food_item)
        @favorite_foods.any? { |fav_food| fav_food.casecmp?(food_item) }
    end

end
