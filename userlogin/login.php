<?php  
require_once("../include/connection.php");
session_start();

if (isset($_POST["logIn"])) {	
    date_default_timezone_set("Asia/Manila");
    $date = date("M-d-Y h:i A", strtotime("+0 HOURS"));

    $username = mysqli_real_escape_string($conn, $_POST["email_address"]);  
    $password = mysqli_real_escape_string($conn, $_POST["user_password"]);

    // Query to fetch the user record
    $query = mysqli_query($conn, "SELECT * FROM login_user WHERE email_address = '$username'") or die(mysqli_error($conn));
    $row = mysqli_fetch_array($query);

    $id = $row['id'];
    $user = $row['email_address'];

    $_SESSION["user_no"] = $row["id"];
    $_SESSION["email_address"] = $row["email_address"];

    $counter = mysqli_num_rows($query);

    // If no user found with the given email address
    if ($counter == 0) {	
        echo "<script type='text/javascript'>
                alert('Invalid Email Address or Password, Please try again!');
                document.location='../login.html';
              </script>";
    } else {
        // Check if the password matches
        if (password_verify($password, $row["user_password"])) {	
            $_SESSION['email_address'] = $id;	

            // Get client IP address
            if (!empty($_SERVER["HTTP_CLIENT_IP"])) {
                $ip = $_SERVER["HTTP_CLIENT_IP"];
            } elseif (!empty($_SERVER["HTTP_X_FORWARDED_FOR"])) {
                $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
            } else {
                $ip = $_SERVER["REMOTE_ADDR"];
            }

            $host = gethostbyaddr($_SERVER['REMOTE_ADDR']);

            // Log user activity in the history log
            
            $remarks = "Has Logged In the system at";  
            mysqli_query($conn, "INSERT INTO history_log(id, email_address, action, ip, host, login_time) 
                                VALUES('$id', '$user', '$remarks', '$ip', '$host', '$date')") 
                                or die(mysqli_error($conn));

            // Redirect to the home page
            echo "<script type='text/javascript'>document.location='../private_user/home.php'</script>";  
        }
    }
}
?>
