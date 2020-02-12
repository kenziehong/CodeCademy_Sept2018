<?php
require_once 'Node.php';

class Queue {
  private $_head = null;
  private $_tail = null;
  private $_size = 0;
  private $_limit = 0;

  private function getHeadNode() {
    return $this->_head;
  }

  private function setHeadNode($node) {
    $this->_head = $node;
  }

  private function getTailNode() {
    return $this->_tail;
  }

  private function setTailNode($node) {
    $this->_tail = $node;
  }

  public function __construct($limit) {
    $this->_limit = $limit;
  }

  public function enqueue($data) {
    $hasSpace = $this->hasSpace();

    if ($hasSpace) {
      $headNode = $this->getHeadNode();
      $newNode = new Node($data);

      if ($this->isEmpty()) {
        $this->setTailNode($newNode); // differ
      } else {
        $headNode->setNextNode($newNode); // $tailNode->setNextNode
      }
      
      $this->setHeadNode($newNode);

      $this->_size += 1;
    }
  }

  public function dequeue() {
    if ($this->isEmpty()) {
      return null;
    }

    $tailNode = $this->getTailNode();
    if ($tailNode) {
      $nextNode = $tailNode->getNextNode();
      $tailValue = $tailNode->getData();

      $tailNode->setNextNode($nextNode);
      $this->_size -= 1;

      return $tailValue;
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
    $strqueue = '';
    $currentNode = $this->getTailNode();

    while ($currentNode) {
      $strqueue .=  $currentNode->getData() . ' -> ';
      $currentNode = $currentNode->getNextNode();
    }

    echo $strqueue;
  }

  public function hasSpace() {
    $size = $this->_size;
    $limit = $this->_limit;

    return $size < $limit;
  }

  public function isEmpty() {
    return $this->_size === 0;
  }

  public function getSize() {
    return $this->_size;
  }

}

$queue = new Queue(5);

$arr = [ 3, 5, 4, 1, 9];
foreach ($arr as $el) {
  $queue->enqueue($el);
}

$queue->traverse();
echo PHP_EOL;
echo $queue->dequeue();
echo PHP_EOL;
$queue->traverse();


