<?php
    include("config.php");
    
    session_start();
    $productid=$_GET['id'];
    $productid = mysqli_real_escape_string($db,$_GET['id']);
    $sql = "SELECT * FROM post WHERE id = '$productid';";
    $result = mysqli_query($db, $sql);
    $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
    
    echo "<div class='modal-content'>
    <div class='modal-header'>
        <div class='button' style='margin-top: 18px;'>
            <span class='close'>&times;</span>
        </div>
        <h2 style='margin-top: 20px !important;'>Chỉnh sửa</h2>
    </div>
    <div class='modal-body'>
        <form action='editproduct.php' method='POST' style='width: 100%;' enctype='multipart/form-data'>
            <input type='hidden' id='id' name='id' value='".$row['id']."'>
            <input type='text' id='content' name='content' value='".$row['content']."' required>
            <input type='text' id='category' name='category' value='".$row['category']."'>
            <textarea name='description'value='".$row['desciption']."'></textarea>
            <input type='number' id='cost' name='cost' value='".$row['cost']."'>
            <input type='file' id='img' name='img' placeholder='Picture'>
            <div style='display: flex;justify-content: center;'>
                <input type='submit' value='Lưu'>
                <button class='signup-btn' onclick='deleteProduct(".$row['id'].")'>Xoá</button>
            </div>
        </form>
    </div>
</div>";
?>