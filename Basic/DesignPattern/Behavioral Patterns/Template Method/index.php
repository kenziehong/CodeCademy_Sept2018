<?php

require_once('AbstractClass.php');
require_once('ConcreteClass1.php');
require_once('ConcreteClass2.php');

/*
 * The client code calls the template method to execute the algorithm. Client
 * code does not have to know the concrete class of an object it works with, as
 * long as it works with objects through the interface of their base class.
 */
function clientCode(AbstractClass $class)
{
    // ...
    $class->templateMethod();
    // ...
}

echo "Same client code can work with different subclasses:\n";
clientCode(new ConcreteClass1);
echo "\n";

echo "Same client code can work with different subclasses:\n";
clientCode(new ConcreteClass2);