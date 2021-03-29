<?php
require_once('CommandInterface.php');

class Sender {
  private $_command = null;

  public function setCommand(CommandInterface $command) {
    $this->_command = $command;
  }

  public function executeCommand() {
    $this->_command->execute();
  }

}