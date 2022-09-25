module Display
  def clear_console
    sleep 0.75
    system('clear')
  end

end

class Game
  include Display
  def initialize
    @player = Player.new
  end
  
  def play
    intro
  end

  def intro
    beginning_message
    choice = gets.chomp.to_i
    @player.assign_pet_choice(choice)
    congrats_message
    ask_for_name
    @player.pet.name = gets.chomp
  end

  def beginning_message
    puts 'Welcome to Pet Project! Today is a big day. You have saved enough money' \
    'for your first pet!'
    sleep 1
    puts "You already decided what kind of pet to adopt. \nEnter 1 to adopt a DOG or" \
    'enter 2 to adopt a CAT'
  end

  def congrats_message
    puts "Congratulations! You've adopted a new #{@player.pet.type}!"
  end

  def ask_for_name
    puts "What would you like to name your new #{@player.pet.type}?"
  end

end


class Pet
  attr_accessor :name

  def initialize
    @name = ''
  end

end

class Dog < Pet
  attr_reader :type

  def initialize
    super
    @type = 'puppy'
  end

end

class Cat < Pet
  attr_reader :type

  def initialize
    super
    @type = 'kitten'
  end
end

class Player
  attr_reader :pet

  def assign_pet_choice(choice)
    case choice
    when 1
      @pet = Dog.new
    when 2
      @pet = Cat.new
    end
  end
end

game = Game.new
game.play
