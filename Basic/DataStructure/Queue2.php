<?php
/**
 * Implementation of Queue using PHP
 * @author Al- Imran Ahmed
 */
class Element {
  public $value;
  public $next;
}

/**
 * Queue class that store element in queue
 * Remove element from font
 * Insert element to back
 */
class Queue {
  private $font = null;
  private $back = null;

  /**
   * Check whether the queue is empty or not
   * @return boolean
   * public function isEmpty(){ return false; }  //stub
   */
  public function isEmpty() {
    return $this->font == null;
  }

  /**
   * Insert element at the back of queue
   * @param $value
   * public function enqueue($value){} //stub
   */
  public function enqueue($value) {
    $oldBack = $this->back;
    $this->back = new Element();
    $this->back->value = $value;
    if ($this->isEmpty()) {
      $this->font = $this->back;
    } else {
      $oldBack->next = $this->back;
    }
  }

  /**
   * Remove element from the font of queue
   * @return $value
   * public function dequeue(){ return 0; } //stub
   */
  public function dequeue() {
    if ($this->isEmpty()) {
      return null;
    }
    $removedValue = $this->font->value;
    $this->font = $this->font->next;

    return $removedValue;
  }
}


//Client Code
$queue = new Queue();
$queue->enqueue("start");
$queue->enqueue(1);
$queue->enqueue(2);
$queue->enqueue(3);
$queue->enqueue(4);
$queue->enqueue("End");
while(!$queue->isEmpty()){
echo $queue->dequeue()."\n";
}
