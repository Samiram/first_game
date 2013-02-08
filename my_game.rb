require 'rubygems'
require 'gosu'
require 'ruby-player'
require './samira'
require './ball'
require './toy'


class MyGame < Gosu::Window
 def initialize
		super(700, 500, false)
		@player1 = Samira.new(self)
		@balls = 4.times.map {Ball.new(self)}
		@toys = 3.times.map {Toy.new(self)}
		@running = true
		@font = Gosu::Font.new(self, Gosu::default_font_name, 30)
		@count = 0
		@bacg = Gosu::Image.new(self, "images/fon.png", true)

 end

 def update
	if @running
		@count = @count + 1 
		if button_down? Gosu::Button::KbLeft
			@player1.move_left
		end

		if  button_down? Gosu::Button::KbRight
			@player1.move_right
		end

		if button_down? Gosu::Button::KbUp
			@player1.move_up
		end
		if button_down? Gosu::Button::KbDown
			@player1.move_down
		end

		@balls.each {|ball| ball.update}
		@toys.each {|toy| toy.update}  

		if @player1.hit_by?(@balls, @toys)
		stop_game!	
		end
	else
		if button_down? Gosu::Button::KbEscape
			restart_game
		end
	 end
	end
 def draw
 		@bacg.draw(0,0,1)
		@player1.draw
		@balls.each {|ball| ball.draw}
		@toys.each {|toy| toy.draw}
		@font.draw("The Count is: #{@count}", 20,20,5)
 end

 def stop_game!
		@running = false
		@balls.each {|ball| ball.character_death}
   		@toys.each {|toy| toy.character_death}
   		@player1.death
  end
  def restart_game
  		@count = 0
  		@running = true
  		@balls.each {|ball| ball.reset!}
  		@toys.each {|toy| toy.reset!}
  		@player1.reset!
  end	
end

game  = MyGame.new
game.show
