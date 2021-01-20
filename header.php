<!DOCTYPE html>
<html lang="en">
  
  <head>
    <!-- Meta Start -->
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>IFly - Online Ticket Booking</title>
    <meta name="description" content="IFly - Where Everyone Can Fly to Their Dreams"/>
    <meta name="theme-color" content="#3D90E3"/>
    <link rel="apple-touch-icon" href="images/logo.png">
    <link rel="shortcut icon" href="images/logo.png">
    <!-- Meta End -->
        
    <!-- Link Start -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="css/materialize.css" type="text/css" rel="stylesheet"/>
    <link href="css/style.css" type="text/css" rel="stylesheet"/>
    <link rel="manifest" href="manifest.json">
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <!-- Link End -->
  </head>
  
  <body>
    <!-- Navbar Start -->
    <nav class="white" role="navigation">
    <?php if ($_SESSION) : ?>
        <div class="nav-wrapper container">
          <a id="logo-container" href="index.php" class="brand-logo"><img class="responsive-img" src="images/logo.png" width="60" height="auto"></a>
          <ul class="right hide-on-med-and-down">
            <li><a class="waves-effect" href="index.php">Home</a></li>
            <li><a class="waves-effect" href="about.php">About</a></li>
            <li><a class="waves-effect" href="contact.php">Contact</a></li>
            <!-- <li><a class="waves-effect" href="order.php">Order</a></li> -->
            <li>
                  <!-- Dropdown Trigger -->
                <a class='dropdown-trigger btn' href='#' data-target='dropdown1'><?php echo $_SESSION['email']?></a>

                <!-- Dropdown Structure -->
                <ul id='dropdown1' class='dropdown-content'>
                  <li><a href="order.php">Pesan</a></li>
                  <li><a href="caripesanan.php">Cari Pesanan</a></li>
                  <li><a href="suratkedatangan.php">Surat Kedatangan</a></li>
                  <li><a href="fiture-kelas.php">Fiture Kelas</a></li>              
                  <li class="divider" tabindex="-1"></li>
                  <li><a href="pemesanan.php">Pemesanan</a></li>
                  <li><a href="logout.php">Logout</a></li>
                  <!-- <li class="divider" tabindex="-1"></li>
                  <li><a href="#!">three</a></li>
                  <li><a href="#!"><i class="material-icons">view_module</i>four</a></li>
                  <li><a href="#!"><i class="material-icons">cloud</i>five</a></li> -->
                </ul>
            </li>
            <!-- <li><a class="waves-effect" href="#"><?php echo $_SESSION['email']?></a></li>
            <li><a class="waves-effect" href="logout.php">Logout</a></li> -->
          </ul>
          <ul id="nav-mobile" class="sidenav">
            <li><a class="waves-effect" href="index.php">Home</a></li>
            <li><a class="waves-effect" href="about.php">About</a></li>
            <li><a class="waves-effect" href="contact.php">Contact</a></li>
            <li><a class="waves-effect" href="order.php">Order</a></li>
            <li><a class="waves-effect" href="#"><?php echo $_SESSION['email']?></a></li>
            <li><a class="waves-effect" href="logout.php">Logout</a></li>
          </ul>
          <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
        </div>
    <?php else: ?>
        <div class="nav-wrapper container">
          <a id="logo-container" href="index.php" class="brand-logo"><img class="responsive-img" src="images/logo.png" width="60" height="auto"></a>
          <ul class="right hide-on-med-and-down">
            <li><a class="waves-effect" href="index.php">Home</a></li>
            <li><a class="waves-effect" href="about.php">About</a></li>
            <li><a class="waves-effect" href="contact.php">Contact</a></li>
            <li><a class="waves-effect" href="login.php">Login</a></li>
            <li><a class="waves-effect" href="register.php">Register</a></li>
            <!-- <li><a class="waves-effect" href="order.php">Order</a></li> -->
          </ul>
          <ul id="nav-mobile" class="sidenav">
            <li><a class="waves-effect" href="index.php">Home</a></li>
            <li><a class="waves-effect" href="about.php">About</a></li>
            <li><a class="waves-effect" href="contact.php">Contact</a></li>
            <li><a class="waves-effect" href="login.php">Login</a></li>
            <li><a class="waves-effect" href="register.php">Register</a></li>
            <!-- <li><a class="waves-effect" href="order.php">Order</a></li> -->
          </ul>
          <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
        </div>
    <?php endif; ?>
      </nav>
    <!-- Navbar End -->