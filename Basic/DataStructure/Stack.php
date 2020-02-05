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
    $currentNode = $this->getHeadNode();

    if($currentNode) {
      $nextNode = $currentNode->getNextNode();
      $currentData = $currentNode->getData();

      $this->setHeadNode($nextNode);
      return $currentData;
    }
  }

  public function peek() {
    $currentNode = $this->getHeadNode();

    if($currentNode) {
      $currentData = $currentNode->getData();
      return $currentData;
    }
  }

  public function traverse() {
    $strStack = '';
    $currentNode = $this->getHeadNode();

    while ($currentNode) {
      $strStack .=  $currentNode->getData() . ' -> ';
      $currentNode = $currentNode->getNextNode();
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
echo $stack->peek();
echo PHP_EOL;
$stack->traverse();


