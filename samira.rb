class Samira
 attr_reader :lives
	def initialize(game_window)
		@game_window = game_window
		@icon = Gosu::Image.new(@game_window, "images/08_1.png", true)
		@x = 100
		@y = 250
		@lives = 5
	end
	
	def draw
		@icon.draw(@x,@y,5)
	end

	def move_left
		if @x < 0
			@x = 0
		else
		@x = @x -5
		end
	end	
	def move_right
		if @x > (@game_window.width - 75)
			@x = @game_window.width - 75
		else
		@x = @x + 15
		end
	end

	def move_up
		if @y < 0
			@y = 0
		else
		@y = @y - 10
		end
	end	
	def move_down
		if @y > (@game_window.width - 50)
			@y= @game_window.width - 50
		else
		@y = @y + 10
		end
	end
	def hit_by?(balls, toys)
		balls.any? {|ball| Gosu::distance(@x, @y, ball.x, ball.y) < 40} or
		toys.any? {|toy| Gosu::distance(@x, @y, toy.x, toy.y) < 20}

	end
	def death
		@icon = Gosu::Image.new(@game_window, "images/death_08.png", true)
	end
	def reset!
		@icon = Gosu::Image.new(@game_window, "images/08_1.png", true)
	end
end