require 'pry'
require_relative 'journey.rb'
require_relative 'station.rb'
require_relative 'oystercard.rb'

card = Oystercard.new
station1 = Station.new(:bank, 2)
station2 = Station.new(:kings_cross, 1)
card.top_up(10)
binding.pry
