<?php

// require_once('AbstractProductAInterface.php');

class ConcreteProductA2 implements AbstractProductAInterface
{
    public function usefulFunctionA(): string
    {
        return "The result of the product A2.";
    }
}