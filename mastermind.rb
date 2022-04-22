class Game
  attr_reader :secret_array, :guess_array, :hint_array

  def initialize(secret_array)
    @secret_array = secret_array
    @game_over = false
    @hint_array = ['-', '-', '-', '-']
  end

  def turn
    puts 'You have four possible colors: R, Y, G, and B.'
    puts 'Please input your first choice.'
    @choice_one = gets.chomp
    puts 'Please input your second choice.'
    @choice_two = gets.chomp
    puts 'Please input your third choice.'
    @choice_three = gets.chomp
    puts 'Please input your fourth choice.'
    @choice_four = gets.chomp
    # sanitize the input later
    @guess_array = [@choice_one, @choice_two, @choice_three, @choice_four]
  end

  def win_check(secret_array, guess_array)
    if secret_array == guess_array
      puts 'you guessed it!'
      @game_over = true
    end
  end

  def hint_generator(secret_array, guess_array, hint_array)
    # create for loop to test each item in the array
    # every time they exist push W
    # create a second loop to check exacts
    # every time those exist, push BL
  end
end

game = Game.new(['R', 'R', 'R', 'R'])
game.turn
