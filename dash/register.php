<?php
include "inc/koneksi.php"; // Pastikan koneksi database sudah benar

// Proses registrasi
if (isset($_POST['daftar'])) {
    $nama = $_POST['nama'];
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Hash password untuk keamanan
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Query untuk memeriksa apakah username sudah ada
    $sql = $koneksi->query("SELECT * FROM tb_pengguna WHERE username='$username'");
    if ($sql->num_rows > 0) {
        echo "<script>alert('Username sudah digunakan!');</script>";
    } else {
        // Query untuk memasukkan data pengguna tanpa menyertakan id_pengguna
        $sql = $koneksi->query("INSERT INTO tb_pengguna (nama_pengguna, username, password, level) 
                                 VALUES ('$nama', '$username', '$hashed_password', 'Siswa')");
        if ($sql) {
            echo "<script>alert('Registrasi berhasil! Silakan login.'); window.location='login.php';</script>";
        } else {
            echo "<script>alert('Registrasi gagal. Silakan coba lagi.');</script>";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrasi</title>
    <style>
        /* CSS styling remains the same */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            font-size: 14px;
            font-weight: bold;
            color: #333;
            display: block;
        }

        input[type="text"], input[type="email"], input[type="password"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus {
            border-color: #4CAF50;
            outline: none;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .link {
            font-size: 14px;
            margin-top: 10px;
        }

        .link a {
            color: #4CAF50;
            text-decoration: none;
        }

        .link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Registrasi</h1>
        
        <!-- Form registrasi -->
        <form method="POST" action="">
            <div class="form-group">
                <label for="nama">Nama: </label>
                <input type="text" name="nama" required>
            </div>
            <div class="form-group">
                <label for="username">Username: </label>
                <input type="text" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password: </label>
                <input type="password" name="password" required>
            </div>
            <input type="submit" name="daftar" value="Daftar">
        </form>

        <!-- Link untuk kembali ke halaman login -->
        <div class="link">
            <p>Sudah punya akun? <a href="login.php">Login di sini</a></p>
        </div>
    </div>
</body>
</html>
