<?php
require_once 'ShareInterface.php';

class FacebookShare implements ShareInterface {
  private $_message = null;

  public function setMessage(String $message) {
    $this->_message = $message;
  }

  public function share() {
    // Complicated code... 
    echo "Share to Facebook " . $this->_message;
  }


}
