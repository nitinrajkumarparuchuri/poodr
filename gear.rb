class Gear
	attr_reader :chainring, :cog, :wheel
  
	def initialize(cog, chainring,wheel=nil)
		@cog = cog
		@chainring = chainring
		@wheel=wheel
  end
	
	def ratio
		chainring/cog.to_f
	end

	def gear_inches
		ratio*wheel.diameter
	end
end

class Wheel
	attr_reader :rim, :tire

	def initialize(rim, tire)
		@rim = rim
		@tire = tire
	end

	def diameter
		rim + (tire*2)
	end

	def circumference
		diameter * Math::PI
	end
end
#@wheel =  Wheel.new(26,15)
# puts @wheel.circumference
#puts Gear.new(52,11,@wheel).gear_inches


#Gear.new(52,11).ratio
#=>  wrong number of arguments (given 2, expected 4)

# Notes => altering the number of arguments that a menthod reqires breaks all th existing callers of the method

# An example of a disaster
class Gear
  
	def initialize(cog, chainring)
		@cog = cog
		@chainring = chainring
	end
	def ratio
		@chainring/@cog.to_f  # <--Road to ruin
	end
end

# Changing the values of instance variables like validating can become difficult

def cog
	@cog
end
#implementing the method changed the cog from data to a behavior