<?php
header("Content-type: text/html; charset=utf-8");
session_start();
include('config.php');

$user = array_key_exists("user",$_SESSION) ? $_SESSION['user']:null;

if($user){
    exit(json_encode(['code'=>1,'user'=>$user]));
}

exit(json_encode(['code'=>0]));