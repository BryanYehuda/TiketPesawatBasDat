<?php
//     session_start();
//     include 'conn.php';

    
//     $sql = "SELECT * FROM users";

//     $rows = mysqli_query($conn, $sql);
//     $i = 0;
//     mysqli_close($conn);

// include 'header.php';
session_start();

include 'conn.php';
$view = "SELECT * FROM viewpemesanan";
$rows = mysqli_query($conn, $view);

include 'header.php';
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
      
      <style>
        * {
        box-sizing: border-box;
        }

        #myInput {
        background-image: url('/css/searchicon.png');
        background-position: 10px 10px;
        background-repeat: no-repeat;
        width: 100%;
        font-size: 16px;
        padding: 12px 20px 12px 40px;
        border: 1px solid #ddd;
        margin-bottom: 12px;
        }

        #myTable {
        border-collapse: collapse;
        width: 100%;
        border: 1px solid #ddd;
        font-size: 18px;
        }

        #myTable th, #myTable td {
        text-align: left;
        padding: 12px;
        }

        #myTable tr {
        border-bottom: 1px solid #ddd;
        }

        #myTable tr.header, #myTable tr:hover {
        background-color: #f1f1f1;
        }
        </style>
        </head>
        <body>

        <h2>Our Flight</h2>

        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Cari destinasi Anda.." title="Type in a name">
        <!-- 1. destinasi
        2. asal
        2. tanggal berangkat
        3. harga
        4. sisa kursi
        5 detail
        6. pesan -->
        <table id="myTable">
        <tr class="header">
            <th style="width:auto%;">Destinasi</th>
            <th style="width:auto%;">Asal</th>
            <th style="width:auto%;">Tanggal Berangkat</th>
            <th style="width:auto%;">Harga</th>
            <th style="width:auto%;">Sisa Kursi</th>
            <th style="width:auto%;">Detail</th>
            <th style="width:auto%;">Pesan</th>
        </tr>
        <?php foreach($rows as $row) : ?>
        <tr>
            <!-- <td>Jakarta</td>
            <td>Banyuwangi</td>
            <td>1-14-2021</td>
            <td>696</td>
            <td>30</td>
            <td><a href="fiture-kelas.php">Detail</a></td>
            <td>Pesan</td> -->
            <td><?= $row['nama_bandara']?></td>
            <td><?= $row['lokasi']?></td>
            <td><?= $row['waktu_berangkat']?></td>
            <td>
                <?= '$' . (rand(100,500). "<br>");?>
            </td>
            <td>
                <?= (rand(2,9). "<br>");?>
            </td>
            <td><a href="fiture-kelas.php">Detail</a></td>
            <td><a href="pemesanan.php">Pesan</a></td>
        </tr>
        <?php endforeach; ?>
        
        </table>

        <br>
        <br>
        <br>

        <script>
        function myFunction() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
            }       
        }
        }
        </script>
    
    </div>
    <!--Content End-->


<?php
include 'footer.php';
?>