<?php

require_once('HtmlPage.php');
require_once('PdfPage.php');

$htmlPage = new HtmlPage();
$pdfPage = new PDFPage();

$htmlPage->execute();
$pdfPage->execute();