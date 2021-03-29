<?php

class Proxy {
  private $_service = null;

  public function __construct($service) {
    $this->_service = $service;
  }

  public function checkAccess($auth) {
    if ($auth == 'developer') {
      return true;
    } 

    return false;
  }

  public function executeProxy($auth) {
    if ($this->checkAccess($auth)) {
      $this->_service->share('hello');
    }
  }
}

