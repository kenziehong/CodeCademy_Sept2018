<?php

/**
 * The Builder interface specifies methods for creating the different parts of
 * the Product objects.
 */
interface BuilderInterface
{
    public function producePartA(): void;

    public function producePartB(): void;

    public function producePartC(): void;
}
