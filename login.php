<?php
session_start();
include "inc/koneksi.php"; // Pastikan koneksi ke database

if (isset($_POST['login'])) {
    $username = mysqli_real_escape_string($koneksi, $_POST['username']);
    $password = mysqli_real_escape_string($koneksi, $_POST['password']);

    // Query untuk memeriksa apakah pengguna ada dalam database
    $sql = "SELECT * FROM tb_pengguna WHERE username = '$username' AND password = '$password'";
    $result = $koneksi->query($sql);
    
    if (mysqli_num_rows($result) > 0) {
        // Pengguna ditemukan, ambil data pengguna
        $user = mysqli_fetch_assoc($result);
        
        // Menyimpan data pengguna ke dalam session
        $_SESSION['ses_username'] = $username;
        $_SESSION['ses_level'] = $user['level']; // Menyimpan level pengguna

        // Redirect berdasarkan level pengguna
        if ($user['level'] == 'Administrator') {
            header("Location: dashboard.php"); // Redirect ke dashboard admin
        } else if ($user['level'] == 'Petugas') {
            header("Location: dashboard.php"); // Redirect ke dashboard petugas
        } else if ($user['level'] == 'Siswa') {
            header("Location: dashboard.php"); // Redirect ke dashboard petugas
        } else {
            // Jika level tidak dikenali
            echo "<script>
                    Swal.fire({
                        icon: 'error',
                        title: 'Login failed',
                        text: 'User level not recognized',
                    });
                  </script>";
        }
        exit();
    } else {
        // Pengguna tidak ditemukan
        echo "<script>
                Swal.fire({
                    icon: 'error',
                    title: 'Login failed',
                    text: 'Invalid username or password',
                });
              </script>";
    }
}
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Login | SI Perpustakaan</title>
    <link rel="icon" href="dist/img/logo.jpg">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
</head>

<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <h3>
                <font color="green">
                    <b>Sistem Perpustakaan Online</b>
                </font>
            </h3>
        </div>
        <!-- /.login-logo -->
        <div class="login-box-body">
            <center>
                <img src="dist/img/log.png" width=160px />
            </center>
            <br>
            <p class="login-box-msg">Login System</p>
            <form action="#" method="post">
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" name="username" placeholder="Username" required>
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <!-- Tidak ada tombol di sini -->
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-4">
                        <button type="submit" class="btn btn-success btn-block btn-flat" name="login" title="Masuk Sistem">
                            <b>Masuk</b>
                        </button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>
            <p>Belum punya akun? <a href="register.php">Daftar di sini</a></p>
        </div>
        <!-- /.login-box-body -->
    </div>
    <!-- /.login-box -->

    <!-- jQuery 2.2.3 -->
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</body>

</html>
