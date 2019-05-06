class Owner
  attr_accessor :pets, :name
  attr_reader :species

   @@all = []

   def initialize(species)
    @species = species
    @@all << self
    @pets = { :fishes => [], :dogs => [], :cats => [] }
  end

   def self.all
    @@all
  end

   def self.reset_all
    @@all.clear
  end

   def self.count
    @@all.size
  end

   def say_species
    "I am a #{species}."
  end

   def buy_fish(name)
    fish = Fish.new(name)
    pets[:fishes] << fish
  end

   def buy_cat(name)
    cat = Cat.new(name)
    pets[:cats] << cat
  end

   def buy_dog(name)
    dog = Dog.new(name)
    pets[:dogs] << dog
  end

   def walk_dogs
    pets[:dogs].map {|dog| dog.mood = "happy"}
   end

   def play_with_cats
    pets[:cats].map {|cat| cat.mood = "happy"}
  end

   def feed_fish
    pets[:fishes].map {|fish| fish.mood = "happy"}
  end

  def list_pets
    "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
  end

  def sell_pets
    pets.each do |kind, pet|
      pet.collect do |pet_mood|
        pet_mood.mood = "nervous"
      end
    end
    pets.clear
  end

end