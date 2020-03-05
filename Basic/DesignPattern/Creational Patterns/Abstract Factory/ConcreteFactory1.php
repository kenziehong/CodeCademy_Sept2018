<?php

// require_once('AbstractFactoryInterface.php');
// require_once('AbstractProductAInterface.php');
// require_once('AbstractProductBInterface.php');
require_once('ConcreteProductA1.php');
require_once('ConcreteProductB1.php');

/**
 * Concrete Factories produce a family of products that belong to a single
 * variant. The factory guarantees that resulting products are compatible. Note
 * that signatures of the Concrete Factory's methods return an abstract product,
 * while inside the method a concrete product is instantiated.
 */
class ConcreteFactory1 implements AbstractFactoryInterface
{
    public function createProductA(): AbstractProductAInterface
    {
        return new ConcreteProductA1;
    }

    public function createProductB(): AbstractProductBInterface
    {
        return new ConcreteProductB1;
    }
}