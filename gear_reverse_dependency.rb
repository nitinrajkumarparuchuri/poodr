class Gear
  attr_reader :chainring, :cog

  def initialize(chainring, cog)
    @chainring=chainring
    @cog=cog
  end

  def gear_inches(diameter)
    ratio*diameter
  end

  def ratio
    chainring/cog.to_f
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim=rim
    @tire=tire
    @gear=Gear.new(chainring: chainring, cog: cog)
  end

  def diameter
    rim+(tire*2)
  end

  def gear_inches
    gear.gear_inches(diameter)
  end
end