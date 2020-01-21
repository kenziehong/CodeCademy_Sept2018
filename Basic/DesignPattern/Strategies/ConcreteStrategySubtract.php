<?php

class ConcreteStrategySubtract implements StrategyInterface {
  public function execute($a, $b) {
    return $a - $b;
  }
}
