<?php

class PasswordRemider { // high-level module
  private $dbConnection;

  public function __construct(MySQLConnection $dbConnection) { // low-level module (1. violates denpend on abstraction, not on concretions, 2. violates the open-closed principle when database changes)
    $this->dbConnection = $dbConnection;
  }
}