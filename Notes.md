### Recognizing dependencies

1. Object has a depenency when it knows the name of another class. 
  - Gear expects Wheel class tp exist

2. The name of the message that the object intends to send to someone other than self.

  - Gear expects wheel instance to respond with diameter 
3. Arguments the message requires.
  - Grear knows about wheel's rim and tire

4. Order of the arguments

Each of these dependencies causes the Gear class to change with a change in Wheel

**Design Challenge:** Manage dependencies so that each class has the fewest possible, a class should know just enough to do its job and nothing more.

### Coupling between objects

The more Gear knows about wheel the moretightly coupled they are.

## What is in this chapter
1. Techniques to avoid the above 4 dependency types
2. Object knows aothother which knows another which knows something. Chances offirst object being changed because of the change in any intermediate object. Law if Dmeter violation.
3. Another class of dependencies is the test class.
4. Tests come first and they drive the design.

### Step 1
- Understand dependencies.

### Write loosely coupled code
- Dependency is like a dot of glue that causes your class to stick to the things it touches.
- Reducing dependencies
  - Recognize 
  - Remove the unnecessary

### Techniques

#### Inject Dependecies
```
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
#@wheel =  Wheel.new(26,15)
# puts @wheel.circumference
#puts Gear.new(52,11,@wheel).gear_inches
```
- A Gear class defined this way doesnt depend on the wheel class it can accept any class's object(DUCK) that respinds to diameter as an argument.

- Question = where is the responsibility of the Gear class in knowing about the actual wheel class lies?

#### Isolate Dependencies

- If dependencies cannot be removed isolate them with in your class.
- Every dependency is an alien bacterium trying to infect the class

- There are two way of isolating
```
class Gear
	attr_reader :chainring, :cog, :rim, :tire
  
	def initialize(cog, chainring, rim, tire)
		@cog = cog
		@chainring = chainring
		@wheel=Wheel.new(rim,tire)
  end
	
	def ratio
		chainring/cog.to_f
	end

	def gear_inches
		ratio*wheel.diameter
	end
end
In this method we are explicitly exposing the dependency in the initialize method lowering the barriers to reuse and making the code easy to refactor
```

```
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
		ratio*wheel.diameter
	end

  def wheel
    @wheel||= =Wheel.new(rim,tire)
  end
end
Gear still knows too much about the Wheel, knows the args,positions

```

#### Isolate vulnerable external messages

```
gear inches has a dependency on wheel and the diameter method 

def gear_inches
  ratio*diameter
end

def diameter
  wheel*diameter
end
preemptive isolation
```

#### Remove argument order dependencies
1. Cannot avoid having the knowledge of the arguments.
2. Order of arguments is something that can be tackled
3. Changing the arguments in the method signature causes all the dependent classes to change their message.
4. Use of key word arguments would fix this.

```
class Gear
 attr_reader :chainring, :cog, :wheel

 def initialize(chainring:, cog:, wheel:)
  @chainring=chainring
  @cog=cog
  @wheel=wheel
 end
end

Gear.new(cog:3, chainring:3, wheel: Wheel.new(3,2)).gear_inches
```
5. If we are passing arguments to an external library which may require positional arguments
Create a wrapper class that would take in keyword arguments and transforms them to positional args.

#### Managing dependency direction
1. To reverse the dependency is a way to manage dependencies

#### Reversing dependecies
`gear_reverse_dependency`
- All your classes are people
  - If you give them advice on how to behave you would tell them to depend on the things that change less often than you do.

  - Some classes are more likely to change than others
  - concrete classes are more likely to change than abstract classes
  - changing a class that has many dependencies will result in widespread consequences

  #### Undestand likelihood of change
  Every class in the application can be ranked on the basis of likelihood of change.
  Depending on an abstract is always safer than depending on concrete class
  

