<?php
require_once('CreatorAbstract.php');
require_once('ConcreteProduct2.php');

class ConcreteCreator2 extends CreatorAbstract
{
    public function factoryMethod(): ProductInterface
    {
        return new ConcreteProduct2;
    }
}