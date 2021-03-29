# Single-Responsibility Principle
A class should have one and only one reason to change, meaning that a class should have only one job.

# Open-Closed Principle
Objects or entities should be open for extension but closed for modification. 

# Liskov Substitution Principle
Let q(x) be a property provable about objects of x of type T. Then q(y) should be provable for objects y of type S where S is a subtype of T.

q(x) x of type T 
q(y) y of type S (subtype of T)

This means that every subclass or derived class should be substitutable for their base or parent class.

# Interface Segregation Principle
A client should never be forced to implement an interface that it doesn’t use, or clients shouldn’t be forced to depend on methods they do not use.
# Dependency Inversion Principle
Entities must depend on abstractions, not on concretions. It states that the high-level module must not depend on the low-level module, but they should depend on abstractions.

