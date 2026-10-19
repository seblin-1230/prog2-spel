require "gosu"

class Ball
  attr_reader :width, :speed, :window_height, :window_width, :colliders
  attr_accessor :x, :y, :vx, :vy, :start_delay
  def initialize(width, window_width, window_height, colliders)
    @speed = 5

    @window_width = window_width
    @window_height = window_height
    @colliders = colliders

    @width = width
    @start_delay = 0

    reset
  end

  def draw
    Gosu.draw_rect(self.x + 6, self.y, 10, 22, Gosu::Color::WHITE)
    Gosu.draw_rect(self.x, self.y + 6, 22, 10, Gosu::Color::WHITE)
    Gosu.draw_rect(self.x + 2, self.y + 4, 4, 14, Gosu::Color::WHITE)
    Gosu.draw_rect(self.x + 16, self.y + 4, 4, 14, Gosu::Color::WHITE)
    Gosu.draw_rect(self.x + 4, self.y + 2, 14, 2, Gosu::Color::WHITE)
    Gosu.draw_rect(self.x + 4, self.y + 18, 14, 2, Gosu::Color::WHITE)
  end

  def update
    if self.start_delay != 0
      self.start_delay -= 1
      return
    end

    self.x += vx * speed
    self.y += vy * speed

    self.colliders.each do |collider|
      if collider.ball_colliding?(self.x, self.y, self.width)
        if collider.class == DrawCollider
          self.vy *= -1
        else
          self.vx *= -1
        end
      end
    end
  end

  def did_score?
    if self.x > window_width
      return 1
    elsif self.x < 0
      return -1
    end
    0
  end

  def reset
    self.x = window_width / 2
    self.y = window_height / 2
    self.vx = start_direction
    self.vy = start_direction
    self.start_delay = 30
  end

  def start_direction
    [-1, 1].sample
  end
end
