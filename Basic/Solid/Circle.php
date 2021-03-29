<?php
class Circle implements ShapeInterface {
  public $radius;

  public function __construct(float $radius) {
    $this->radius = $radius;
  }

  public function area() {
    return pi() * pow($this->radius, 2);
  }
}