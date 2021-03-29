<?php

class Node {
  private $_data = null;
  private $_link = null;
  
  public function __construct($data) {
      $this->_data = $data;
  }

  public function getData() {
    return $this->_data;
  }

  public function getNextNode() {
    return $this->_link;
  }

  public function setNextNode($node) {
    $this->_link = $node;
  }
}
