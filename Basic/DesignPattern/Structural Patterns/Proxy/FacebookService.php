<?php
require_once 'ServiceInterface.php';

class FacebookService implements ServiceInterface {
  private $_message = null;

  public function setMessage(String $message) {
    $this->_message = $message;
  }

  public function share() {
    // Complicated code... 
    echo "Share to Facebook " . $this->_message;
  }
}
