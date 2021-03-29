<?php

abstract class PageAbstract {

  abstract protected function printHeader(); 

  abstract protected function printBody(); 

  abstract protected function printFooter();

  public function execute() {
    echo '=====================';
    $this->printHeader();
    $this->printBody();
    $this->printFooter();
    echo '=====================';
  }

}