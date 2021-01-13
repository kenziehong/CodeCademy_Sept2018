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
      if (is_a($shape, 'ShapeInterface')) {
        $area[] = $shape->area();
        continue;
      }

      throw new Exception('Invalid shape');
    }

    return array_sum($area);
  }
}