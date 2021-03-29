<?php
require_once('CreatorAbstract.php');
require_once('ConcreteProduct1.php');

/**
 * Concrete Creators override the factory method in order to change the
 * resulting product's type.
 */
class ConcreteCreator1 extends CreatorAbstract
{
    /**
     * Note that the signature of the method still uses the abstract product
     * type, even though the concrete product is actually returned from the
     * method. This way the Creator can stay independent of concrete product
     * classes.
     */
    public function factoryMethod(): ProductInterface
    {
        return new ConcreteProduct1;
    }
}