<?php
require_once('ProductInterface.php');

/**
 * Concrete Products provide various implementations of the Product interface.
 */
class ConcreteProduct1 implements ProductInterface
{
    public function operation(): string
    {
        return "{Result of the ConcreteProduct1}";
    }
}
