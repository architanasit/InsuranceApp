<?php
include_once("dbio.php");
class quotes
{
    function getQuotes($cust_id)
    {
        $db    = new dbio();
        $query = "SELECT * from quotes WHERE quotes_user_id = '$cust_id'";
        $data  = $db->selectquery($query);
        
        if (!data) {
            //report error;
            return 0;
        } else {
            return $data;
        }
    }
    
    function makeQuote($cust_id, $date, $type, $premium, $desc)
    {
        $db    = new dbio();
        $query = "INSERT INTO quotes(quotes_user_id, quotes_date, quotes_type
		, quotes_premium, quotes_desc)
		VALUES('$cust_id', '$date', '$type', '$premium', '$desc')";
        $data  = $db->insertquery($query);
        
        if (!data) {
            //report error;
            return 0;
        } else {
            return $data;
        }
    }
}

/*$quo = new quotes();
$a = $quo->makeQuote(1, 20110705, "boat", 350, "it_s a great Honda boat");
echo $a;
var_dump($a);
?>*/