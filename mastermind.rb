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
      puts 'You guessed it!'
      @game_over = true
    end
  end

  def hint_generator(secret_array, guess_array, hint_array)
    i = 0
    for i in i..3
      if guess_array[i] == secret_array[i]
        hint_array[i] = 'X'
      elsif secret_array.include? guess_array[i]
        hint_array[i] = 'O'
      else
      end
    end
  end
end

class SecretGame < GuesserGame
  attr_reader :secret_array, :hint_array

  def initialize
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
    @secret_array = [ @choice_one, @choice_two, @choice_three, @choice_four]
  end

  def computer_turn
    # if first turn, generate random code to guess at
    # if not: keep anything BL
    # anything with - use W if possible
    # work out more sophisticated logic later that's a lot
  end

  def player_turn
    puts 'How close did I get?'
    puts 'An X means an exact guess, and an O means right color, wrong spot. A - means neither.'
    puts 'First choice:'
    @hint_one = gets.chomp
    puts 'Second choice:'
    @hint_two = gets.chomp
    puts 'Third choice:'
    @hint_three = gets.chomp
    puts 'Fourth choice:'
    @hint_four = gets.chomp
    @hint_array = [ @hint_one, @hint_two, @hint_three, @hint_four ]
  end
end

puts 'Hello! Type G to be the guesser or S to be the secret code maker.'
choice = gets.chomp
if choice == 'G'
  game = GuesserGame.new

  while game.game_over == false
    game.turn
    game.win_check(game.secret_array, game.guess_array)
    break if game.game_over == true
    game.hint_generator(game.secret_array, game.guess_array, game.hint_array)
    puts "Not quite. An X means an exact guess, and an O means right color, wrong spot."
    puts "Here's how close you came:"
    puts game.hint_array
  end
elsif choice == 'S'
  game = SecretGame.new
else
  puts "Invalid input!"
end