<?php

class Node {
    public $data = null;
    public $link = null;
    
    public function __construct($data) {
        $this->data = $data;
    }
}

class LinkedList {
  private $_head = null;
  
  public function insert($data) {
      $newNode = new Node($data);
      $newNode->link = $this->_head;
      $this->_head = $newNode;
  }
  
  
}

$ll = new LinkedList();
$arr = array_rand(range(1,10), 3);

foreach ($arr as $el) {
  $ll->insert($el);
}

var_dump($ll);




