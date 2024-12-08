class Gear
	attr_reader :chainring, :cog, :rim, :tire
  
	def initialize(cog, chainring, rim, tire)
		@cog = cog
		@chainring = chainring
		@rim = rim
		@tire = tire
  end
	
	def ratio
		chainring/cog.to_f
	end

	def gear_inches
		ratio*(rim+(tire*2))
	end

end

#Gear.new(52,11,26,1.5).gear_inches
#=> 6.134

#Gear.new(52,11).ratio
#=>  wrong number of arguments (given 2, expected 4)

# Notes +> altering the number of arguments that a menthod reqires breaks all th existing callers of the method