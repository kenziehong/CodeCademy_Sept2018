# Conceptual Example
  - What classes does it consist of?
  - What roles do these classes play?
  - In what way the elements of the pattern are related?

-----------

# Creational-Patterns
### provide various object creation mechanisms, which increase flexibility and reuse of existing code.

- [FactoryMethod]
  ### provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created

  ## SuperClass:
    - CreatorAbstract
      - factoryMethod: ProductInterface
  ## Subclasses:
    - Creator1 extends CreatorAbstract
      - factoryMethod: new Product1
    - Creator2 extends CreatorAbstract
      - factoryMethod: new Product2

- [AbstractFactory]
  ### lets you produce families of related objects without specifying their concrete classes.

  ## Interfaces:
    - FactoryInterface
      - produceA: ProductAInterface
      - produceB: ProductBInterface

    - ProductAInterface
      - operation

    - ProduceBInterface
      - operation
      - operation2: ProductAInterface

  ## Classes:
    - Factory1 implement FactoryInterface
      - produceA: new ProductA1
      - produceB: new ProductB1
    - Factory2 implement FactoryInterface
      - produceA: new ProductA2
      - produceB: new ProductB2

- [Builder]
  ### lets you construct complex objects step by step. The pattern allows you to produce different types and representations of an object using the same construction code

  ## Interface:
   - BuilderInterface
    - producePartA
    - producePartB
    - producePartC

  ## Classes:
  - Builder1 implement BuilderInterface
    - product
    - __contruct: reset
    - reset: new Product1
    - producePartA: product->parts[] = A1
    - producePartB: product->parts[] = B1
    - producePartC: product->parts[] = C1
    - getProduct:
      - product
      - reset

  - Builder2 implement BuilderInterface
    - product
    - __contruct: reset
    - reset: new Product2
    - producePartA: product->parts[] = A2
    - producePartB: product->parts[] = B2
    - producePartC: product->parts[] = C2
    - getProduct:
      - product
      - reset

  - Directory
    - builder
    - buildPartA: builder->producePartA
    - buildFull:
      - builder->producePartA
      - builder->producePartB
      - builder->producePartC

- [Prototype]
 ### lets you copy existing objects without making your code dependent on their classes.

------------

# Structural Patterns
### How to assemble objects and classes into larger structures while keeping these structures flexible and efficient

- [Facade]
  ### provides a simplified (but limited) interface to a complex system of classes, library or framework. While Facade decreases the overall complexity of the application, it also helps to move unwanted dependencies to one place
  `Giao diện nhất quán cho các đối tượng bên trong`

  ## Classes:
  - Facade
    - system1
    - system2
    - operation
      - system1->operation1
      - system2->operation1

      - system1->operation2
      - system2->operation3

  - System1
    - operation1
    - operation2
  - System2
    - operation1
    - operation3

- [Proxy]
  ### lets you provide a substitute or placeholder for another object. A proxy controls access to the original object, allowing you to perform something either before or after the request gets through to the original object.

  ## Interface
    - SubjectInterface
      - request

  ## Classes
    - RealSubject implement SubjectInterface
        - request

    - Proxy
      - realSubject
      - __contruct: realSubject = new RealSubject
      - request:
        - checkAccess
        - realSubject->request
        - logAccess
      - checkAccess
      - logAccess

- [Adapter]
  ### allows objects with incompatible interfaces to collaborate

  ## Superclass
    - Target
      - request
  ## Subclass
    - Adapter extends Target
      - adaptee
      - __construct: adaptee = new Adaptee
      - request
        - format (adaptee->specificRequest) like type of the requestTarget
  ## Class
    - Adaptee
      - specificRequest
  ## index
    - target = new Target
      - target->request
    - adaptee = new Adaptee
    - adapter = new Adapter (adaptee)
      - adapter->request

- [Bridge]
  ### lets you split a large class or a set of closely related classes into two separate hierarchies—abstraction and implementation—which can be developed independently of each other.

  ## Superclass
    - Abstract
      - implementation
      - __contruct(implementation): this->implementation = implementation
      - operation: Abstract . this->implementation->operationImplementation
  ## Subclass
    - ExtendedAbstraction extends Abstract
      - operation: ExtendedAbstraction . this->implementation->operationImplementation

  ## Interface
    - Implementation
      - operationImplementation

  ## Classes
    - ConcreteImplementationA implements Implementation
      - operationImplementation: ConcreteImplementationA

    - ConcreteImplementationB implements Implementation
      - operationImplementation: ConcreteImplementationB

  ## index
    - implementation = new ConcreteImplementationA
    - abstraction = new Abstraction($implementation)
      - abstraction->operation

    - implementation = new ConcreteImplementationB
    - abstraction = new ExtendedAbstraction($implementation)
      - abstraction->operation

---------

# Behavioral Patterns
### are concerned with algorithms and the assignment of responsibilities between objects.

- [Strategies]
  ### Defines a family of algorithms, put each of them into a separate class, and make their objects interchangeable

  ## Interface
    - StrategyInterface
      - excecute
  ## Classes
  - SubtractStrategy implement StrategyInterface
    - execute
  - MultipyStrategy implement StrategyInterface
    - execute
  - Context
    - strategy
    - setStrategy: strategy = new SubtractStrategy
    - executeStrategy: strategy->execute

- [Template-Method]
  ### Defines the skeleton of an algorithm in the superclass but lets subclasses override specific steps of the algorithm without changing its structure.

  ## Abstract
    - AbstractClass
      - templateMethod
        - baseOperation1
        - requiredOperations1
        - baseOperation2
        - hook1
        - requiredOperation2
        - baseOperation3
        - hook2

      - baseOperation1
      - baseOperation2
      - baseOperation3
      - abstract requiredOperations1
      - abstract requiredOperations2
      - hook1
      - hook2

  ## Classes
    - Class1 extend AbstractClass
      - requiredOperations1
      - requiredOperations2
    - Class2 extend AbstractClass
      - requiredOperations1
      - requiredOperations2

- [Command]
  - Turns a request into a stand-alone object that contains all information about the request.
  - This transformation lets you parameterize methods with different requests, delay or queue a request’s execution, and support undoable operations.