<?php
    session_start();
    
    include 'conn.php';
        
    if($_SESSION){
        header('location: index.php');
    } else{

        if(isset($_GET['redirectProfile'])){
            $profileId = $_GET['redirectProfile'];
        }
    
        if(isset($_POST['submit'])){
            // session_start();
            //$username = $_POST['username'];
            $email = $_POST['email'];
            $hash = password_hash($_POST['password'], PASSWORD_BCRYPT);
            $password = password_verify($_POST['password'], $hash);

            function myAlert($pesan) {
                echo "<script type='text/javascript'>alert('$pesan');</script>";
            }
    
            $sql = "SELECT * FROM users WHERE `email`='$email'";
            $result = mysqli_query($conn,$sql);
            $row = $result->fetch_assoc();
            if($row != NULL){
                if(password_verify($_POST['password'],$row['password'])){
                    session_start();
                    $_SESSION['email'] = $email;
                    $_SESSION['id'] = $row['id'];
                    // var_dump($_SESSION['id']);
                    if($profileId != NULL){
                        header('location: profile.php?id='.$profileId);
                    } else{
                        header('location: index.php');
                    }
                } else
                {
                    myAlert("Password incorrect");
                }
            } else{
                myAlert("Email Not Found in database :(");
            }
        
        }
        mysqli_close($conn);

    }

include 'header.php';
?>

    <!--Login Starts-->
    <div class="login">
      
      <!--Hero Banner Starts-->
      <div id="index-banner" class="parallax-container">
        <div class="section no-pad-bot">
          <div class="container">
            <br><br>
            <h1 class="header center blue-text">IFly Login</h1>
            <div class="row center">
              <h5 class="header col s12 white-text">Silahkan login terlebih dahulu sebelum melakukan pemesanan tiket</h5>
            </div>
            <br><br>

          </div>
        </div>
        <div width="100%" class="parallax"><img src="images/Parallax4.jpg" alt="Unsplashed background img 1"></div>
      </div>
      <br>
      <!--Hero Banner Ends-->
      
      <!--Form Starts-->
      <div class="row">
        <div class="col s8 offset-s2">
          <div class="card blue lighten-2">
            <div class="card-content white-text">
            <span class="card-title center-align">IFly Login</span>
            <br>
              <div class="row">
                <form class="col s12" action="login.php<?php if(isset($_GET['redirectProfile'])){echo "?redirectProfile=".$_GET['redirectProfile'];}?>" method="POST">
                  <div class="row">
                    <div class="input-field col s12">
                      <input id="email" name="email" type="email" class="validate" required>
                      <label for="email">Email</label>
                    </div>
                    <div class="input-field col s12">
                      <input id="password" name="password" type="password" class="validate" required>
                      <label for="password">Password</label>
                    </div>
                  </div>
                  <div class="row">
                    <div class="center-align">
                      <button class="btn blue waves-effect waves-light center-align" type="submit" name="submit" id="submit">Submit
                        <i class="material-icons right">send</i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <br>
      <!--Form Ends-->

    </div>
    <!--Login End-->

<?php
include 'footer.php';
?>