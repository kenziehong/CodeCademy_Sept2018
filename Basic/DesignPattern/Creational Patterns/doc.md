[FactoryMethod]
  # provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created
  - SuperClass: Creator Abstrack
    - factoryMethod: ProductInterface
  - Subclasses: extends SupperClass
    - factoryMethod: ProductInterface { return new ConcreteProduct1 }

[AbstractFactory]    
  # solves the problem of creating entire product families without specifying their concrete classes.