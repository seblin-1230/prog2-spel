require "gosu"
require_relative "draw_collider"

class Paddel < DrawCollider
  attr_reader :player, :speed, :window_height
  attr_accessor :x, :y
  def initialize(player, window_width, window_height)
    player == 1 ? x = 20 : x = window_width - 20
    y = window_height / 2
    super(x, y, 10, 50)

    @speed = 5
    @player = player
    @window_width = window_width
    @window_height = window_height
  end

  def update()
    if player == 1
      self.y += speed if Gosu.button_down?(Gosu::KB_S)
      self.y -= speed if Gosu.button_down?(Gosu::KB_W)
    else
      self.y += speed if Gosu.button_down?(Gosu::KB_DOWN)
      self.y -= speed if Gosu.button_down?(Gosu::KB_UP)
    end
    self.y = self.y.clamp(0, window_height - height)
  end
end