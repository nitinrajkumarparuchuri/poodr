- An application is sum of its classes
- Made up of classes and defined by messages.
- Design deals not only with  what objects know(their responsibilities) who they know(their dependencies) and also how they talk to one another.
- The conversation between objects tales place using interfaces
`Let's talk about creating flexible interfaces that allows application to grow and to change

#### Understanding Interfaces

![Communication pattern](<Screenshot 2024-12-26 115025.png>)

The design issue in the first application is not necessarily afailure of dependency injection or SRP. Those while necessary are not enough to prevent the construction of an app whose design causes you pain.

`The root of this new problem is not in what each class does but in what it reveals`

In the first app every class reveals all
In the second app the message pattern are visibly constrained. It has some agreement about what messages may passbetween between its objects.
- Those exposed methods comprise the class's public interface.
1. Interface with in the class. some of the methods are intended to be used by others and these methods make up its public interface.
2. A set of messages where messages themselves define the interface.(Confusing for now)pg 62
- This chapter is about 1. How and what to expose

#### Defining Interfaces

Customers order food of a menu
Kitchen has many messages being passed among them to which the customer is never exposed. 
Customer can only depend on the menu method of the Kitchen class.

##### Public Interfaces
- Reveal primary responsibility
- Are expected to be invoked by others
- will not change on a whim
- Are safe for others to depend on
- Are thoroughly documented in the tests

##### Private Interfaces
- Handle the implementation details
- Are not exected to be sent by other objects
- Can change for anyreason whatso ever
- Are unsafe for others to depend on
- May not even be referenced in the tests


#### 1.Responsibility 2.Dependency and 3.Interface
1. Creatting classes with single responsibility- single purpose
2. Class chould depend on classes that change less often than it does.
3. Public parts are stable and the private parts are changeable. Which methods can be safely depended on.

`Domain objects are a trap`

#### Using Sequence Diagrams


- I know what I want and I know how you do it
- I know what I want and I know what you do
- I know what I want and I trust you to do your part
- Switching your attention from objects to messages allows you to concentrate on designing an application built upon public interfaces.

#### Rules of thumb for creating interfaces
- unchangeable names
- Keyword arguments
- Ruby provides with public, protected, private - use tthem to specify which one is stable and which is not
- Control how visible the method is to other parts of the application
- Law of Demeter

