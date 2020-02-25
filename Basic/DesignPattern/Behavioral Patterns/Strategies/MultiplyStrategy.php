<?php

class MultiplyStrategy implements StrategyInterface {
  public function execute($a, $b) {
    return $a + $b;
  }
}
