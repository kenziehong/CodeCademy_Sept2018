<?php

class Light {
  private $_status = null;

  public function turnOn() {
    $this->_status = true;
  }

  public function turnOff() {
    $this->_status = false;
  }

  public function checkStatus() {
    return "Status " . ($this->_status ? "ON" : "OFF");
  }
}