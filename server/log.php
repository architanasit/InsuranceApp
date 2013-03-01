<?php
class logger
{
    public function sqlerror($error)
    {
        $file   = fopen("/Users/TheCodeMaster/Desktop/BananaInsurance/dev/server/log/sqlerrorlog.txt", "a");
        $report = date("m/d/y", time()) . $error . "\n";
        fwrite($file, $report);
        fclose($file);
    }
    public function clienterror($error)
    {
        $file2   = fopen("/Users/TheCodeMaster/Desktop/BananaInsurance/dev/server/log/clienterrlog.txt", "a");
        $report2 = date("m/d/y", time()) . " " . $error . "\n";
        fwrite($file2, $report2);
        fclose($file2);
    }
}
?>
