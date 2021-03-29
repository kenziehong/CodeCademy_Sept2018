<?php

class SubtractStrategy implements StrategyInterface {
  public function execute($a, $b) {
    return $a - $b;
  }
}
