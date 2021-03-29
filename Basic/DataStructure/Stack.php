<?php
require_once 'Node.php';

class Stack {
  private $_head = null;
  private $_size = 0;
  private $_limit = 0;

  private function getHeadNode() {
    return $this->_head;
  }

  private function setHeadNode($node) {
    $this->_head = $node;
  }

  public function __construct($limit) {
    $this->_limit = $limit;
  }

  public function push($data) {
    $hasSpace = $this->hasSpace();

    if ($hasSpace) {
      $headNode = $this->getHeadNode();
      $newNode = new Node($data);

      $newNode->setNextNode($headNode);
      $this->setHeadNode($newNode);

      $this->_size += 1;
    }
  }

  public function pop() {
    $headNode = $this->getHeadNode();

    if($headNode) {
      $nextNode = $headNode->getNextNode();
      $headData = $headNode->getData();

      $this->setHeadNode($nextNode);
      $this->_size -= 1;
      
      return $headData;
    }
  }

  public function peek() {
    $headNode = $this->getHeadNode();

    if($headNode) {
      $headData = $headNode->getData();
      return $headData;
    }
  }

  public function traverse() {
    $strStack = '';
    $headNode = $this->getHeadNode();

    while ($headNode) {
      $strStack .=  $headNode->getData() . ' -> ';
      $headNode = $headNode->getNextNode();
    }

    echo $strStack;
  }

  public function hasSpace() {
    $size = $this->_size;
    $limit = $this->_limit;

    return $size < $limit;
  }

}

$stack = new Stack(5);

$arr = [ 3, 5, 4, 1, 9];
foreach ($arr as $el) {
  $stack->push($el);
}

$stack->traverse();
echo PHP_EOL;
echo $stack->pop();
echo PHP_EOL;
$stack->traverse();


