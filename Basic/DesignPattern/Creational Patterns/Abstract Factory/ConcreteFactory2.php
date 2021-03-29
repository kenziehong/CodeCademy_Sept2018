<?php

// require_once('AbstractFactoryInterface.php');
// require_once('AbstractProductAInterface.php');
// require_once('AbstractProductBInterface.php');
require_once('ConcreteProductA2.php');
require_once('ConcreteProductB2.php');

/**
 * Each Concrete Factory has a corresponding product variant.
 */
class ConcreteFactory2 implements AbstractFactoryInterface
{
    public function createProductA(): AbstractProductAInterface
    {
        return new ConcreteProductA2;
    }

    public function createProductB(): AbstractProductBInterface
    {
        return new ConcreteProductB2;
    }
}
