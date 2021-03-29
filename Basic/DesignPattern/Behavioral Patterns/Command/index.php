<?php
require_once('Command.php');
require_once('SimpleCommand.php');
require_once('ComplexCommand.php');
require_once('Receiver.php');
require_once('Invoker.php');

/**
 * The client code can parameterize an invoker with any commands.
 */
$invoker = new Invoker;
$invoker->setOnStart(new SimpleCommand("Say Hi!"));
$receiver = new Receiver;
$invoker->setOnFinish(new ComplexCommand($receiver, "Send email", "Save report"));

$invoker->doSomethingImportant();