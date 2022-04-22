class Game
  attr_reader :secret_hash, :guess_hash, :hint_hash

  def initialize(secret_hash)
    @secret_hash = secret_hash
    @game_over = false
    @hint_hash = { one: '-', two: '-', three: '-', four: '-' }
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
    @guess_hash = { one: @choice_one, two: @choice_two, three: @choice_three, four: @choice_four }
  end

  def win_check(secret_hash, guess_hash)
    if secret_hash == guess_hash
      puts 'you guessed it!'
      @game_over = true
    end
  end

  def hint_generator(secret_hash, guess_hash, hint_hash)
    # create for loop to test each item in the array
    # every time they exist push W
    # create a second loop to check exacts
    # every time those exist, push BL
  end
end

game = Game.new({ one: 'R', two: 'R', three: 'R', four: 'R'})
game.turn
game.win_check(game.secret_hash, game.guess_hash)
game.hint_generator(game.secret_hash, game.guess_hash, game.hint_hash)