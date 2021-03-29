<?php
require_once 'ShareInterface.php';

class TwitterShare implements ShareInterface {
  private $_message = null;

  public function setMessage(String $message) {
    $this->_message = $message;
  }

  public function share() {
    // Complicated code... 
    echo "Share to Twitter " . $this->_message;
  }


}
