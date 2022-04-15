<?php
header("Content-type: text/html; charset=utf-8");
session_start();
include('config.php');
$con = @mysqli_connect(HOST, USER, PASS) or die('Failed to connect to database');
mysqli_select_db($con, DBNAME);
mysqli_set_charset($con, 'utf8');
if ($_GET['a'] == 'login') {
    
    //Get the posted value
    $email = $_POST['email'];
    $password = $_POST['password'];

    //Verify account and password
    $sql = "select * from users where email='{$email}'";
    $result = mysqli_query($con, $sql);
    if ($result && mysqli_num_rows($result) > 0) { //Valid account
        $row = mysqli_fetch_assoc($result);
        if ($password != $row['password']) { //Valid password
            echo "<script>alert('Incorrect password!');location.href='loginpage.html'</script>";
            exit;
        }
        $_SESSION['user'] = $row;
        echo "<script>location.href='main.php'</script>";
    } else { //Invalid account
        echo "<script>alert('Invalid account!');location.href='loginpage.html'</script>";
        exit;
    }

} else if ($_GET['a'] == 'register') {

    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $password2 = $_POST['password2'];

    if ($password != $password2) {
        echo "<script>alert('The two passwords you typed do not match.');location.href='register.html'</script>";
        exit;
    }

    $mailSql = "select id from users where email='{$email}'";
    mysqli_query($con, $mailSql);
    if (mysqli_affected_rows($con) > 0) {
        echo "<script>alert('This email has been registered.');location.href='register.html'</script>";
        exit;
    }

    $sql = "insert into users(`firstname`, `lastname`, `password`, `email`) values('$firstname','$lastname','$password','$email')";

    $result = mysqli_query($con, $sql);
    if (mysqli_insert_id($con) > 0) {
        echo "<script>alert('Success');location.href='loginpage.html'</script>";
    } else {
        echo "<script>alert('Failed');location.href='register.html'</script>";
        exit;
    }
} else if ($_GET['a'] == 'logout') {
    unset($_SESSION['user']);
        echo "<script>window.location.href='loginpage.html'</script>";
    exit;
}


mysqli_close($con);
@mysqli_free_result($result);