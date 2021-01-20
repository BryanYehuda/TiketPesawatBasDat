<?php
    session_start();
    include 'conn.php';

    
    $sql = "SELECT * FROM users";

    $rows = mysqli_query($conn, $sql);
    $i = 0;
    mysqli_close($conn);
    
include 'header.php';
?>
    <!--Content Starts-->
    <div class="contact">
    
      <!--Hero Banner Start-->
      <div id="index-banner" class="parallax-container">
        <div class="section no-pad-bot">
          <div class="container">
            <br><br>
            <h1 class="header center blue-text">Contact Us</h1>
            <div class="row center">
              <h5 class="header col s12 black-text">Tidak perlu khawatir, anda dapat menghubungi customer service kami disini</h5>
            </div>
            <br><br>

          </div>
        </div>
        <div width="100%" class="parallax"><img src="images/Parallax3.jpg" alt="Unsplashed background img 1"></div>
      </div>
      <br>
      <!--Hero Banner Ends-->
      
      <!--Contact Start-->
      <div class="row">
        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center blue-text"><i class="large material-icons">call</i></h2>
            <h5 class="center">Phone</h5>
            <h6 class="center">+6212345678910</h6>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center blue-text"><i class="material-icons">sms</i></h2>
            <h5 class="center">Messaging</h5>
            <h6 class="center">+6212345678910</h6>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center blue-text"><i class="material-icons">desktop_windows</i></h2>
            <h5 class="center">Website</h5>
            <h6 class="center">ifly.my.id</h6>
          </div>
        </div>
      </div>
      <!--Contact End-->
      
      <!--Contact Start-->
      <div class="row">
        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center blue-text"><i class="large material-icons">email</i></h2>
            <h5 class="center">Email</h5>
            <h6 class="center">IFLy@gmail.com</h6>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center blue-text"><i class="material-icons">thumb_up</i></h2>
            <h5 class="center">Facebook</h5>
            <h6 class="center">IFLy Online Booking</h6>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center blue-text"><i class="material-icons">subscriptions</i></h2>
            <h5 class="center">Youtube</h5>
            <h6 class="center">IFLy Online Booking</h6>
          </div>
          </div>
      </div>
      <br>
      <!--Contact End-->

<?php
include 'footer.php';
?>