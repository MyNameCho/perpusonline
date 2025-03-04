-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Mar 2025 pada 05.51
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_perpus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_pinjam`
--

CREATE TABLE `log_pinjam` (
  `id_log` int(11) NOT NULL,
  `id_buku` varchar(10) NOT NULL,
  `id_anggota` varchar(10) NOT NULL,
  `tgl_pinjam` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `log_pinjam`
--

INSERT INTO `log_pinjam` (`id_log`, `id_buku`, `id_anggota`, `tgl_pinjam`) VALUES
(1, 'B001', 'A001', '2025-02-25'),
(2, 'B002', 'A002', '2025-02-25'),
(3, 'B003', 'A003', '2025-02-02'),
(4, 'B004', 'A004', '2025-02-12'),
(5, 'B002', 'A001', '2025-02-25'),
(6, 'B003', 'A002', '2025-02-25'),
(7, 'B003', 'A001', '2025-02-25'),
(8, 'B004', 'A002', '2025-02-20'),
(9, 'B006', 'A001', '0000-00-00'),
(10, 'B005', 'A003', '2025-02-26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_anggota`
--

CREATE TABLE `tb_anggota` (
  `id_anggota` varchar(10) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `jekel` enum('Laki-Laki','Perempuan') NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `alamat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_anggota`
--

INSERT INTO `tb_anggota` (`id_anggota`, `nama`, `jekel`, `kelas`, `alamat`) VALUES
('A001', 'Hida', 'Perempuan', 'TI', 'ambal'),
('A002', 'Nurul', 'Perempuan', 'TS', 'klirong'),
('A003', 'Dayat', 'Laki-Laki', 'TI', 'ambal'),
('A004', 'Yati', 'Perempuan', 'PAUD', 'kebumen');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_buku`
--

CREATE TABLE `tb_buku` (
  `id_buku` varchar(10) NOT NULL,
  `judul_buku` varchar(30) NOT NULL,
  `pengarang` varchar(30) NOT NULL,
  `penerbit` varchar(30) NOT NULL,
  `th_terbit` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_buku`
--

INSERT INTO `tb_buku` (`id_buku`, `judul_buku`, `pengarang`, `penerbit`, `th_terbit`) VALUES
('B005', 'Kalimataya', 'Ardian Kresna', 'Lontar Mediatama', '2023'),
('B006', 'Cut Nyak Meutia', 'Ananda Mona', 'Edulitera', '2024'),
('B007', 'RA. Kartika', 'Imron Rosyadi', 'Garasi', '2021'),
('B008', 'Pertanyaan-pertanyaan Masa Dep', 'Yuhesti Mora, dkk', 'CV. Media Cendekia Muslim', '2023'),
('B009', 'Rajah Tangan', 'Ardian Kresna', 'Lontar Mediatama', '2021'),
('B010', 'Mati Ketawa Cara Profesor', 'Arief Anshory Yusuf', 'CV. Media Cendekia Muslim', '2023'),
('B011', 'Anakku Dipotret Malaikat', 'Adnan Katino', 'Hikam Pustaka', '2023'),
('B012', 'Jenama dan Jemawa', 'Anton Suparyanta', 'Biprint', '2023'),
('B013', 'Lintang Lantip Harga Seorang I', 'Adnan Katino', 'Hikam Pustaka', '2023'),
('B014', 'Kronik Prahara', 'Septi Wahyuni', 'CV. Media Cendekia Muslim', '2023'),
('B015', 'Negeri Di Ujung Batas', 'Yusuf Ali Putro', 'Indocamp', '2022'),
('B016', 'Menggapai Matahari ', 'Adnan Katino', 'Hikam Pustaka', '2023'),
('B017', 'Menguak Misteri Gunung Padang', 'Anton Charliyan', 'Hikam Pustaka', '2023'),
('B018', 'Sulu-suluh Revolusi', 'Ridjaluddin Shar', 'Beranda', '2022'),
('B019', 'Perjalanan 989 Hari Penuh Cint', 'Jaharudin', 'Hikam Pustaka', '2022'),
('B020', 'Menggugah Emosi Pembaca', 'Muhammad Ikhsan Mujtaba', 'Kaizen Sarana Edukasi', '2020'),
('B021', 'Jurus jitu Mahir Mendongeng', 'Kak Jun', 'Hikam Pustaka', '2023'),
('B022', 'Publik Speaking', 'Prof. Dr. Wahyudi Siswanto, M.', 'Selaksa Media', '2021'),
('B023', 'I Am Mediocre', 'Kinara Adisabita', 'BUKU BIJAK', '2023'),
('B024', 'Patriot', 'N. Suparyani dan Nardiyanto', 'Hikam Pustaka', '2023'),
('B025', 'Kertas Putih, Bunga Teratai da', 'Amri_Shan', 'Indocamp', '2023');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` int(15) NOT NULL,
  `nama_pengguna` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(35) NOT NULL,
  `level` enum('Administrator','Petugas','Siswa') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `level`) VALUES
(1, 'Admin', 'admin', '123', 'Administrator'),
(2, 'Petugas', 'petugas', '123', 'Petugas'),
(3, 'Siswa', 'siswa', '123', 'Siswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_sirkulasi`
--

CREATE TABLE `tb_sirkulasi` (
  `id_sk` varchar(20) NOT NULL,
  `id_buku` varchar(10) NOT NULL,
  `id_anggota` varchar(10) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `status` enum('PIN','KEM') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_sirkulasi`
--

INSERT INTO `tb_sirkulasi` (`id_sk`, `id_buku`, `id_anggota`, `tgl_pinjam`, `tgl_kembali`, `status`) VALUES
('S001', 'B006', 'A001', '0000-00-00', '1970-01-08', 'KEM'),
('S002', 'B005', 'A003', '2025-02-26', '2025-03-05', 'PIN');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `log_pinjam`
--
ALTER TABLE `log_pinjam`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_anggota` (`id_anggota`);

--
-- Indeks untuk tabel `tb_anggota`
--
ALTER TABLE `tb_anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indeks untuk tabel `tb_sirkulasi`
--
ALTER TABLE `tb_sirkulasi`
  ADD PRIMARY KEY (`id_sk`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_anggota` (`id_anggota`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `log_pinjam`
--
ALTER TABLE `log_pinjam`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id_pengguna` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
