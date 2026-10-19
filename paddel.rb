require "gosu"
require_relative "draw_collider"

class Paddel < DrawCollider
  attr_reader :player, :speed, :up_key, :down_key, :windown_width, :window_height
  attr_accessor :x, :y
  def initialize(player, up_key, down_key, window_width, window_height)
    player == 1 ? x = 20 : x = window_width - 20
    y = window_height / 2
    super(x, y, 10, 50)

    @speed = 5
    @player = player
    @up_key = up_key
    @down_key = down_key
    @window_width = window_width
    @window_height = window_height
  end

  def update()
    self.y += speed if Gosu.button_down?(down_key)
    self.y -= speed if Gosu.button_down?(up_key)
    self.y = self.y.clamp(0, window_height - height)
  end
end