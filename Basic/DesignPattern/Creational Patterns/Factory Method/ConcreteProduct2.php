<?php
require_once('ProductInterface.php');

class ConcreteProduct2 implements ProductInterface
{
    public function operation(): string
    {
        return "{Result of the ConcreteProduct2}";
    }
}