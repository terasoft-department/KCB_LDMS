<!DOCTYPE html>
<html lang="en">
<?php
session_start();
if (!isset($_SESSION["email_address"])) {
    header("location:../login.html");
}
?>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>KCB-LDMS</title>
  <link rel="icon" href="js/img/images.jpg" type="image/jpg" sizes="64x64">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- DataTables CSS -->
  <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
  <!-- DataTables Buttons CSS -->
  <link href="https://cdn.datatables.net/buttons/1.6.5/css/buttons.dataTables.min.css" rel="stylesheet">
</head>

<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="home.php">
      <img src="js/img/kcb.png" width="33px" height="33px"> 
      <span style="color: #F0B56F;">L</span>egal 
      <span style="color: #F0B56F;">D</span>ocument 
      <span style="color: #F0B56F;">M</span>anagement 
      <span style="color: #F0B56F;">S</span>ystem
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="#">Welcome, <?php echo ucwords(htmlentities($_SESSION['email_address'])); ?> <i class="fas fa-user-circle"></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="home.php"><i class="fas fa-home"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="history_log.php"><i class="fas fa-chalkboard-teacher"></i> User Log</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Logout.php"><i class="fas fa-sign-in-alt"></i> LogOut</a>
        </li>
      </ul>
    </div>
  </nav>
  <br><br><br>

  <!-- Filter Form -->
  <div class="container">
    <h3>Filter Logs</h3>
    <form method="GET" action="history_log.php">
      <div class="form-row">
        <!-- <div class="col">
          <input type="text" class="form-control" name="email" placeholder="Email Address" value="<?php echo isset($_GET['email']) ? $_GET['email'] : ''; ?>">
        </div>
        <div class="col">
          <input type="text" class="form-control" name="action" placeholder="Action" value="<?php echo isset($_GET['action']) ? $_GET['action'] : ''; ?>">
        </div> -->
        <div class="col">
          <input type="date" class="form-control" name="from_date" value="<?php echo isset($_GET['from_date']) ? $_GET['from_date'] : ''; ?>">
        </div>
        <div class="col">
          <input type="date" class="form-control" name="to_date" value="<?php echo isset($_GET['to_date']) ? $_GET['to_date'] : ''; ?>">
        </div>
        <div class="col">
          <button type="submit" class="btn btn-primary">Filter</button>
        </div>
      </div>
    </form>
    <br>
  </div>

  <!-- DataTable -->
  <div class="container">
    <h2 style="text-align: center;">TRACK LOGGED GENERAL REPORTS</h2>
    <br>
    <table id="dtable" class="table table-striped">
      <thead>
        <tr>
          <th>USER LOGGED</th>    
          <th>YOUR IP</th>
          <th>HOST</th>
          <th>ACTION</th> 
          <th>TIMEIN</th>
          <th>ACTION</th> 
          <th>TIMEOUT</th>
          <th>USER TIMEOUT</th>
        </tr>
      </thead>
      <tbody>
        <?php
          require_once("include/connection.php");

          // Fetch filter values from GET request
          $email_filter = isset($_GET['email']) ? $_GET['email'] : '';
          $action_filter = isset($_GET['action']) ? $_GET['action'] : '';
          $from_date_filter = isset($_GET['from_date']) ? $_GET['from_date'] : '';
          $to_date_filter = isset($_GET['to_date']) ? $_GET['to_date'] : '';

          // Construct the query based on filters
          $query = "SELECT * FROM history_log WHERE 1";

          if ($email_filter) {
            $query .= " AND email_address LIKE '%$email_filter%'";
          }
          if ($action_filter) {
            $query .= " AND action LIKE '%$action_filter%'";
          }
          if ($from_date_filter) {
            $query .= " AND login_time >= '$from_date_filter'";
          }
          if ($to_date_filter) {
            $query .= " AND logout_time <= '$to_date_filter'";
          }

          $query .= " ORDER BY login_time DESC"; // Sort by login time

          // Execute query
          $result = mysqli_query($conn, $query) or die(mysqli_error($conn));
          while ($file = mysqli_fetch_array($result)) {
            echo "<tr>
              <td>{$file['email_address']}</td>
              <td>{$file['ip']}</td>
              <td>{$file['host']}</td>
              <td>{$file['action']}</td>
              <td>{$file['login_time']}</td>
              <td>{$file['actions']}</td>
              <td>{$file['logout_time']}</td>
               <td>{$file['email_address']}</td>
            </tr>";
          }
        ?>
      </tbody>
    </table>
  </div>

  <!-- JQuery and DataTables JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
  <!-- DataTables Buttons JS and dependencies -->
  <script src="https://cdn.datatables.net/buttons/1.6.5/js/dataTables.buttons.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
  <script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.html5.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.print.min.js"></script>

  <script type="text/javascript">
    $(document).ready(function() {
      $('#dtable').DataTable({
        "aLengthMenu": [[5, 10, 15, 25, 50, 100, -1], [5, 10, 15, 25, 50, 100, "All"]],
        "iDisplayLength": 10,
        dom: 'Bfrtip',
        buttons: [
          'copy', 'excel', 'pdf', 'print'
        ]
      });
    });
  </script>
</body>
</html>
