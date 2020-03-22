<?php
require_once('PageAbstract.php');

class HtmlPage extends PageAbstract {
  protected function printHeader() {
    echo 'HTML Header';
  }

  protected function printBody() {
    echo 'HTML Body';
  }

  protected function printFooter() {
    echo 'HTML Footer';
  }

}