<?php
  session_start();

  include 'conn.php';
  $view = "SELECT * FROM viewfiturekelas";
  $rows = mysqli_query($conn, $view);

  include 'header.php';
?>
    
    <!--Content Starts-->
    <div class="about">
    
      <!--Hero Banner Start-->
      <div id="index-banner" class="parallax-container">
        <div class="section no-pad-bot">
          <div class="container">
            <br><br>
            <h1 class="header center blue-text">Fitur Kelas</h1>
            <div class="row center">
              <h5 class="header col s12 black-text">Terdapat 3 kelas dari fitur yang tersedia</h5>
            </div>
            <br><br>

          </div>
        </div>
        <div width="100%" class="parallax"><img src="images/Parallax2.jpg" alt="Unsplashed background img 1"></div>
      </div>
      <br>
      <!--Hero Banner Ends-->
      
      <!-- <div class="section no-pad-bot" id="index-banner">
        <div class="container">
          <br><br>
          <h1 class="header center blue-text">Fitur Kelas</h1>
          <div class="row center">
            <h5 class="header col s12 light">Terdapat 3 kelas dari fitur yang tersedia</h5>
          </div>
          <br><br>
        </div>
      </div> -->
      
      <!--About Start-->
      <div>

        <br>
        <div class="row">
          <div class="col s12 l4">
            <div class="card">
              <div class="card-image waves-effect waves-block waves-light">
                <img class="activator" src="https://github.com/BryanYehuda/TiketPesawatBasDat/blob/main/images/eksekutif.PNG?raw=true">
              </div>
              <div class="card-content">
                <span class="card-title activator grey-text text-darken-4">Kelas Eksekutif<i class="material-icons right">more_vert</i></span>
              </div>
              <div class="card-reveal">
                <span class="card-title grey-text text-darken-4">Kelas Eksekutif<i class="material-icons right">close</i></span>
                <p>Disini terdapat kursi dengan kelas Eksekutif</p>
              </div>
            </div>
          </div>
          <div class="col s12 l4">
            <div class="card">
              <div class="card-image waves-effect waves-block waves-light">
                <img class="activator" src="https://raw.githubusercontent.com/BryanYehuda/TiketPesawatBasDat/main/images/bisnisklas.PNG">
              </div>
              <div class="card-content">
                <span class="card-title activator grey-text text-darken-4">Kelas Bisnis<i class="material-icons right">more_vert</i></span>
              </div>
              <div class="card-reveal">
                <span class="card-title grey-text text-darken-4">Kelas Bisnis<i class="material-icons right">close</i></span>
                <p>Disini terdapat kursi dengan kelas Bisnis</p>
              </div>
            </div>
          </div>
          <div class="col s12 l4">
            <div class="card">
              <div class="card-image waves-effect waves-block waves-light">
                <img class="activator" src="https://raw.githubusercontent.com/BryanYehuda/TiketPesawatBasDat/main/images/ekonomi.PNG">
              </div>
              <div class="card-content">
                <span class="card-title activator grey-text text-darken-4">Kelas Ekonomi<i class="material-icons right">more_vert</i></span>
              </div>
              <div class="card-reveal">
                <span class="card-title grey-text text-darken-4">Kelas Ekonomi<i class="material-icons right">close</i></span>
                <p>Disini terdapat kursi dengan kelas Ekonomi</p>
              </div>
            </div>
          </div>
        </div>

        <div style="margin-left: 80px;margin-top: 20px;margin-right: 80px;margin-bottom: 80px;">
          <a style="font-size: 25px;">Berikut merupakan detail kelengkapan fitur</a>
          <table style="margin-top: 30px;">
            <tr style="background-color: #b8dafd;">
              <th>Kelas</th>
              <th>Kursi</th>
              <th>Ukuran TV</th>
              <th>Kualitas TV</th>
              <th>Snack</th>
              <th>Makanan</th>
              <th>Free Flow</th>
              <th>Tempat Tidur</th>
              <th>Penjemputan Bagasi</th>
              <th>Priority Check In</th>
              <!-- <th>Harga</th> -->
            </tr>
            <?php foreach($rows as $row) : ?>
            <tr>
              <th style="background-color: #e1f0ff;">
                <?php 
                  if($row['id_fitur']==3){
                    echo 'Eksekutif';
                  }
                  elseif($row['id_fitur']==2){
                    echo 'Bisnis';
                  }
                  else{
                    echo 'Ekonomi';
                  }
                ?>
              </th>
              <th> <?= $row['kursi'] ?> </th>
              <th> <?= $row['ukuran_tv'] ?> </th>
              <th> <?= $row['kualitas_tv'] ?> </th>
              <th> <?= $row['snack'] ?> </th>
              <th> <?= $row['makanan'] ?> </th>
              <th> <?= $row['free_flow'] ?> </th>
              <th> <?= $row['tempat_tidur'] ?> </th>
              <th> <?= $row['penjemputan_bagasi'] ?> </th>
              <th> <?= $row['priority_checkin'] ?> </th>
              <!-- <th> $ <?= $row['harga'] ?> </th> -->
            </tr>
            <?php endforeach; ?>
          </table> 
        </div>

      </div>
      
      <br>
      <!--About End-->
    
    </div>
    <!--Content End-->
       
<?php
include 'footer.php';
?>