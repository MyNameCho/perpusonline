<?php
// Menghubungkan ke database
$host = 'localhost'; // Ganti dengan host Anda
$username = 'root';  // Ganti dengan username database Anda
$password = '';      // Ganti dengan password database Anda
$database = 'data_perpus'; // Ganti dengan nama database Anda

// Membuat koneksi
$koneksi = new mysqli($host, $username, $password, $database);

// Mengecek apakah koneksi berhasil
if ($koneksi->connect_error) {
    die("Koneksi gagal: " . $koneksi->connect_error);
}
?>
