<?php
require_once 'Node.php';
class LinkedList {
  private static $_head = null;
  
  private static function getHeadNode() {
    return self::$_head;
  }

  private static function setHeadNode($node) {
    self::$_head = $node;
  }
  
  public function insert($data) {
    $headNode = self::getHeadNode();
    $newNode = new Node($data);

    $newNode->setNextNode($headNode);
    self::setHeadNode($newNode);
  }

  public function traverse() {
    $strLinkedList = '';
    $currentNode = self::getHeadNode();

    while ($currentNode) {
      $strLinkedList .=  $currentNode->getData() . ' -> ';
      $currentNode = $currentNode->getNextNode();
    }

    echo $strLinkedList;
  }

  public function remove($data) {
    $currentNode = self::getHeadNode();
    $currentData = $currentNode->getData();

    if ($currentData === $data) {
      $nextNode = $currentNode->getNextNode();
      self::setHeadNode($nextNode);
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
$arr = [ 3, 5, 4, 1, 9];
foreach ($arr as $el) {
  $ll->insert($el);
}

// var_dump($ll);
$ll->traverse();
echo PHP_EOL;
$ll->remove(4);
$ll->traverse();




