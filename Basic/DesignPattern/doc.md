# Conceptual Example
  - What classes does it consist of?
  - What roles do these classes play?
  - In what way the elements of the pattern are related?

# Creational-Patterns
  [FactoryMethod]
  ### provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created

  ## SuperClass:
    - CreatorAbstract
      - factoryMethod: ProductInterface
  ## Subclasses:
    - Creator1 extends CreatorAbstract
      - factoryMethod: new Product1
    - Creator2 extends CreatorAbstract
      - factoryMethod: new Product2

  [AbstractFactory]
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

  [Builder]
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

 [Prototype]
 ### lets you copy existing objects without making your code dependent on their classes.