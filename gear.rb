class Gear
	attr_reader :chainring, :cog, :rim, :tire
  
	def initialize(cog, chainring, rim, tire)
		@cog = cog
		@chainring = chainring
		@wheel=Wheel.new(rim, tire)
  end
	
	def ratio
		chainring/cog.to_f
	end

	def gear_inches
		ratio*wheel.diameter
	end

	Wheel = Struct.new(:rim, :tire) do
		def diameter
			rim + (tire*2)
		end
	end
end

#Gear.new(52,11,26,1.5).gear_inches
#=> 6.134

#Gear.new(52,11).ratio
#=>  wrong number of arguments (given 2, expected 4)

# Notes +> altering the number of arguments that a menthod reqires breaks all th existing callers of the method

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