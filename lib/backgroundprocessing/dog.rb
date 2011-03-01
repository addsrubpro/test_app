#!/usr/bin/env ruby
class Dog
  attr_reader :weight, :height, :color
  attr_accessor :name
  
  def initialize(weight = 1,height = 0.5, color = "white")
    puts "in initialize"
    @weight, @height, @color = weight, height, color
  end
  
  def self.bark
    puts "class method: bark"
  end

  def barking
    puts "instance method: barking"
  end
end