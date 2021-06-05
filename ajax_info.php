<?php
    include("config.php");
    
    session_start();
    $userid=$_GET['id'];
    $userid = mysqli_real_escape_string($db,$_GET['id']);
    $sql = "SELECT * FROM user WHERE id = '$userid';";
    $result = mysqli_query($db, $sql);
    $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
    $genNam ="<option value='Nam' >Nam</option>";
    $genNu ="<option value='Nữ'   >Nữ</option>";
    $genKhac ="<option value='Khác' >Khác</option>";
    if($row['gender'] == 'Nam'){
        $genNam="<option value='Nam' selected >Nam</option>";
    }else{
        if($row['gender'] == 'Nữ'){
            $genNu ="<option value='Nữ' selected  >Nữ</option>";
        }else{
            $genKhac ="<option value='Khác' selected >Khác</option>";
        }
    }
    echo "<div class='modal-content'>
        <div class='modal-header'>
            <div class='button' style='margin-top: 18px;'>
                <span class='close'>&times;</span>
            </div>
            <h2 style='margin-top: 20px !important;'>Chỉnh sửa</h2>
        </div>
        <div class='modal-body'>
            <form action='editprofile.php' method='POST' style='width: 100%;' enctype='multipart/form-data'>
                <input type='hidden' id='id' name='id' value='".$row['id']."'>
                <input type='text' id='username' name='username' value='".$row['username']."' required>
                <input type='password' id='password' name='password' placeholder='Password'>
                <input type='text' id='email' name='email' placeholder='".$row['email']."' value='".$row['email']."'>
                <input type='date' id='birthday' name='birthday' value='".$row['birthday']."'>
                <input type='tel' pattern='[0-9]{10}' required id='phone' name='phone' value='".$row['phone']."'>
                <select name='gender' id='gender'>".
                $genNam.$genNu.$genKhac."
                </select>
                <input type='file' id='avatar' name='avatar' placeholder='Avatar'>
                <div style='display: flex;justify-content: center;'>
                    <input type='submit' value='Lưu'>
                    <button class='signup-btn' onclick='deleteUser(".$row['id'].")'>Xoá</button>
                </div>
            </form>
        </div>
    </div>";
?>