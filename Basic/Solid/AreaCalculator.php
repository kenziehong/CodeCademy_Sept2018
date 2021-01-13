<?php

class AreaCalculator {
  protected $shapes;

  public function __construct(array $shapes = []) {
    $this->shapes = $shapes;
  }

  public function sum() {
    $shapes = $this->shapes;
    
    if (empty($shapes)) {
      return 0;
    }
    
    $area = []; 
    foreach ($shapes as $shape) {
      if (is_a($shape, 'Square')) {
        $area[] = pow($shape->length, 2);
        continue;
      }

      if(is_a($shape, 'Circle')) {
        $area[] = pi() * pow($shape->radius, 2);
      }
    }

    return array_sum($area);
  }

  public function output() {
    return 'Sum of the areas of provided shapes: '. $this->sum();
  }
}