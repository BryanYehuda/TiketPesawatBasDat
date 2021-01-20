    <!-- Footer Start -->
    <footer class="page-footer">
      <div class="container">
        <div class="row">
          <div class="col l12 s12 center-align">
            <h5 class="white-text">IFly - Online Ticket Booking</h5>
            <p class="grey-text text-lighten-4">Where Everyone Can Fly to Their Dreams</p>
          </div>
        </div>
      </div>
      <div class="footer-copyright center-align">
        <div class="container">
            © 2020-2021 Team 1 Semangat!!!<br>
        </div>
      </div>
    </footer>
    <!-- Footer End -->

    <!--Scripts Starts-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        var elems = document.querySelectorAll('.dropdown-trigger');
        var instances = M.Dropdown.init(elems, options);
      });

      // Or with jQuery

      $('.dropdown-trigger').dropdown();
    </script>
    <!--Scripts Ends-->
    
  </body>
</html>