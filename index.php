<?php
    session_start();
    include 'conn.php';

    
    // $sql = "SELECT * FROM users";

    // $rows = mysqli_query($conn, $sql);
    // $i = 0;
    // mysqli_close($conn);

    $view = "SELECT * FROM `viewstatuspenerbangan`";
    $rows = mysqli_query($conn, $view);
    mysqli_close($conn);

include 'header.php';
include 'style-ku.php';
?>
    <!--Content Starts-->
    <div class="home">
    
      <!--Hero Banner Start-->
      <div id="index-banner" class="parallax-container">
        <div class="section no-pad-bot">
          <div class="container">
            <br><br>
            <h1 class="header center blue-text">Online Ticket Booking</h1>
            <div class="row center">
              <h5 
                  class="header col s12 black-text">Selamat datang di IFly, satu langkah lagi menuju penerbangan impian anda!
              </h5>
            </div>
            <div class="row center">
            <?php if ($_SESSION) : ?>
                <a href="order.php" id="download-button" class="btn-large waves-effect waves-light blue lighten-2">Get Started</a>
            <?php else: ?>
                <a href="login.php" id="download-button" class="btn-large waves-effect waves-light blue lighten-2">Get Started</a>
            <?php endif; ?>
              
            </div>
            <br><br>

          </div>
        </div>
        <div width="100%" class="parallax"><img src="images/Parallax1.jpg" alt="Unsplashed background img 1"></div>
      </div>
      <br>
      <!--Hero Banner Ends-->
      
      <div class="section no-pad-bot" id="index-banner">
        <div class="container">
          <br><br>
          <h1 class="header center blue-text">Why Choose Us?</h1>
          <div class="row center">
            <h5 class="header col s12 light">Tujuan IFly adalah memudahkan segala kebutuhan tiket penerbangan anda!</h5>
          </div>
          <br><br>
        </div>
      </div>
      
      <!--Index Start-->
      <div class="row">
        <div class="col s12 l8 offset-l2">
          <div class="card">
            <div class="card-image">
              <img src="images/Image1.jpg">
              <span class="card-title">Easy Booking</span>
            </div>
            <div class="card-content">
              <p>IFly menawarkan mudahnya pemesanan tiket secara online. Anda bisa 
                memilih satu diantara ribuan penerbangan yang ada dan selalu update setiap harinya.</p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col s12 l8 offset-l2">
          <div class="card">
            <div class="card-image">
              <img src="images/Image2.jpg">
              <span class="card-title black-text">Tidak Perlu Antri</span>
            </div>
            <div class="card-content">
              <p>Tidak perlu antri sama sekali. Menggunakan sistem IFly yang canggih, kami akan 
                memastikan setiap pemesanan tiket penerbangan anda langsung selesai pada saat itu juga</p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col s12 l8 offset-l2">
          <div class="card">
            <div class="card-image">
              <img src="images/Image3.jpg">
              <span class="card-title">Keamanan Pembayaran</span>
            </div>
            <div class="card-content">
              <p>IFly adalah aplikasi pemesanan tiket penerbangan online yang sudah berstandar i
                nternasional dengan jaminan keamanan pembayaran dengan teknologi mutakhir.</p>
            </div>
          </div>
        </div>
        <h2>StatusPenerbangan</h2>

        <h6> Berikut adalah status penerbangan saat ini:</h6>

        <div class="table-wrapper">
          <table class="fl-table" id="dataTable" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th>Id Penerbangan</th>
                <th>Waktu Keberangkatan</th>
                <th>Lama Penerbangan</th>
                <th>Status Penerbangan</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($rows as $row) : ?>
                <tr>
                  <td> <?= $row['NomorPenerbangan'] ?> </td>
                  <td> <?= $row['waktu_berangkat'] ?> </td>
                  <td> <?= $row['LamaPenerbangan'] ?> </td>
                  <td> <?= $row['StatusPenerbangan'] ?> </td>
                </tr>
              <?php endforeach; ?>
            </tbody>

          </table>
        </div>
      </div>
      </div>
      <!--Index End-->

      
    
    </div>
    <!--Content End-->


<?php
include 'footer.php';
?>