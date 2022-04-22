class Game
  attr_reader :secret_array, :guess_array, :hint_array

  def initialize(secret_array)
    @secret_array = secret_array
    @game_over = false
    @hint_array = ['-', '-', '-', '-']
  end

  def turn(guess_array)
    puts 'Please enter your choices :)'
    # figure out the easiest way to get this. in any case this should store an array
    @guess_array = guess_array
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