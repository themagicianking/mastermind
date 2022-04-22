class Game
  attr_reader :secret_array, :guess_array, :hint_array, :game_over

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
    @guess_array = [ @choice_one, @choice_two, @choice_three, @choice_four]
  end

  def win_check(secret_array, guess_array)
    if secret_array == guess_array
      puts 'you guessed it!'
      @game_over = true
    end
  end

  def hint_generator(secret_array, guess_array, hint_array)
    i = 0
    for i in i..3
      if guess_array[i] == secret_array[i]
        hint_array[i] = 'BL'
      elsif secret_array.include? guess_array[i]
        hint_array[i] = 'W'
      else
      end
    end
  end
end

game = Game.new(['R', 'R', 'R', 'R'])

while game.game_over == false
  game.turn
  game.win_check(game.secret_array, game.guess_array)
  break if game.game_over == true
  game.hint_generator(game.secret_array, game.guess_array, game.hint_array)
  puts "Not quite. here's how close you came:"
  puts game.hint_array
end