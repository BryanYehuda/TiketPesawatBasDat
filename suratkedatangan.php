<?php
    session_start();

    $id = $_SESSION['id'];

    if(!($_SESSION)){
        header('location: index.php?redirectProfile='.$id);
    }

    include 'conn.php';

    if(isset($_POST['submit'])){
        //    var_dump($_FILES['gambar']);

            $idd = $_SESSION['id'];

            $no_paspor = $_POST['no_paspor'];
            $alamat_di_indo = $_POST['alamat_di_indo'];

            $hewan_tumbuhan = $_POST['hewan_tumbuhan'];
            $narkoba_sajam = $_POST['narkoba_sajam'];
            $uang_1000 = $_POST['uang_1000'];
            $rokok_25batang = $_POST['rokok_25batang'];
            $barang_dagangan = $_POST['barang_dagangan'];
            $miras = $_POST['miras'];
            // $pekerjaan = $_POST['pekerjaan'];
            // $suket_covid = $_POST['suket_covid'];
            // mysqli_error($suket_covid);

            function myAlert($pesan) {
                echo "<script type='text/javascript'>alert('$pesan');</script>";
            }
    
            // $sql = " UPDATE status_kedatangan SET 
            // `no_paspor` = '$no_paspor' ,
            // `alamat_di_indo` = '$alamat_di_indo' ,
            // `hewan_tumbuhan` = '$hewan_tumbuhan' ,
            // `narkoba_sajam` = '$narkoba_sajam' ,
            // `uang_1000` = '$uang_1000' ,
            // `rokok_25batang` = '$rokok_25batang' ,
            // `barang_dagangan` = '$barang_dagangan' ,
            // `miras` = '$miras'

            // WHERE `id_status_kedatangan` = $idd ";

            $sql = "CALL `get_status_kedatangan` (
                '$no_paspor' ,
                '$alamat_di_indo' ,
                '$hewan_tumbuhan' ,
                '$narkoba_sajam' ,
                '$uang_1000' ,
                '$rokok_25batang' ,
                '$barang_dagangan' ,
                '$miras' ,
                '$idd')";

            // $sql = "INSERT INTO users (`email`, `username`, `password`,`bio`)";
            if(mysqli_query($conn,$sql)){
                //echo "File Upload Success";
                myAlert("Sukses mengisi surat kedatangan!");
                //header('location: profile.php');
            }else{
                // echo"File Upload Error";
                myAlert("Terjadi kesalahan pada pengisian!");
            }
    
        }

    // var_dump($_GET['id']);
    
    // $id = $_SESSION['id'];
    // $sql = "SELECT * FROM users WHERE `id`= $id";
    $sql = "SELECT * FROM status_kedatangan WHERE `id_status_kedatangan`= $id";

    // $result = mysqli_query($conn,$sql);
    // $row = mysqli_fetch_assoc($result);

    $result = mysqli_query($conn,$sql);
    $row = $result->fetch_assoc();
    // var_dump($row);
    
    mysqli_close($conn);
    
    include 'header.php';
?>
        <style>
            span {
            color: white;
            }
        </style>

        <!--Form Starts-->
        <div class="row">
        <div class="col s8 offset-s2">
            <div class="card blue lighten-2">
            <div class="card-content white-text">
                <span class="card-title center-align">Konfirmasi barang bawaan :</span>
                <br>
                <div class="row">
                <form class="col s12" action="suratkedatangan.php" method="POST">
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="nama_penumpang" name="nama_penumpang" type="text" class="validate"  required>
                            <label for="nama_penumpang">Nama Penumpang</label>
                        </div>
                        <div class="input-field col s12">
                            <input id="no_paspor" name="no_paspor" type="text" class="validate" required>
                            <label for="no_paspor">No Passport</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="alamat_di_indo" name="alamat_di_indo" type="text" class="validate" required>
                            <label for="alamat_di_indo">Alamat di Indonesia</label>
                        </div>
                        <!-- <div class="input-field col s12">
                            <input id="id_bandara_asal" type="text" class="validate">
                            <label for="id_bandara_asal">Bandara Asal</label>
                        </div>
                        <div class="input-field col s12">
                            <input id="id_bandara_tujuan" type="text" class="validate">
                            <label for="id_bandara_tujuan">Bandara Tujuan</label>
                        </div> -->

                    </div>
                </div>
            </div>
            </div>

            <div class="card blue lighten-2">
                <div class="card-content white-text">
                    <span class="card-title center-align">Silahkan konfirmasi barang bawaan anda :</span>
                    <div class="row">
                    <div class="input-field col s12"></div>
                        <p>
                        <label>
                            <input type="hidden" name="hewan_tumbuhan" value="0" />
                            <input type="checkbox" class="filled-in"  name="hewan_tumbuhan" checked="checked" value="1"/>
                            <span>Membawa hewan/tumbuhan</span>
                        </label>
                        </p>
                        <p>
                        <label>
                            <input type="hidden" name="narkoba_sajam" value="0" />
                            <input type="checkbox" class="filled-in"  name="narkoba_sajam" checked="checked" value="1"/>
                            <span>Membawa narkoba dan atau senjata tajam</span>
                        </label>
                        </p>
                        <p>
                        <label>
                            <input type="hidden" name="uang_1000" value="0" />
                            <input type="checkbox" class="filled-in"  name="uang_1000" checked="checked" value="1"/>
                            <span>Membawa uang lebih dari $1000</span>
                        </label>
                        </p>
                        <p>
                        <label>
                            <input type="hidden" name="rokok_25batang" value="0" />
                            <input type="checkbox" class="filled-in"  name="rokok_25batang" checked="checked" value="1"/>
                            <span>Membawa rokok lebih dari 25 batang</span>
                        </label>
                        </p>
                        <p>
                        <label>
                            <input type="hidden" name="barang_dagangan" value="0" />
                            <input type="checkbox" class="filled-in"  name="barang_dagangan" checked="checked" value="1"/>
                            <span>Membawa barang dagangan</span>
                        </label>
                        </p>
                        <p>
                        <label>
                            <input type="hidden" name="miras" value="0" />
                            <input type="checkbox" class="filled-in"  name="miras" checked="checked" value="1"/>
                            <span>Membawa minuman keras</span>
                        </label>
                        </p>
                    </div>
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
    <br>
    <!--Form Ends-->

  </div>
  <!--Register End-->


<?php
include 'footer.php';
?>