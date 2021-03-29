<?php
class Context {
  private $_strategy = null;
  private static $instance = null;

  /**
   * is declared as protected to prevent creating a new instance outside of the class via the new operator.
   */
  private function __construct() { 
  }

  /**
   *  is declared as private to prevent cloning of an instance of the class via the clone operator.
   */
  private function __clone() {
  }

  /**
   *  is declared as private to prevent unserializing of an instance of the class via the global function unserialize() 
   */
  private function __wakeup() {
  }

  public static function getInstance() {
    if (self::$instance === null) {
      self::$instance = new Context();
    }

    return self::$instance;
  }

  public function setStrategy(StrategyInterface $strategy) {
    $this->_strategy = $strategy;
  }

  public function executeStrategy(int $a, int $b) {
    return $this->_strategy->execute($a, $b);
  }
}

$context = Context::getInstance();
