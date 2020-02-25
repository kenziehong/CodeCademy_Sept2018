<?php
require_once('StrategyInterface.php');

class Context {
  private $_strategy = null;

  public function setStrategy(StrategyInterface $strategy) {
    $this->_strategy = $strategy;
  }

  public function executeStrategy(int $a, int $b) {
    return $this->_strategy->execute($a, $b);
  }
}



