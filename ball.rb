class Ball
	def initialize(game_window)
		@game_window = game_window
		@icon = Gosu::Image.new(@game_window, "images/ball.png", true)
		@sa = rand(10)
		reset!
	end
	
	def update
		if @y > @game_window.height
			reset!
		else
			@y = @y + @sa
		end
	end	

	def draw
		@icon.draw(@x,@y,10)
	end

	def x
		@x	
	end

	def y
		@y
	end	
	def reset!
		@y = 0
			@x = rand(@game_window.width)
			ball

	end
	def  character_death
		@icon = Gosu::Image.new(@game_window, "images/krov.png", true)
	end
	def ball 
		@icon = Gosu::Image.new(@game_window, "images/ball.png", true)
	end
end
