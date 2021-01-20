<?php
    session_start();
    include 'conn.php';

    
    $sql = "SELECT * FROM users";

    $rows = mysqli_query($conn, $sql);
    $i = 0;
    mysqli_close($conn);
    
include 'header.php';
?>

    <!--Order Starts-->
    <div class="order">
      
      <!--Hero Banner Starts-->
      <div id="index-banner" class="parallax-container">
        <div class="section no-pad-bot">
          <div class="container">
            <br><br>
            <h1 class="header center blue-text">IFly Order</h1>
            <div class="row center">
              <h5 class="header col s12 black-text">Silahkan cari penerbangan impian anda melalui form di bawah</h5>
            </div>
            <br><br>

          </div>
        </div>
        <div width="100%" class="parallax"><img src="images/Parallax6.jpg" alt="Unsplashed background img 1"></div>
      </div>
      <br>
      <!--Hero Banner Ends-->
      
      <!--Visual Banner Start-->
      <div class="row">
        <div class="col s12 l8 offset-l2">
          <div class="card">
            <div class="card-image waves-effect waves-block waves-light">
              <img class="activator" src="images/Image4.jpg">
            </div>
            <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">more_vert</i></span>
              <p><a href="#">This is a link</a></p>
            </div>
            <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
              <p>Here is some more information about this product that is only revealed once clicked on.</p>
            </div>
          </div>
        </div>
      </div>
      <!--Visual Banner Ends-->
      
      
      <!--Form Starts-->
      <div class="row">
        <div class="col s8 offset-s2">
          <div class="card blue lighten-2">
            <div class="card-content white-text">
            <span class="card-title center-align">IFly Order</span>
            <br>
              <div class="row">
                <form class="col s12">
                  <div class="row">
                    <div class="input-field col s12">
                      <input id="alamat_email" type="text" class="validate">
                      <label for="first_name">First Name</label>
                    </div>
                    <div class="input-field col s12">
                      <input id="nama_lengkap" type="text" class="validate">
                      <label for="last_name">Last Name</label>
                    </div>
                  </div>
                  <div class="row">
                    <div class="input-field col s12">
                      <input id="alamat_email" type="text" class="validate">
                      <label for="email">Email</label>
                    </div>
                    <div class="input-field col s12">
                      <input id="nama_lengkap" type="text" class="validate">
                      <label for="username">Username</label>
                    </div>
                  </div>
                  <div class="row">
                    <div class="input-field col s12">
                      <input id="nama_lengkap" type="text" class="validate">
                      <label for="password">Password</label>
                    </div>
                    <div class="input-field col s12">
                      <input id="nama_lengkap" type="text" class="validate">
                      <label for="password_validate">Validate Password</label>
                    </div>
                  </div>
                  <div class="row">
                    <div class="center-align">
                      <button class="btn blue waves-effect waves-light center-align" type="submit" name="action">Submit
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
    <!--Order End-->

<?php
include 'footer.php';
?>