<?php

$my_headers = array(); 
foreach ($_SERVER as $key => $value) { 
    if ('HTTP_' == substr($key, 0, 5)) { 
        $my_headers[str_replace('_', '-', substr($key, 5))] = $value; 
    } 
}

if (isset($_SERVER['PHP_AUTH_DIGEST'])) { 
    $my_headers['AUTHORIZATION'] = $_SERVER['PHP_AUTH_DIGEST']; 
} elseif (isset($_SERVER['PHP_AUTH_USER']) && isset($_SERVER['PHP_AUTH_PW'])) { 
    $my_headers['AUTHORIZATION'] = base64_encode($_SERVER['PHP_AUTH_USER'] . ':' . $_SERVER['PHP_AUTH_PW']); 
} 
if (isset($_SERVER['CONTENT_LENGTH'])) { 
    $my_headers['CONTENT-LENGTH'] = $_SERVER['CONTENT_LENGTH']; 
} 
if (isset($_SERVER['CONTENT_TYPE'])) { 
    $my_headers['CONTENT-TYPE'] = $_SERVER['CONTENT_TYPE']; 
}

$my_headers['REMOTE_ADDR'] = $_SERVER['REMOTE_ADDR']; 

if(!empty($_SERVER["HTTP_CLIENT_IP"])){ 
	$my_headers['HTTP_CLIENT_IP'] = $_SERVER["HTTP_CLIENT_IP"]; 
} 

header('Content-type:text/json'); 

$h = json_encode($my_headers);
echo $h;

?>
