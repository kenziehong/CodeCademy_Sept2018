# Conceptual Example
  - What classes does it consist of?
  - What roles do these classes play?
  - In what way the elements of the pattern are related?

-----------

# Creational-Patterns
### provide various object creation mechanisms, which increase flexibility and reuse of existing code.

- `FactoryMethod`
  ### provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created

  ## Superclass
    - CreatorAbstract
      - factoryMethod: ProductInterface
      - someOperation:
        - product = this->factoryMethod
        - result = product->operation
  ## Subclasses
    - Creator1 extends CreatorAbstract
      - factoryMethod: new Product1
    - Creator2 extends CreatorAbstract
      - factoryMethod: new Product2
  ## Interface
    - ProductInterface
      - operation
  ## Classes
    - Product1 implements ProductInterface
      - operation: Product1
    - Product2 implements ProductInterface
      - operation: Product2
  ## index
    - creator = new Creator1
      - creator->someOperation
    - creator = new Creator2
      - creator->someOperation

- `AbstractFactory`
  ### lets you produce families of related objects without specifying their concrete classes.

  ## Interfaces
    - FactoryInterface
      - produceA: ProductAInterface
      - produceB: ProductBInterface

    - ProductAInterface
      - operation

    - ProduceBInterface
      - operation
      - operation2(ProductAInterface)
  ## Classes
    - Factory1 implements FactoryInterface
      - produceA: new ProductA1
      - produceB: new ProductB1

    - Factory2 implements FactoryInterface
      - produceA: new ProductA2
      - produceB: new ProductB2

    - ProductA1 implements ProductAInterface
      - operation: ProductA1

    - ProductA2 implements ProductAInterface
      - operation: ProductA2

    - ProductB1 implements ProductBInterface
      - operation: ProductB1
      - operation2(ProductAInterface): ProductB1

    - ProductB2 implements ProductBInterface
      - operation: ProductB2
      - operation2(ProductAInterface): ProductB2
  ## index
    - factory = new Factory1
      - productA = factory->produceA
      - productB = factory->produceB
        - productB->operation
        - productB->operation2(productA)

    - factory = new Factory2
      - productA = factory->produceA
      - productB = factory->produceB
        - productB->operation
        - productB->operation2(productA)

- `Builder`
  ### lets you construct complex objects step by step. The pattern allows you to produce different types and representations of an object using the same construction code

  ## Interface
    - BuilderInterface
      - producePartA
      - producePartB
      - producePartC

  ## Classes
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
      - setBuilder(builder): this->builder = builder
      - buildPartA: builder->producePartA
      - buildFull:
        - builder->producePartA
        - builder->producePartB
        - builder->producePartC

    - Product
      - listPart
  ## index
    -  director = new Director
      - builder = new Builder1
      - director->setBuilder(builder)
      - director->buildPartA
      - builder->getProduct->listPart

      - builder->producePartA
      - builder->producePartC
      - builder->getProduct->listPart

- `Prototype`
 ### lets you copy existing objects without making your code dependent on their classes.

------------

# Structural Patterns
### How to assemble objects and classes into larger structures while keeping these structures flexible and efficient

- `Facade`
  ### provides a simplified (but limited) interface to a complex system of classes, library or framework. While Facade decreases the overall complexity of the application, it also helps to move unwanted dependencies to one place
  `Giao diện nhất quán cho các đối tượng bên trong`

  ## Classes
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
  ## index
    - system1 = new System1
    - system2 = new System2
    - facade = new Facade(system1, system2)
      - facade->operation

- `Proxy`
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

  ## index
    - realSubject = new RealSubject
    - proxy = new Proxy(realSubject)
      - proxy->request

- `Adapter`
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

- `Bridge`
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

------------

# Behavioral Patterns
### are concerned with algorithms and the assignment of responsibilities between objects.

- `Strategies`
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
  ## index
    - context = new Context
    - multiplyStrategy = new MultipyStrategy
      - context->setStrategory(multiplyStrategy)
      - context->executeStrategy
    - subtractStrategy = new SubtractStrategy
      - context->setStrategory(subtractStrategy)
      - context->executeStrategy

- `Template Method`
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
  ## index
    - class = new Class1
      - class->templateMethod()
    - class = new Class2
      - class->templateMethod()

- `Command`
  ## turns a request into a stand-alone object that contains all information about the request. This transformation lets you parameterize methods with different requests, delay or queue a request’s execution, and support undoable operations.

  ## Interface
    - CommandInterface
      - execute
  ## Classes
    - SimpleCommand implements CommandInterface
      - payload
      - __contruct: this->payload = payload
      - execute: SimpleCommand . this->payload

    - ComplexCommand implements CommandInterface
      - receiver
      - a
      - b
      - __contruct (receiver, a, b):
        - this->receiver = receiver
        - this->a = a
        - this->b = b
        - execute:
          - ComplexCommand . this->receiver->doSomething(this->a)
          - ComplexCommand . this->receiver->doSomethingElse(this->b)

    - Receiver
      - doSomething(a): Receiver . a
      - doSomethingElse(b): Receiver . b

    - Invoker
      - onStart
      - onFinish
      - setOnStart(command): this->onStart = command
      - setOnFinish(command): this->onFinish = command
      - doSomethingImportant:
        - Invoker . this->onStart->execute
        - Invoker . this->onFinish->execute

  ## index
    - simple = new SimpleCommand('Say Hi')
    - invoker = new Invoker
      - invoker->setOnStart(simple)

    - receiver = new Receiver
    - complex = new ComplexCommand(receiver, 'Send email', 'Save report')
      - invoker->setOnFinish(receiver)