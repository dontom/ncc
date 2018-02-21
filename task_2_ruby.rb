def wrong_birth_year
  raise 'Death date is earlier then born date.'  
end 

def not_a_number
  raise 'Death date or birth date need to be numbers.'  
end 

class Animal
  attr_accessor :name, :age, :birth_year, :death_year
  def initialize(name, age, birth_year, death_year) 
    @name = name
    @age = age
    @birth_year = birth_year
    @death_year = death_year

    if @birth_year.to_i > @death_year.to_i
      wrong_birth_year 
    elsif (@birth_year.is_a? String) || (@death_year.is_a? String)
      not_a_number
    end
    
    puts "My name is #{name}"
  end

  def move
    raise ArgumentError.new("Any animal need to move")
  end

  def speak
    raise ArgumentError.new("This animal cannot speak")
  end
end

class SpeakableAnimal < Animal
  def initialize(name, age, birth_year, death_year, sound = "")
    super(name, age, birth_year, death_year)
    @sound = sound
  end

  def speak
    puts @sound
  end
end

class Dog < SpeakableAnimal
  def initialize(name, age, birth_year, death_year, sound = "Bark bark")
    super(name, age, birth_year, death_year, sound)
  end

  def move
    puts "I run 20 km/h\n\n"
  end
end

class Cat < SpeakableAnimal
  def initialize(name, age, birth_year, death_year, sound = "Miau miau")
    super(name, age, birth_year, death_year, sound)
  end

  def move
    puts "No thanks, I am sleeping\n\n"
  end
end

class Snake < SpeakableAnimal
  def initialize(name, age, birth_year, death_year, sound = "Tsssss...")
    super(name, age, birth_year, death_year, sound)
  end

  def move
    puts "I will bite you"
  end

  def kill
    puts "I will kill you too\n\n"
  end
end

class Fish < Animal
  def initialize(name, age, birth_year, death_year)
    super(name, age, birth_year, death_year)
  end

  def move
    puts "I swim\n\n"
  end
end


dog = Dog.new("Dogo", 12, 2008, 2017)
puts dog.name # only if it is attr_accessor
dog.speak
dog.move

cat = Cat.new("Koto", 2, 2018, 2027)
cat.speak
cat.move

snake = Snake.new("Snakeo", 20, 2018, 2019)
snake.speak
snake.move
snake.kill

fish = Fish.new("Fisho", 1, 2010, 2017)
fish.move


puts "------"

# Serialize
def createAnimalFromObject(temp)
  temp_string = []
  temp_string << temp.name << temp.age << temp.birth_year << temp.death_year
  puts temp_string.join("|")
end

# Deserialize
def createAnimal(obj, separator)
  obj = obj.split(separator.to_s)
  race = Object.const_get(obj[0].downcase.capitalize)
  raise ArgumentError.new("No such race defined") if Symbol.all_symbols.include?(race)
  temp_animal = race.new(obj[1].to_s, obj[2].to_i, obj[3].to_i, obj[4].to_i)
end

temp = "caT;Dogo2;12;2010;2012"
temp = createAnimal(temp, ";")
temp.name
temp.move

temp = "DOG,Dogo2,12,2010,2012"
temp = createAnimal(temp, ",")
temp.name
temp.move

temp = createAnimalFromObject(dog)
