<?php
require_once('Sender.php');
require_once('Light.php');
require_once('TurnOffCommand.php');
require_once('TurnOnCommand.php');

$sender = new Sender;
$light = new Light();

$sender->setCommand(new TurnOnCommand($light));
$sender->executeCommand();
echo $light->checkStatus();

$sender->setCommand(new TurnOffCommand($light));
$sender->executeCommand();
echo $light->checkStatus();
