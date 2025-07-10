-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jul 2025 pada 02.38
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
-- Database: `upb`
--

DELIMITER $$
--
-- Fungsi
--
CREATE DEFINER=`root`@`localhost` FUNCTION `format_jadwal` (`hari` VARCHAR(20), `jam` INT) RETURNS VARCHAR(50) CHARSET utf8mb4 COLLATE utf8mb4_general_ci DETERMINISTIC BEGIN
  RETURN CONCAT(hari, ' jam ', jam);
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `status_kelulusan` (`nilai` INT) RETURNS VARCHAR(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci DETERMINISTIC BEGIN
  RETURN IF(nilai >= 75, 'Lulus', 'Tidak Lulus');
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `kd_ds` int(11) NOT NULL,
  `nama` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`kd_ds`, `nama`) VALUES
(1, 'Pak Sakura'),
(2, 'Bu Deli'),
(3, 'Pak Ageng'),
(4, 'Mak Cik'),
(5, 'Bu Barwazah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwalmengajar`
--

CREATE TABLE `jadwalmengajar` (
  `kd_ds` int(11) NOT NULL,
  `kd_mk` int(11) NOT NULL,
  `hari` varchar(20) DEFAULT NULL,
  `jam` int(11) DEFAULT NULL,
  `ruang` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jadwalmengajar`
--

INSERT INTO `jadwalmengajar` (`kd_ds`, `kd_mk`, `hari`, `jam`, `ruang`) VALUES
(1, 1, 'Senin', 7, '403'),
(2, 2, 'Selasa', 7, '402'),
(3, 3, 'Rabu', 7, '404'),
(4, 4, 'Kamis', 7, '403');

-- --------------------------------------------------------

--
-- Struktur dari tabel `krsmahasiswa`
--

CREATE TABLE `krsmahasiswa` (
  `nim` int(11) DEFAULT NULL,
  `kd_mk` int(11) DEFAULT NULL,
  `kd_ds` int(11) DEFAULT NULL,
  `semester` int(5) DEFAULT NULL,
  `nilai` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `krsmahasiswa`
--

INSERT INTO `krsmahasiswa` (`nim`, `kd_mk`, `kd_ds`, `semester`, `nilai`) VALUES
(11223345, 1, 1, 2, 90),
(11223348, 1, 1, 2, 88),
(11223346, 1, 1, 2, 82),
(11223347, 1, 1, 2, 75),
(11223349, 1, 1, 2, 98),
(11223344, 1, 1, 2, 80);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` int(11) NOT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `jenis_kelamin` varchar(20) DEFAULT NULL,
  `tgl_lahir` varchar(20) DEFAULT NULL,
  `jalan` varchar(20) DEFAULT NULL,
  `kota` varchar(20) DEFAULT NULL,
  `kodepos` varchar(20) DEFAULT NULL,
  `no_hp` int(15) DEFAULT NULL,
  `kd_ds` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jenis_kelamin`, `tgl_lahir`, `jalan`, `kota`, `kodepos`, `no_hp`, `kd_ds`) VALUES
(11223344, 'Ari Santoso', 'Laki-laki', '1979-08-31', 'Harun', 'Bekasi', '17790', 812341234, 2),
(11223345, 'Ario Talib', 'Laki-laki', '1999-11-16', 'Cibarusah', 'Cikarang', '17878', 834344343, 4),
(11223347, 'Lisa Ayu', 'Perempuan', '1996-01-02', 'Gangjeran', 'Bekasi', '17767', 899892234, 3),
(11223348, 'Tiara Wahiday', 'Perempuan', '1980-02-05', 'Agung', 'Bekasi', '17788', 867872121, 1),
(11223349, 'Anton Sinaga', 'Laki-laki', '1988-03-10', 'sembar', 'Cikarang', '17654', 856567676, 1),
(11223350, 'Faiq Zaidin', 'Laki-laki', '1995-08-22', 'sukamaju', 'Cikarang', '17899', 891283746, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kd_mk` int(11) NOT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `sks` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`kd_mk`, `nama`, `sks`) VALUES
(1, 'Basis Data', 1),
(2, 'Matematika', 2),
(3, 'Logika Informatika', 3),
(4, 'Bahasa Inggris', 4);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`kd_ds`);

--
-- Indeks untuk tabel `jadwalmengajar`
--
ALTER TABLE `jadwalmengajar`
  ADD KEY `jadwal_dosen` (`kd_ds`),
  ADD KEY `jadwal_matkul` (`kd_mk`);

--
-- Indeks untuk tabel `krsmahasiswa`
--
ALTER TABLE `krsmahasiswa`
  ADD KEY `krs_mahasiswa` (`nim`),
  ADD KEY `krs_dosen` (`kd_ds`),
  ADD KEY `krs_matkul` (`kd_mk`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `maha_dosen` (`kd_ds`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kd_mk`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `kd_ds` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  MODIFY `kd_mk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwalmengajar`
--
ALTER TABLE `jadwalmengajar`
  ADD CONSTRAINT `jadwal_matkul` FOREIGN KEY (`kd_mk`) REFERENCES `matakuliah` (`kd_mk`);

--
-- Ketidakleluasaan untuk tabel `krsmahasiswa`
--
ALTER TABLE `krsmahasiswa`
  ADD CONSTRAINT `krs_dosen` FOREIGN KEY (`kd_ds`) REFERENCES `dosen` (`kd_ds`),
  ADD CONSTRAINT `krs_matkul` FOREIGN KEY (`kd_mk`) REFERENCES `matakuliah` (`kd_mk`);

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `maha_dosen` FOREIGN KEY (`kd_ds`) REFERENCES `dosen` (`kd_ds`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
