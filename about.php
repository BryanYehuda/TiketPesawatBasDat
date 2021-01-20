<?php
    session_start();
    include 'conn.php';

    
    $sql = "SELECT * FROM users";

    $rows = mysqli_query($conn, $sql);
    $i = 0;
    mysqli_close($conn);
    
include 'header.php'
?>
    <!--Content Starts-->
    <div class="about">
    
      <!--Hero Banner Start-->
      <div id="index-banner" class="parallax-container">
        <div class="section no-pad-bot">
          <div class="container">
            <br><br>
            <h1 class="header center blue-text">About Us</h1>
            <div class="row center">
              <h5 class="header col s12 black-text">Ingin pesan tiket pesawat secara cepat, praktis, dan terjangkau? Kini kamu tak perlu risau, hanya dengan satu sentuhan jari, tiket pesawat yang kamu butuhkan bisa didapatkan dengan mudah di IFly.</h5>
            </div>
            <br><br>

          </div>
        </div>
        <div width="100%" class="parallax"><img src="images/Parallax2.jpg" alt="Unsplashed background img 1"></div>
      </div>
      <br>
      <!--Hero Banner Ends-->
      
      <div class="section no-pad-bot" id="index-banner">
        <div class="container">
          <br><br>
          <h1 class="header center blue-text">Our Features</h1>
          <div class="row center">
            <h5 class="header col s12 light">Kita menawarkan berbagai macam fitur, semuanya demi kenyamanan anda!</h5>
          </div>
          <br><br>
        </div>
      </div>
      
      <!--About Start-->
      <div class="row">
        <div class="col s12 l4">
          <div class="card">
            <div class="card-image waves-effect waves-block waves-light">
              <img class="activator" src="images/suketcovid.jpg">
            </div>
            <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">Surat Keterangan Covid<i class="material-icons right">more_vert</i></span>
            </div>
            <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">Surat Keterangan Covid<i class="material-icons right">close</i></span>
              <p>IFly merupakan platform penerbangan terkini dilengkapi dengan kelebihan fiturnya yakni Update Status Penerbangan dan Lama Penerbangan hingga kemudahan dalam Pengecekan ID dan Surat Covid.</p>
            </div>
          </div>
        </div>
        <div class="col s12 l4">
          <div class="card">
            <div class="card-image waves-effect waves-block waves-light">
              <img class="activator" src="images/SafetyClass.png">
            </div>
            <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">Safety Class<i class="material-icons right">more_vert</i></span>
            </div>
            <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">Safety Class<i class="material-icons right">close</i></span>
              <p>Merasa cemas karena baru pertama kali naik pesawat? Kini kamu tak perlu risau karena IFly menyediakan kelas safety dengan mentor psikologi dan ahli penerbangan yang kompeten. Jadi, kamu dapat menikmati penerbanganmu dengan tenang.</p>
            </div>
          </div>
        </div>
        <div class="col s12 l4">
          <div class="card">
            <div class="card-image waves-effect waves-block waves-light">
              <img class="activator" src="images/lansia.png">
            </div>
            <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">Layanan Khusus Lansia dan Balita<i class="material-icons right">more_vert</i></span>
            </div>
            <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">Layanan Khusus Lansia dan Balita<i class="material-icons right">close</i></span>
              <p>IFly menyediakan program pelayanan khusus bagi para lansia dan balita yang ingin berpergian dengan pesawat. Pelayanan berupa perlakuan dan fasilitas khusus tersebut meliputi penyediaan fasilitas kemudahan untuk naik ke dan turun dari pesawat udara. Sehingga, para lansia dan balita kami pastikan bisa menikmati perjalanan bersama kami dengan tenang.</p>
            </div>
          </div>
        </div>
      </div>
      <br>
      <!--About End-->
    
    </div>
    <!--Content End-->

<?php
include 'footer.php';
?>