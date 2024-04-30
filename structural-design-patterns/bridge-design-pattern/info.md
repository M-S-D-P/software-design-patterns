# Bridge design pattern

The Bridge design pattern is a structural pattern that decouples an abstraction from its implementation so that the two can vary independently. This pattern is particularly useful when there are multiple dimensions of variation in a system. Here's how it works:

## Bridge Pattern Components:
* Abstraction: This defines the interface for the "abstraction" part of the pattern. It maintains a reference to an implementation object.
* Refined Abstraction: This extends the abstraction, adding more specific functionality.
* Implementor: This defines the interface for the "implementation" part of the pattern.
* Concrete Implementor: These are concrete implementations of the implementor interface.
