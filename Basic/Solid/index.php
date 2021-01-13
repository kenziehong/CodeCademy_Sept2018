<?php
require_once('ShapeInterface.php');
require_once('Circle.php');
require_once('Square.php');
require_once('AreaCalculator.php');
require_once('SumCalculatorOutputter.php');

$shapes = [
  new Circle(2),
  new Square(5),
  new Square(6),
];

$areas = new AreaCalculator($shapes);
$output = new SumCalculatorOutputter($areas);

echo $output->string();
echo $output->json();