<?php
require_once('Proxy.php');
require_once('FacebookService.php');

$proxy = new Proxy(new FacebookService());
$access = $proxy->checkAccess('developer');
$proxy->executeProxy($access);