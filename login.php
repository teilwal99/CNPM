<?php
include("config.php");
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
   // username and password sent from form 

   $myusername = addslashes($_POST['username']);
   $mypassword = md5(addslashes($_POST['password']));

   $sql = "SELECT * FROM user WHERE username = '$myusername' and password = '$mypassword'";
   $result = $db->query($sql) or die($db->error);
   $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
   $active = $row['role'];

   $count = mysqli_num_rows($result);

   // If result matched $myusername and $mypassword, table row must be 1 row

   if ($count == 1) {
      session_start();
      // session_register("myusername");
      $_SESSION['login_user'] = $myusername;
      $_SESSION['userid'] = $row['id'];
      header("location: {$_SERVER['HTTP_REFERER']}");
   } else {
      //$error = "Your Login Name or Password is invalid";
      $_SESSION['login_error'] = "error";
      header("location: {$_SERVER['HTTP_REFERER']}");
   }
}
?>
<html>

<head>
   <title>Login Page</title>

   <style type="text/css">
      body {
         font-family: Arial, Helvetica, sans-serif;
         font-size: 14px;
      }

      label {
         font-weight: bold;
         width: 100px;
         font-size: 14px;
      }

      .box {
         border: #666666 solid 1px;
      }
   </style>

</head>

<body style="background-color:#FFFFFF">

   <div>
      <div style="width:350px; border: solid 1px #333333; text-align:left">
         <div style="background-color:#333333; color:#FFFFFF; padding:3px;"><b>Login</b></div>

         <div style="margin:20px">

            <form action="" method="post">
               <label>UserName :</label><input type="text" name="username" class="box" /><br /><br />
               <label>Password :</label><input type="password" name="password" class="box" /><br /><br />
               <input type="submit" value=" Submit " /><br />
            </form>

            <div style="font-size:11px; color:#cc0000; margin-top:10px"><?php echo $error; ?></div>

         </div>

      </div>

   </div>

</body>

</html>