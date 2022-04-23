class GuesserGame
  attr_reader :secret_array, :guess_array, :hint_array, :game_over

  def initialize
    @secret_array = []
    @game_over = false
    @hint_array = ['-', '-', '-', '-']
    i = 0
    for i in 0..3
      x = rand(1..4)
      if x == 1
        @secret_array[i] = 'R'
      elsif x == 2
        @secret_array[i] = 'Y'
      elsif x == 3
        @secret_array[i] = 'G'
      else
        @secret_array[i] = 'B'
      end
    end
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

class SecretGame
  def initialize
    # asks player to input code, store this as secret array
  end

  def computer_turn
    # if first turn, generate random code to guess at
    # if not: keep anything BL
    # anything with - use W if possible
    # work out more sophisticated logic later that's a lot
  end

  def player_turn
    puts 'How close did I get?'
    puts 'First choice:'
    puts 'Second choice:'
    puts 'Third choice:'
    puts 'Fourth choice:'
    # and then collect all these as an array.
  end
end

puts "Hello! Type G to be the guesser or S to be the secret code maker."
choice = gets.chomp
if choice == 'G'
  game = GuesserGame.new(['R', 'R', 'R', 'R'])

  while game.game_over == false
    game.turn
    game.win_check(game.secret_array, game.guess_array)
    break if game.game_over == true
    game.hint_generator(game.secret_array, game.guess_array, game.hint_array)
    puts "Not quite. here's how close you came:"
    puts game.hint_array
  end
elsif choice == 'S'
  # run the secret maker game
else
  puts "Invalid input!"
end