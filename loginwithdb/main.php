<?php
header("Content-type: text/html; charset=utf-8");
session_start();
?>
<style>
    h1 a{text-decoration: none;color:#e9450c}
</style>
<h1>Welcome!<?php echo $_SESSION['user']['firstname']." ".$_SESSION['user']['lastname']?> <a href="action.php?a=logout">[Log out]</a> </h1>

