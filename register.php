<?php
    session_start();

    include 'conn.php';

    if($_SESSION){
        header('location: index.php');
    } else{
        // echo 'masuk not session';

        if(isset($_POST['submit'])){
            if($_POST['password'] !== $_POST['password_validate'])
            header('Location: register.php');
    
            $email = $_POST['email'];
            $username = $_POST['username'];

            $sql_u = "SELECT * FROM users WHERE username='$username'";
            $sql_e = "SELECT * FROM users WHERE email='$email'";
            $res_u = mysqli_query($conn, $sql_u);
            $res_e = mysqli_query($conn, $sql_e);

            function myAlert($pesan) {
                echo "<script type='text/javascript'>alert('$pesan');</script>";
            }
        
            if (mysqli_num_rows($res_u) > 0 && mysqli_num_rows($res_e) > 0) {
                $name_error = "Email and Username already taken";
                myAlert($name_error);
                // $name_error = 1; 	
            }else if(mysqli_num_rows($res_e) > 0){
                $email_error = "Email already taken"; 	
                myAlert($email_error);
                // $email_error = 1;
            } else if (mysqli_num_rows($res_u) > 0){
                $email_error = "Username already taken"; 	
                myAlert($email_error);
                // $email_error = 1;
            } else
            {
                $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
                // $nama_depan = $_POST['nama_depan'];
                // $nama_belakang = $_POST['nama_belakang'];
        
                // $sql = "INSERT INTO users (`email`, `username`, `password`)
                // VALUES ('$email', '$username', '$password')";

                $sql = "CALL register ('$email', '$username', '$password')";

                if (mysqli_query($conn, $sql)) {
                    myAlert("New record created successfully");
                    //echo "New record created successfully";
                    // header('location: login.php');
                } else {
                    //echo "Error: " . $sql . "<br>" . mysqli_error($conn);
                    myAlert("Error: " . $sql . "<br>" . mysqli_error($conn));
                }


            }

        }
        mysqli_close($conn);

    }

include 'header.php';
?>

    <!--Register Starts-->
    <div class="register">
      
      <!--Hero Banner Starts-->
      <div id="index-banner" class="parallax-container">
        <div class="section no-pad-bot">
          <div class="container">
            <br><br>
            <h1 class="header center blue-text">IFly Register</h1>
            <div class="row center">
              <h5 class="header col s12 white-text">Belum memiliki akun? Anda dapat mendaftar di sini!</h5>
            </div>
            <br><br>

          </div>
        </div>
        <div width="100%" class="parallax"><img src="images/Parallax5.jpg" alt="Unsplashed background img 1"></div>
      </div>
      <br>
      <!--Hero Banner Ends-->
      
      <!--Form Starts-->
      <div class="row">
        <div class="col s8 offset-s2">
          <div class="card blue lighten-2">
            <div class="card-content white-text">
            <span class="card-title center-align">IFly Register</span>
            <br>
              <div class="row">
                <form class="col s12" action="register.php" method="POST" name="form1" onsubmit="required()">
                  <!-- <div class="row">
                    <div class="input-field col s12">
                      <input id="nama_depan" name="nama_depan" type="text" class="validate" required>
                      <label for="first_name">First Name</label>
                    </div>
                    <div class="input-field col s12">
                      <input id="nama_belakang" name="nama_belakang" type="text" class="validate" required>
                      <label for="last_name">Last Name</label>
                    </div>
                  </div> -->
                  <div class="row">
                    <div class="input-field col s12">
                      <input id="email" name="email" type="email" class="validate" required>
                      <label for="email">Email</label>
                    </div>
                    <div class="input-field col s12">
                      <input id="username" name="username" type="text" class="validate" required>
                      <label for="username">Username</label>
                    </div>
                  </div>
                  <div class="row">
                    <div class="input-field col s12">
                      <input id="password" name="password" type="password" class="validate" onkeyup='check();' required>
                      <label for="password">Password</label>
                    </div>
                    <div class="input-field col s12">
                      <input id="password_validate" name="password_validate" type="password" class="validate" onkeyup='check();' required>
                      <label for="password_validate">Validate Password</label>
                      <span id="message"></span>
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
    <!--Register End-->

    <script type="text/javascript">
        var check= function(){
            if (document.getElementById('password').value ==
          document.getElementById('password_validate').value) {
          document.getElementById('message').style.color = 'green';
          document.getElementById('message').innerHTML = 'Password Matches!';
            } else {
          document.getElementById('message').style.color = 'red';
          document.getElementById('message').innerHTML = 'Password is not the same!';
            }
        }

        function required()
            {
              var empt = document.forms["form1"]["image"].value;
              if (empt == "" || empt == null)
              {
              alert("Please insert your Profile Pictures.");
              return false;
              }
              else 
              {
              //alert('Code has accepted : you can try another');
              return true; 
              }
            }
    </script>

<?php
include 'footer.php';
?>