<?php
    session_start();

    $id = $_SESSION['id'];

    if(!($_SESSION)){
        header('location: index.php?redirectProfile='.$id);
    }

    include 'conn.php';

    if(isset($_POST['submit'])){
        //    var_dump($_FILES['gambar']);
        // nama
        // tgl_lahir
        // jenis_kelamin
        // umur
        // kewarganegaraan
        // nomor_ktp
        // no_hp
        // alamat
        // pekerjaan
        // suket_covid
            $idd = $_SESSION['id'];

            $nama = $_POST['nama'];
            $tgl_lahir = $_POST['tgl_lahir'];
            $jenis_kelamin = $_POST['jenis_kelamin'];
            $umur = $_POST['umur'];
            $kewarganegaraan = $_POST['kewarganegaraan'];
            $nomor_ktp = $_POST['nomor_ktp'];
            $no_hp = $_POST['no_hp'];
            $alamat = $_POST['alamat'];
            $pekerjaan = $_POST['pekerjaan'];
            // $suket_covid = $_POST['suket_covid'];
            // mysqli_error($suket_covid);


            $target_dir = "uploads/";
            $image = $_FILES["suket_covid"]["name"];
            $target_file = $target_dir.basename($image);
            $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
    
            $allowedTypes = array('jpg','png','jpeg','gif');

            function myAlert($pesan) {
                echo "<script type='text/javascript'>alert('$pesan');</script>";
            }

            if(in_array($imageFileType,$allowedTypes)){
                if(move_uploaded_file($_FILES["suket_covid"]["tmp_name"],$target_file)){
    
                    $sql = " UPDATE pelanggan SET 
                    `nama` = '$nama' ,
                    `tgl_lahir` = '$tgl_lahir' ,
                    `jenis_kelamin` = '$jenis_kelamin' ,
                    `umur` = '$umur' ,
                    `kewarganegaraan` = '$kewarganegaraan' ,
                    `nomor_ktp` = '$nomor_ktp' ,
                    `no_hp` = '$no_hp' ,
                    `alamat` = '$alamat' ,
                    `pekerjaan` = '$pekerjaan' ,
                    `suket_covid` = '$image'

                    WHERE `id_pelanggan` = $idd ";
                    // $sql = "INSERT INTO users (`email`, `username`, `password`,`bio`)";
                    if(mysqli_query($conn,$sql)){
                        //echo "File Upload Success";
                        myAlert("Update Profile Success");
                        //header('location: profile.php');
                    }else{
                        // echo"File Upload Error";
                        myAlert("Update Profile Error");
                    }
                }else{
                    // echo "Sorry, there was an error uploading your file.";
                    myAlert("Sorry, there was an error uploading your file.");
                }
            }else{
                // echo 'Sorry, only JPG, JPEG, PNG, GIF, & PDF files are allowed to upload.';
                myAlert("Sorry, only JPG, JPEG, PNG, GIF, & PDF files are allowed to upload.");
            }
            // header('location: register.php');
    
        }

    // var_dump($_GET['id']);
    
    // $id = $_SESSION['id'];
    // $sql = "SELECT * FROM users WHERE `id`= $id";
    $sql = "SELECT * FROM pelanggan WHERE `id_pelanggan`= $id";

    // $result = mysqli_query($conn,$sql);
    // $row = mysqli_fetch_assoc($result);

    $result = mysqli_query($conn,$sql);
    $row = $result->fetch_assoc();
    // var_dump($row);
    
    mysqli_close($conn);
    
    include 'header.php';
?>

    <!--Register Starts-->
    <div class="register">
      
      <!--Hero Banner Starts-->
      <div id="index-banner" class="parallax-container">
        <div class="section no-pad-bot">
          <div class="container">
            <br><br>
            <h1 class="header center blue-text">IFly Update Profile</h1>
            <div class="row center">
              <h5 class="header col s12 white-text">Silahkan Update Data diri Anda disini!</h5>
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
            <!-- nama
            tgl_lahir
            jenis_kelamin
            umur
            kewarganegaraan
            email
            nomor_ktp
            no_hp
            alamat
            pekerjaan
            suket_covid -->
              <div class="row">
                <form class="col s12" name="form1" form action="order.php" method="POST" enctype="multipart/form-data" onsubmit="required()">
                  <div class="row">
                    <div class="input-field col s12">
                      <input id="nama" name="nama" type="text" value="<?= $row['nama']?>" class="validate" required>
                      <label for="nama">Nama</label>
                    </div>
                    <div class="input-field col s12">
                      <input id="tgl_lahir" name="tgl_lahir" type="date" value="<?= $row['tgl_lahir']?>" class="validate" required>
                      <label for="tgl_lahir">Tanggal Lahir</label>
                    </div>
                  </div>
                  <div class="row">
                    <!-- <div class="input-field col s12">            
                        <input type="radio" id="male" name="gender" value="male">
                        <label for="male">Male</label><br>
                        <input type="radio" id="female" name="gender" value="female">
                        <label for="female">Female</label><br>
                    </div> -->
                    <div class="input-field col s12">
                      <input id="jenis_kelamin" name="jenis_kelamin" type="text"  value="<?= $row['jenis_kelamin']?>" class="validate" required>
                      <label for="jenis_kelamin">Jenis Kelamin</label>
                    </div>
                    <div class="input-field col s12">
                      <input id="umur" name="umur" type="text" value="<?= $row['umur']?>" class="validate" required>
                      <label for="umur">Umur</label>
                    </div>
                  </div>
                  <div class="row">
                    <div class="input-field col s12">
                      <input id="kewarganegaraan" name="kewarganegaraan" type="text" value="<?= $row['kewarganegaraan']?>" class="validate" required>
                      <label for="kewarganegaraan">Kewarganegaraan</label>
                    </div>
                    <div class="input-field col s12">
                      <input id="nomor_ktp" name="nomor_ktp" type="text" value="<?= $row['nomor_ktp']?>" class="validate" required>
                      <label for="nomor_ktp">Nomor KTP</label>
                    </div>
                  </div>
                  <div class="row">
                    <div class="input-field col s12">
                      <input id="no_hp" name="no_hp" type="text" value="<?= $row['no_hp']?>"class="validate" required>
                      <label for="no_hp">No HP</label>
                    </div>
                    <div class="input-field col s12">
                      <input id="alamat" name="alamat" type="text" value="<?= $row['alamat']?>" class="validate" required>
                      <label for="alamat">Alamat</label>
                    </div>
                  </div>
                  <div class="row">
                    <div class="input-field col s12">
                      <input id="pekerjaan" name="pekerjaan" type="text" value="<?= $row['pekerjaan']?>" class="validate" required>
                      <label for="pekerjaan">Pekerjaan</label>
                    </div>
                  </div>
                  <div class="row">
                    <div class="input-field col s12">
                      <!-- <input type="file" class="form-control-file" name="image"> -->
                      <label for="suket_covid">Surat Covid</label>
                      <br>
                      <br>
                      <input id="suket_covid" name="suket_covid" type="file" class="validate" required>
                    </div>
                  </div>
                  <br>
                  <div class="row">
                    <span class="card-title left-align">Penandaan Khusus:</span>
                    <p>
                      <label>
                        <input id="balita" name="penanda" type="radio" checked value="1"/>
                        <span class="white-text">Balita</span>
                      </label>
                    </p>
                    <p>
                      <label>
                        <input id="reguler" name="penanda" type="radio" value="2"/>
                        <span class="white-text">Reguler</span>
                      </label>
                    </p>
                    <p>
                      <label>
                        <input id="lansia" name="penanda" type="radio"  value="3"/>
                        <span class="white-text">Lansia</span>
                      </label>
                    </p>
                  </div>
                  <div class="row">
                    <span class="card-title left-align">Apakah Anda berminat mengikuti kelas Safety?:</span>
                    <p>
                      <label>
                        <input id="iya" name="kelas_safety" type="radio" checked value="1"/>
                        <span class="white-text">Iya</span>
                      </label>
                    </p>
                    <p>
                      <label>
                        <input id="tidak" name="kelas_safety" type="radio" value="0"/>
                        <span class="white-text">Tidak</span>
                      </label>
                    </p>
                  </div>
                  <br>
                  <br>
                  <div class="row">
                    <div class="center-align">
                      <button class="btn blue waves-effect waves-light center-align" type="submit" name="submit" id="submit">Submit
                        <i class="material-icons right">send</i>
                      </button>
                    </div>
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