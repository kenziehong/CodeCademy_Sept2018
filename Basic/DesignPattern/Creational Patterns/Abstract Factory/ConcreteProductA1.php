<?php

require_once('AbstractProductAInterface.php');

/**
 * Concrete Products are created by corresponding Concrete Factories.
 */
class ConcreteProductA1 implements AbstractProductAInterface
{
    public function usefulFunctionA(): string
    {
        return "The result of the product A1.";
    }
}