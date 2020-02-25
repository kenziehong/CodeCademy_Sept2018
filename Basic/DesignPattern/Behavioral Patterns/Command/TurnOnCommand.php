<?php
require_once('CommandInterface.php');

class TurnOnCommand implements CommandInterface {
  private $_light = null;

  public function __construct(Light $light) {
    $this->_light = $light;
  }

  public function execute() {
    $this->_light->turnOn();
  }
}