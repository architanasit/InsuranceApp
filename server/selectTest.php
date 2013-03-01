<?php
include_once("alerts.php");
$off = new alerts();
$a   = $off->getOffers(20110503);

$op = json_encode($a);
echo $op;
?>