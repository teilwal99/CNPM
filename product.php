<div style="display: none;">
    <?php
    include('session.php');
    ?>
</div>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Nhà hàng - Website</title>
    <link rel="icon" href="logo.ico" />
    <link rel="stylesheet" href="styleProduct.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body>
    <div id="navbar">
        <a href="index.php" class="home button">
            Nhà hàng <b>Website</b>
        </a>
        <?php
        if (!isset($_SESSION['login_user'])) {
            echo "<a href='#' id='myBtnMobile' class='button' onclick='openModal()'> Đăng nhập</a>";
        } else {
            echo "<a href='#' id='myBtnInfo' class='button' onclick='openModalInfo()'> Hello:" . $login_session . "</a>";
        }
        ?>
        <a href="index.php#contact" class="button">
            Liên hệ
        </a>
        <a href="index.php##about" class="button">
            Giới thiệu
        </a>
        <a href="index.php#projects" class="button">
            Sản phẩm
        </a>
        <?php
            if(!isset($_SESSION['login_user'])){
                $userid = 0;
            }
            else{
                $userid = $userid_session;
            }
            $result = mysqli_query($db, 'select count(id) as total from cart where user_id ='.$userid);
            $row = mysqli_fetch_assoc($result);
            $total_records = $row["total"];
            echo "<a href='#' id='myBtnMobile' class='button'> Cart Details ".$total_records." </a>";
        ?>
    </div>
    <div id="navbar_mobile">
        <div id="unactive_navbar">
            <a href="index.php" class="home button" onclick="myFunctionForHome()">
                <b>Nhà hàng </b> Website
            </a>
            <a href="javascript:void(0);" class="button" onclick="myFunction()">
                <i id="fa-bars" class="fa fa-bars"></i>
                <i id="fa-times" class="fa fa-times" style="display: none;"></i>
            </a>
        </div>
        <div id="active_navbar">
            <a href="#projects" class="button" onclick="myFunction()">
                Sản phẩm
            </a>
            <a href="#about" class="button" onclick="myFunction()">
                Giới thiệu
            </a>
            <a href="#contact" class="button" onclick="myFunction()">
                Liên hệ
            </a>
            <?php
            $result = mysqli_query($db, 'select count(id) as total from cart where user_id ='.$userid);
            $row = mysqli_fetch_assoc($result);
            $total_records = $row["total"];
            echo "<a href='cart.php' id='myBtnMobile' class='button'> Cart Details ".$total_records." </a>";
            ?>
            <?php
            if (!isset($_SESSION['login_user'])) {
                echo "<a href='#' id='myBtnMobile' class='button' onclick='openModal()'> Đăng nhập</a>";
            } else {
                echo "<a href='#' id='myBtnInfoMobile' class='button' onclick='openModalInfo()'> Hello:" . $login_session . "</a>";
            }
            ?>
        </div>
    </div>
    <div class="main_content">
        <div id="products">
            <?php
                $postid = $_GET['id'];
                $sql = "SELECT * FROM post WHERE id = '$postid'";
                $result = mysqli_query($db, $sql);
                $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
                echo "<h3 style='margin:30px 0px;'>Home>".$row['category']."</h3>
                <div class='sub_content_product'>
                    <div class='product-picture'>
                    <img src='./img/" . $row['img'] ."' alt='".$row['img']."' class='sub_picture'>
                    </div>
                    <div class='product-content'>
                        <div>
                            <h3>".$row['content']."</h3>
                        </div>
                        <div>
                            <h4>Price: ".(string)($row['cost'])."Vnd
                            </h4>
                            <a href='#' class='button about'>Buy Now</a>
                        </div>
                    </div>
                </div>
                <div class='decription'>
                    <b>Mô tả </b>
                    <p>".$row['desciption']."</p>
                </div>
                <form action='addcart.php' method='POST' enctype='multipart/form-data'>
                    <input type='number' style='display:none;' value='".$row['id']."' id='post_id' name='post_id'>
                    Số lượng: <input type='number' name='quantity' id='quantity' value='1'>
                    <div type='text' id='messages' style='font-size:11px; color:#cc0000; margin-top:10px'></div>
                    <input type='submit' class='button' value='Add to cart'>
                </form>
                ";

                
            ?>
        </div>
        <div id="projects">
            <div class="sub_title">
                <h2>Sản phẩm tương tự</h2>
            </div>
            <div class="projects_content">
                <?php
                $sql1 = "SELECT post.inmenu from post where id =".$_GET['id'];
                $result1 = mysqli_query($db, $sql1);
                $inmenu = $result1->fetch_assoc();

                $sql2 = "SELECT * FROM post WHERE inmenu = ".$inmenu['inmenu']." AND id != ". $_GET['id']." ORDER BY id LIMIT 8 OFFSET 0";
                $result2 = mysqli_query($db, $sql2);
                if ($result2->num_rows > 0) {
                    while ($row = $result2->fetch_assoc()) {
                        echo "<div class='sub_content' onclick='viewDetail(" . $row['id'] . ")'>
                                <img src='./img/" . $row['img'] . "' alt='house1' class='sub_picture'>
                                <div class='sub_text'>
                                    <span>" . $row['content'] . "</span>
                                </div>
                                <div class='prices'>
                                    <span>" . (string)($row['cost']) . "VND</span>
                                </div>
                            </div>";
                    }
                }
                ?>
            </div>
        </div>
    </div>
    <div id="myModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="button" style="margin-top: 18px;">
                    <span class="close">&times;</span>
                </div>
                <h2 style="margin-top: 20px !important;">Đăng nhập</h2>
            </div>
            <div class="modal-body">
                <form action="login.php" method="POST" style="width: 100%;">
                    <input type="text" id="username" name="username" placeholder="Username" required>
                    <input type="password" id="password" name="password" placeholder="Password" required>
                    <div style="display: flex;justify-content: space-between;">
                        <input type="submit" value="Đăng nhập">
                        <div class="signup-btn" onclick="openModalSignup()">Đăng ký</div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div id="myModalInfo" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="button" style="margin: 0px;">
                    <span class="close">&times;</span>
                </div>
                <h2 style="margin:0">Thông tin</h2>
            </div>
            <div class="modal-body">
                <div class="modal-left">
                    <?php echo "<img src='./img/" . $avatar . "'; style='width: 100%;height:auto;'>" ?>
                </div>
                <table class="modal-right">
                    <td>
                        <tr>
                            <td><label><b>UserName </b></label></td>
                            <td> <span><?php echo $login_session; ?></span></td>
                        </tr>
                        <tr>
                            <td><label><b>Mail </b> </label></td>
                            <td> <span><?php echo $email; ?></span></td>
                        </tr>
                        <tr>
                            <td><label><b>Birthday </b></label></td>
                            <td> <span><?php echo $birthday; ?></span></td>
                        </tr>
                        <tr>
                            <td><label><b>Phone number</b></label></td>
                            <td> <span><?php echo $phone; ?></span></td>
                        </tr>
                        <tr>
                            <td><label><b>Gender</b></label></td>
                            <td> <span><?php echo $gender; ?></span></td>
                        </tr>
                    </td>
                </table>
            </div>
            <div class="modal-footer" style="text-align: center;">
                <button class="signup-btn" onclick="openModalEditProfile()">Chỉnh sửa</button>
                <button class="signup-btn" onclick="window.location='logout.php';">Đăng xuất</button>
            </div>
        </div>
    </div>
    <div id="signupModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="button" style="margin-top: 18px;">
                    <span class="close">&times;</span>
                </div>
                <h2 style="margin-top: 20px !important;">Đăng ký</h2>
            </div>
            <div class="modal-body">
                <form action="signup.php" method="POST" style="width: 100%;">
                    <input type="text" id="username" name="username" placeholder="Username" required>
                    <input type="password" id="password" name="password" placeholder="Password" required>
                    <input type="text" id="email" name="email" placeholder="Email">
                    <input type="date" id="birthday" name="birthday" placeholder="Birthday">
                    <input type="tel" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required id="phone" name="phone" placeholder="Phone">
                    <select name="gender" id="gender">
                        <option value="Nam">Nam</option>
                        <option value="Nữ">Nữ</option>
                        <option value="Khác">Khác</option>
                    </select>
                    <input type="file" id="avatar" name="avatar" placeholder="Avatar">
                    <div style="display: flex;justify-content: center;">
                        <input type="submit" value="Đăng ký">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div id="editProfileModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="button" style="margin-top: 18px;">
                    <span class="close">&times;</span>
                </div>
                <h2 style="margin-top: 20px !important;">Chỉnh sửa</h2>
            </div>
            <div class="modal-body">
                <form action="editprofile.php" method="POST" style="width: 100%;">
                    <input type="text" id="username" name="username" placeholder="<?php echo $login_session; ?>" required>
                    <input type="password" id="password" name="password" placeholder="Password" required>
                    <input type="text" id="email" name="email" placeholder="<?php echo $email; ?>">
                    <input type="date" id="birthday" name="birthday" value="<?php echo $birthday; ?>">
                    <input type="tel" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required id="phone" name="phone" placeholder="<?php echo $phone; ?>">
                    <select name="gender" id="gender">
                        <option value="Nam" <?php echo $gender == 'Nam' ? 'selected' : '' ?>>Nam</option>
                        <option value="Nữ" <?php echo $gender == 'Nữ' ? 'selected' : '' ?>>Nữ</option>
                        <option value="Khác" <?php echo $gender == 'Khác' ? 'selected' : '' ?>>Khác</option>
                    </select>
                    <input type="file" id="avatar" name="avatar" placeholder="Avatar">
                    <div style="display: flex;justify-content: center;">
                        <input type="submit" value="Lưu">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        function myFunction() {
            var x = document.getElementById("active_navbar");
            if (x.style.height === "196px") {
                document.getElementById("fa-bars").style.display = "unset";
                document.getElementById("fa-times").style.display = "none";
                x.style.height = "0px";
            } else {
                x.style.height = "196px";
                document.getElementById("fa-bars").style.display = "none";
                document.getElementById("fa-times").style.display = "unset";
            }
        }

        function myFunctionForHome() {
            var x = document.getElementById("active_navbar");
            if (x.style.height === "196px") {
                document.getElementById("fa-bars").style.display = "unset";
                document.getElementById("fa-times").style.display = "none";
                x.style.height = "0px";
            }
        }
        var modal = document.getElementById("myModal");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal 
        openModal = function() {
            modal.style.display = "block";
            var x = document.getElementById("active_navbar");
            if (x.style.height === "196px") {
                myFunction();
            }
        }


        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }

        /********************************************/

        var modalInfo = document.getElementById("myModalInfo");

        // Get the <span> element that closes the modalInfo
        var spanInfo = document.getElementsByClassName("close")[1];

        // When the user clicks the button, open the modalInfo 
        openModalInfo = function() {
            modalInfo.style.display = "block";
            myFunction();
        }


        // When the user clicks on <span> (x), close the modalInfo
        spanInfo.onclick = function() {
            modalInfo.style.display = "none";
        }

        /********************************************/

        // Get the modal signup
        var modalSignup = document.getElementById("signupModal");

        // Get the <span> element that closes the modal
        var spanSignup = document.getElementsByClassName("close")[2];

        // When the user clicks the button, open the modal 
        openModalSignup = function() {
            modalSignup.style.display = "block";
        }


        // When the user clicks on <span> (x), close the modal
        spanSignup.onclick = function() {
            modalSignup.style.display = "none";
        }

        /********************************************/

        var modalEditProfile = document.getElementById("editProfileModal");

        // Get the <span> element that closes the modalEditProfile
        var spanEditProfile = document.getElementsByClassName("close")[3];

        // When the user clicks the button, open the modalEditProfile 
        openModalEditProfile = function() {
            modalEditProfile.style.display = "block";
            myFunction();
        }


        // When the user clicks on <span> (x), close the modalEditProfile
        spanEditProfile.onclick = function() {
            modalEditProfile.style.display = "none";
        }

        /********************************************/

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
            if (event.target == modalInfo) {
                modalInfo.style.display = "none";
            }
            if (event.target == modalSignup) {
                modalSignup.style.display = "none";
            }
            if (event.target == modalEditProfile) {
                modalEditProfile.style.display = "none";
            }
        }

        function viewDetail(id) {
            var path = "product.php?id=" + id.toString();
            window.location = path;
        }

        
    </script>
    <footer style="width: 100%;">
        <div class="footer">Copyright © 2021 Powered by <a style="color: gray; text-decoration: none; margin-left: 5px;" href="#" target="_blank">1713093</a>
        </div>
    </footer>
</body>
<?php 
if (isset($_SESSION['messages']) & (!isset($_SESSION['login_user']))) {
    echo "<script type='text/javascript'>
        document.getElementById('messages').innerHTML = 'Vui lòng đăng nhập trước!';
        </script>";
}
unset($_SESSION['messages']);
?>

</html>