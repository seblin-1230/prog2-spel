require "gosu"

class Paddel
  attr_reader :width, :height, :x, :y, :player, :speed, :window_height
  def initialize(player, window_width, window_height)
    @speed = 5
    
    @width = 10
    @height = 50

    @player = player

    player == 1 ? @x = 20 : @x = window_width - 20
    @y = window_height / 2

    @window_height = window_height
  end

  def draw()
    Gosu.draw_rect(x, y, width, height, Gosu::Color::WHITE)
  end

  def update()
    if player == 1
      @y += speed if Gosu.button_down?(Gosu::KB_S)
      @y -= speed if Gosu.button_down?(Gosu::KB_W)
    else
      @y += speed if Gosu.button_down?(Gosu::KB_DOWN)
      @y -= speed if Gosu.button_down?(Gosu::KB_UP)
    end
    @y = @y.clamp(0, window_height - height)
  end

  def ball_colliding?(ball_x, ball_y, ball_radius)
    raise NotImplementedError
  end
end