
class Toy
	def initialize(game_window)
		@game_window = game_window
		@icon = Gosu::Image.new(@game_window, "images/toy.png", true)
		@count = rand(10)
		reset!
	end
	
	def update
		if @y > @game_window.height
			reset!
		else
			@y = @y + @count
		end
	end	

	def draw
		@icon.draw(@x,@y,20)
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
		toy

	end
	def  character_death
		@icon = Gosu::Image.new(@game_window, "images/death_08.png", true)
	end
	def toy 
		@icon = Gosu::Image.new(@game_window, "images/toy.png", true)
	end
end
