require "gosu"
require_relative "ball"
require_relative "paddel"
require_relative "draw_collider"

class Game < Gosu::Window
  attr_reader :colliders, :font
  attr_accessor :p1_score, :p2_score
  def initialize
    super(800, 600)
    self.caption = "Pong"
    
    @colliders = [Paddel.new(1, width, height), 
                  Paddel.new(2, width, height), 
                  DrawCollider.new(0, 0, width, 20), 
                  DrawCollider.new(0, height - 20, width, 20)]

    @ball = Ball.new(22, width, height, colliders)
    @font = Gosu::Font.new(50)

    self.p1_score = 0
    self.p2_score = 0
  end

  def draw
    self.colliders.each do |collider|
      collider.draw
    end
    
    @ball.draw

    display_score
  end

  def update
    self.colliders.each do |collider|
      collider.update
    end

    @ball.update
    score_change = @ball.did_score?
    if score_change != 0
      @ball.reset
      
      score_change == 1 ? self.p1_score += 1 : self.p2_score += 1
    end
  end

  def display_score
    @font.draw_text("#{self.p1_score}", 20, 30, 10)
    @font.draw_text("#{self.p2_score}", width - @font.text_width("#{self.p2_score}") - 20, 30, 10)

  end
end

Game.new.show