require "gosu"
require_relative "ball"
require_relative "paddel"

class Game < Gosu::Window
  def initialize
    super(800, 600)
    self.caption = "Pong"

    @player_1 = Paddel.new(1, width, height)
    @player_2 = Paddel.new(2, width, height)
    @ball = Ball.new(width, height)
  end

  def draw
    @player_1.draw
    @player_2.draw
    @ball.draw
  end

  def update
    @player_1.update
    @player_2.update
  end
end

Game.new.show