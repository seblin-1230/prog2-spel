require "gosu"

class Ball
  attr_reader :radius, :speed, :window_height, :window_width
  def initialize(window_width, window_height)
    @speed = 10

    @window_width = window_width
    @window_height = window_height

    @x = window_width / 2
    @y = window_height / 2
  end

  def draw
    Gosu.draw_rect(@x - 2, @y - 5, 5, 10, Gosu::Color::AQUA)
    Gosu.draw_rect(@x - 5, @y - 2, 10, 5, Gosu::Color::GREEN)
    Gosu.draw_rect(@x - 2, @y - 5, 10, 5, Gosu::Color::AQUA)
    Gosu.draw_rect(@x - 2, @y - 5, 10, 5, Gosu::Color::AQUA)

  end
end
