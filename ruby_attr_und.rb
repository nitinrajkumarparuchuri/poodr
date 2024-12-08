class Gear
	attr_reader :chainring, :cog
  
	def initialize(cog, chainring)
		@cog = cog
		@chainring = chainring
  end
	
	def ratio
		chain_ring/cog.to_f
	end
end

