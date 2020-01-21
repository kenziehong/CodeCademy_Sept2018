<?php

require_once 'FacebookShare.php';
require_once 'TwitterShare.php';

class SocialMediaShare {
  private $_facebook = null;
  private $_twitter = null;

  public function __construct() {
    $this->_facebook = new FacebookShare();
    $this->_twitter = new FacebookShare();
  }

  public function share(String $message) {
    $this->_facebook->setMessage($message);
    $this->_twitter->setMessage($message);

    $this->_facebook->share();
    $this->_twitter->share();
  }
}

$obj = new SocialMediaShare();
$obj->share('News');
