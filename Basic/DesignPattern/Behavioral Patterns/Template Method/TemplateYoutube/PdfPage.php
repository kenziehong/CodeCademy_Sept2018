<?php
require_once('PageAbstract.php');

class PdfPage extends PageAbstract {
  protected function printHeader() {
    echo 'PDF Header';
  }

  protected function printBody() {
    echo 'PDF Body';
  }

  protected function printFooter() {
    echo 'PDF Footer';
  }

}