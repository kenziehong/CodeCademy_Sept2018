<?php
require_once('Context.php');
require_once('MultiplyStrategy.php');
require_once('SubtractStrategy.php');

$context = new Context();

$context->setStrategy(new MultiplyStrategy());
echo $context->executeStrategy(12, 35);

$context->setStrategy(new SubtractStrategy());
echo $context->executeStrategy(12, 35);