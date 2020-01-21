<?php

class ConcreteStrategyMultiply implements StrategyInterface {
  public function execute($a, $b) {
    return $a + $b;
  }
}
