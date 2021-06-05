<?php
include('config.php');
session_start();

$user_check = $_SESSION['userid'];

$ses_sql = mysqli_query($db, "select * from user where id = '$user_check' ");

$row = mysqli_fetch_array($ses_sql, MYSQLI_ASSOC);


if (isset($_SESSION['login_user'])) {
   $userid_session = $row['id'];
   $login_session = $row['username'];
   $email = $row['email'];
   $birthday = $row['birthday'];
   $gender = $row['gender'];
   $phone = $row['phone'];
   $avatar = $row['avatar'];
   $role = $row['role'];
   // header("location:index.php");
}
