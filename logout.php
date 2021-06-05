<?php
   session_start();
   // session_destroy();
   // header("location: index.php");
   // error_log("logout ");
   if(session_destroy()) {
      header("location: index.php");
   }
?>