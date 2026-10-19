require "gosu"

class DrawCollider
  attr_reader :x, :y, :width, :height
  def initialize(x, y, width, height)
    @x = x
    @y = y
    @width = width
    @height = height
  end

  def ball_colliding?(ball_x, ball_y, ball_width)
    corner_1 = (ball_x > self.x && ball_x < self.x + width) && (ball_y > self.y && ball_y < self.y + self.height)
    corner_2 = (ball_x + ball_width > self.x && ball_x + ball_width < self.x + width) && (ball_y > self.y && ball_y < self.y + self.height)
    corner_3 = (ball_x > self.x && ball_x < self.x + width) && (ball_y + ball_width > self.y && ball_y + ball_width < self.y + self.height)
    corner_4 = (ball_x + ball_width > self.x && ball_x + ball_width < self.x + width) && (ball_y + ball_width > self.y && ball_y + ball_width < self.y + self.height)

    corner_1 || corner_2 || corner_3 || corner_4
  end

  def draw
    Gosu.draw_rect(self.x, self.y, self.width, self.height, Gosu::Color::WHITE)
  end

  def update
    nil
  end
end