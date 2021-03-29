<?php
require_once 'Node.php';
class LinkedList {
  private $_head = null;

  private function getHeadNode() {
    return $this->_head;
  }

  private function setHeadNode($node) {
    $this->_head = $node;
  }

  public function insert($data) {
    $headNode = $this->getHeadNode();
    $newNode = new Node($data);

    $newNode->setNextNode($headNode);
    $this->setHeadNode($newNode);
  }

  public function traverse() {
    $strLinkedList = '';
    $currentNode = $this->getHeadNode();

    while ($currentNode) {
      $strLinkedList .= $currentNode->getData() . ' -> ';
      $currentNode = $currentNode->getNextNode();
    }

    echo $strLinkedList;
  }

  public function remove($data) {
    $currentNode = $this->getHeadNode();
    $currentData = $currentNode->getData();

    if ($currentData === $data) {
      $nextNode = $currentNode->getNextNode();
      $this->setHeadNode($nextNode);
    } else {
      while ($currentNode) {
        $nextNode = $currentNode->getNextNode();
        $nextData = $nextNode->getData();

        if ($nextData === $data) {
          $currentNode->setNextNode($nextNode->getNextNode());
          $currentNode = null;
        } else {
          $currentNode = $currentNode->getNextNode();
        }
      }
    }
  }
}

$ll = new LinkedList();
// $arr = array_rand(range(1,10), 5);
$arr = [3, 5, 4, 1, 9];
foreach ($arr as $el) {
  $ll->insert($el);
}

// var_dump($ll);
$ll->traverse();
echo PHP_EOL;
$ll->remove(4);
$ll->traverse();
