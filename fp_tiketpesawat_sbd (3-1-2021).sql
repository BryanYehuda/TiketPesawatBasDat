-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 12 Jan 2021 pada 08.16
-- Versi server: 10.4.10-MariaDB
-- Versi PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fp_tiketpesawat_sbd`
--

DELIMITER $$
--
-- Prosedur
--
DROP PROCEDURE IF EXISTS `getCekKursi`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCekKursi` ()  NO SQL
select id_pesawat,
   SUM(CASE WHEN status_kursi=1 then 1 else 0 end) Dipesan,
   SUM(CASE WHEN status_kursi=0 then 1 else 0 end) Belum
from kursi_pesawat
group by id_pesawat$$

DROP PROCEDURE IF EXISTS `getFiturKelas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFiturKelas` ()  NO SQL
SELECT COUNT(id_tipe_kursi), id_tipe_kursi,
CASE
    WHEN id_tipe_kursi = 3 THEN 'Business Class'
    WHEN id_tipe_kursi = 2 THEN 'Ekskulisf'
    WHEN id_tipe_kursi = 1 THEN 'Ekonomi'
    ELSE 'Duduk di Bagasi'
END AS Keterangan,
CASE
    WHEN id_tipe_kursi = 3 THEN '795'
    WHEN id_tipe_kursi = 2 THEN '423'
    WHEN id_tipe_kursi = 1 THEN '333'
    ELSE 'Berubah sewaktu waktu'
END AS Harga
FROM kursi_pesawat GROUP BY id_tipe_kursi$$

DROP PROCEDURE IF EXISTS `getKelasSafety`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getKelasSafety` ()  NO SQL
SELECT nama,id_kelas_safety,
CASE
    WHEN id_kelas_safety = 1 THEN 'Memerlukan'
    WHEN id_kelas_safety = 0 THEN 'Tidak Memerlukan'
END AS KelasSafety
FROM pelanggan$$

DROP PROCEDURE IF EXISTS `getStatusDanLamaPenerbangan`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getStatusDanLamaPenerbangan` ()  NO SQL
SELECT id_penerbangan AS NomorPenerbangan,lama_penerbangan AS LamaPenerbangan,
CASE
	WHEN CURRENT_TIMESTAMP < waktu_berangkat THEN 'Belum Take Off'
    WHEN CURRENT_TIMESTAMP > waktu_tiba THEN 'Telah Mendarat'
    ELSE 'Sedang Terbang'
END AS StatusPenerbangan
FROM penerbangan
ORDER by id_penerbangan$$

DROP PROCEDURE IF EXISTS `getStatusPelanggan`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getStatusPelanggan` ()  NO SQL
SELECT nama,id_status_pelanggan,
CASE
    WHEN id_status_pelanggan = 1 THEN 'Balita'
    WHEN id_status_pelanggan = 2 THEN 'Reguler'
    ELSE 'Lansia'
END AS StatusPelanggan
FROM pelanggan$$

DROP PROCEDURE IF EXISTS `getSuket`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSuket` ()  NO SQL
SELECT id_pelanggan, nama, suket_covid,
CASE
    WHEN suket_covid IS NULL THEN 'Belum Upload'
    WHEN suket_covid IS NOT NULL THEN 'Sudah Upload'
END AS Keterangan
FROM pelanggan$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bandara`
--

DROP TABLE IF EXISTS `bandara`;
CREATE TABLE IF NOT EXISTS `bandara` (
  `id_bandara` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bandara` varchar(50) NOT NULL,
  `lokasi` varchar(20) NOT NULL,
  PRIMARY KEY (`id_bandara`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `bandara`
--

INSERT INTO `bandara` (`id_bandara`, `nama_bandara`, `lokasi`) VALUES
(1, 'Soekarno-Hatta', 'Tangerang'),
(2, 'Djoeanda', 'Sidoarjo'),
(3, 'Ngurah Rai', 'Denpasar'),
(4, 'Djauhar Airport', 'Solo'),
(5, 'Halim Perdana Kusuma', 'Jakarta'),
(36, 'Mutiara', 'Palu'),
(37, 'Wamena', 'Wamena'),
(38, 'Zainuddin Abdul ', 'Lombok'),
(39, 'Adisutjipto', 'Yogyakarta'),
(40, 'Yogya International ', 'Yogyakarta'),
(41, 'Adisumarmo', 'Solo'),
(42, 'Pattimura', 'Ambon'),
(43, 'Komodo', 'Labuan Bajo'),
(44, 'Sultan Babullah', 'Ternate'),
(45, 'Rendani', 'Manokwari'),
(46, 'H. Asan', 'Sampit'),
(47, 'Sultan Muhammad ', 'Bima'),
(48, 'Ahmad Yani', 'Semarang'),
(49, 'Eltari', 'Kupang'),
(50, 'Jalaluddin', 'Gorontalo'),
(61, 'Abdul Rachman Saleh', 'Malang'),
(60, 'Soewondo', 'Medan'),
(59, 'Minangkabau', 'Padang'),
(58, 'Sultan Mahmud Badaru', 'Palembang'),
(57, 'Supadio', 'Pontianak'),
(56, 'Domine Edward Osok', 'Sorong'),
(55, 'Mopah', 'Merauke'),
(54, 'Notohadinegoro', 'Jember'),
(53, 'Sentani', 'Jayapura'),
(52, 'Frans Kaisiepo', 'Biak'),
(51, 'Moses Kilangin', 'Timika'),
(62, 'Atang Senjaya', 'Bandung'),
(63, 'Cakrabhuwana', 'Cirebon'),
(64, 'Juanda', 'Surabaya'),
(65, 'Ferdinand Lumban Tob', 'Sibolga'),
(6, 'Tokyo', 'Jepang'),
(7, 'Hamad', 'Qatar'),
(8, 'Munchen', 'Jerman'),
(9, 'Kopenhagen', 'Denmark'),
(10, 'Schipol', 'Belanda'),
(11, 'Wina', 'Austria'),
(12, 'Brisbane', 'Australia'),
(13, 'Helsinki-Vantaa', 'Finlandia'),
(14, 'Hongqiao Shanghai', 'China'),
(15, 'Cape Town', 'Afrika Selatan'),
(16, 'Auckland', 'Selandia Baru'),
(17, 'George Bush', 'Amerika Serikat'),
(18, 'London City', 'Britania Raya'),
(19, 'Jorge Chavez', 'Peru'),
(20, 'Suvarnabhumi', 'Thailand'),
(21, 'Komodo', 'Labuan Bajo'),
(22, 'Sultan Babullah', 'Ternate'),
(23, 'Husein Sastranegara', 'Bandung'),
(24, 'Wiriadinata', 'Tasikmalaya'),
(25, 'Tunggul Wulung', 'Cilacap'),
(26, 'Halim Perdanakusuma', 'Jakarta'),
(27, 'Sultan Thaha', 'Kota Jambi'),
(28, 'Kualanamu', 'Medan'),
(29, 'Depati Amir', 'Pangkal Pinang'),
(30, 'Ranai', 'Ranai'),
(31, 'H.A.S. Hanandjoeddin', 'Tanjung Pandan'),
(32, 'Raja Haji Fisabilill', 'Tanjung Pinang'),
(33, 'Sultan Aji Muhammad ', 'Balikpapan'),
(34, 'Syamsuddin Noor', 'Banjarmasin'),
(35, 'Tjilik Riwut', 'Palangkaraya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fitur`
--

DROP TABLE IF EXISTS `fitur`;
CREATE TABLE IF NOT EXISTS `fitur` (
  `id_fitur` int(11) NOT NULL AUTO_INCREMENT,
  `kursi` varchar(100) NOT NULL,
  `ukuran_tv` varchar(100) NOT NULL,
  `kualitas_tv` varchar(100) NOT NULL,
  `snack` varchar(100) NOT NULL,
  `makanan` varchar(100) NOT NULL,
  `free_flow` varchar(100) NOT NULL,
  `tempat_tidur` varchar(100) NOT NULL,
  `penjemputan_bagasi` varchar(100) NOT NULL,
  `priority_checkin` varchar(100) NOT NULL,
  PRIMARY KEY (`id_fitur`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `fitur`
--

INSERT INTO `fitur` (`id_fitur`, `kursi`, `ukuran_tv`, `kualitas_tv`, `snack`, `makanan`, `free_flow`, `tempat_tidur`, `penjemputan_bagasi`, `priority_checkin`) VALUES
(1, 'Standar', '10 inci', '480p', 'Ada', 'Tidak ada', 'Tidak ada', 'Tidak ada', 'Tidak ada', 'Tidak ada'),
(2, 'Reclining', '20 inci', '720p', 'Ada', 'Ada', 'Ada', 'Tidak ada', 'Tidak ada', 'Tidak ada'),
(3, 'Sofa', '30 inci', '4K', 'Ada', 'Ada', 'Ada', 'Ada', 'Ada', 'Ada');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas_safety`
--

DROP TABLE IF EXISTS `kelas_safety`;
CREATE TABLE IF NOT EXISTS `kelas_safety` (
  `id_kelas_safety` int(11) NOT NULL AUTO_INCREMENT,
  `kelas_safety` varchar(30) NOT NULL,
  PRIMARY KEY (`id_kelas_safety`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kelas_safety`
--

INSERT INTO `kelas_safety` (`id_kelas_safety`, `kelas_safety`) VALUES
(1, 'Butuh'),
(0, 'Tidak Butuh');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kursi_pesawat`
--

DROP TABLE IF EXISTS `kursi_pesawat`;
CREATE TABLE IF NOT EXISTS `kursi_pesawat` (
  `id_kursi` int(11) NOT NULL AUTO_INCREMENT,
  `id_pesawat` int(11) NOT NULL,
  `id_tipe_kursi` int(11) NOT NULL,
  `status_kursi` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_kursi`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kursi_pesawat`
--

INSERT INTO `kursi_pesawat` (`id_kursi`, `id_pesawat`, `id_tipe_kursi`, `status_kursi`) VALUES
(1, 3, 1, 0),
(2, 2, 2, 1),
(3, 1, 3, 0),
(4, 5, 1, 0),
(5, 4, 1, 1),
(36, 3, 1, 1),
(37, 2, 2, 1),
(38, 1, 3, 1),
(39, 5, 2, 0),
(40, 4, 3, 0),
(41, 2, 2, 1),
(42, 3, 3, 1),
(43, 1, 2, 1),
(44, 5, 1, 0),
(45, 4, 1, 1),
(46, 3, 2, 0),
(47, 2, 3, 1),
(48, 1, 2, 0),
(49, 5, 3, 0),
(50, 4, 1, 1),
(51, 4, 1, 0),
(52, 4, 1, 1),
(53, 4, 1, 0),
(54, 4, 1, 0),
(55, 4, 1, 1),
(56, 4, 2, 1),
(57, 4, 2, 1),
(58, 4, 2, 0),
(59, 4, 2, 0),
(60, 4, 2, 1),
(61, 4, 3, 1),
(62, 4, 3, 1),
(63, 4, 3, 1),
(64, 4, 3, 1),
(65, 4, 3, 1),
(6, 1, 1, 1),
(7, 1, 1, 0),
(8, 1, 1, 1),
(9, 1, 1, 1),
(10, 1, 1, 0),
(11, 1, 2, 0),
(12, 1, 2, 1),
(13, 1, 2, 1),
(14, 1, 2, 0),
(15, 1, 2, 1),
(16, 1, 3, 0),
(17, 1, 3, 1),
(18, 1, 3, 0),
(19, 1, 3, 0),
(20, 1, 3, 1),
(21, 2, 1, 0),
(22, 2, 2, 1),
(23, 2, 3, 0),
(24, 2, 1, 0),
(25, 2, 2, 1),
(26, 2, 2, 1),
(27, 2, 3, 1),
(28, 2, 1, 0),
(29, 2, 1, 1),
(30, 2, 3, 0),
(31, 2, 2, 0),
(32, 2, 2, 1),
(33, 2, 3, 0),
(34, 2, 3, 1),
(35, 2, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `maskapai`
--

DROP TABLE IF EXISTS `maskapai`;
CREATE TABLE IF NOT EXISTS `maskapai` (
  `id_maskapai` int(11) NOT NULL AUTO_INCREMENT,
  `nama_maskapai` varchar(20) NOT NULL,
  PRIMARY KEY (`id_maskapai`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `maskapai`
--

INSERT INTO `maskapai` (`id_maskapai`, `nama_maskapai`) VALUES
(4, 'Citilink'),
(3, 'Lion'),
(2, 'Kacang Garuda'),
(1, 'Garuda'),
(5, 'Batik Air'),
(6, 'Sritanjung'),
(7, 'Biritish Airway'),
(8, 'Alaska Airlane'),
(9, 'Los Santos Airflight'),
(10, 'Air Asia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `id_status_pelanggan` varchar(10) NOT NULL,
  `id_kelas_safety` tinyint(4) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tgl_lahir` datetime NOT NULL,
  `jenis_kelamin` varchar(50) NOT NULL,
  `umur` tinyint(2) NOT NULL,
  `kewarganegaraan` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nomor_ktp` varchar(16) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `pekerjaan` varchar(25) NOT NULL,
  `suket_covid` varchar(50) NOT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `id_status_pelanggan`, `id_kelas_safety`, `nama`, `tgl_lahir`, `jenis_kelamin`, `umur`, `kewarganegaraan`, `email`, `nomor_ktp`, `no_hp`, `alamat`, `pekerjaan`, `suket_covid`) VALUES
(1, '2', 0, 'Shaladen', '1994-03-05 21:46:36', '', 26, 'IND', 'shaladen@example.org', '1348574485236', '1-721-097-524', 'Kediri', 'Peternak', 'surat1.png'),
(2, '2', 1, 'Beye', '1975-10-06 08:45:26', '', 45, 'GER', 'khoder@example.net', '7286329336966', '668-442-6169x', 'Surabaya', 'Makelar', 'surat2.pdf'),
(3, '3', 1, 'Pak Andri', '1959-12-12 22:51:29', '', 61, 'USA', 'AndriLoveJanda@example.org', '1703977286666', '01692518520', 'Tulungagung', 'Penggoda Wanita', 'surat3.jpg'),
(4, '2', 0, 'Prima', '1983-09-06 17:15:18', '', 37, 'INA', 'ngakakabiezzz@example.com', '0492958561946', '(368)474-9979', 'Banyuwangi', 'Internet Buzzer', 'surat4.pdf'),
(5, '1', 1, 'Shavica', '2016-07-20 01:50:27', '', 4, 'JPN', 'FPBagaiKuda@example.com', '7502068896180', '1-022-240-468', 'Riau', 'Joki Final Project', 'surat5.png'),
(36, '2', 0, 'Fischl', '1990-12-31 14:05:58', '', 30, 'GER', 'fischl@admin.com', '007201222970', '085233150035', 'Munchen', 'Intel', 'surat36.pdf'),
(37, '2', 0, 'Lumine', '1997-12-31 14:05:58', '', 23, 'INA', 'lumine@example.com', '007201222971', '085233150034', 'Surabaya', 'Traveller', 'surat37.pdf'),
(38, '2', 0, 'Tartaglia', '0000-00-00 00:00:00', '', 27, 'INA', 'childetar@example.com', '007201222972', '08123413038', 'Surabaya', 'Pengusaha', 'surat38.pdf'),
(39, '3', 0, 'Madame Ping', '1960-12-01 19:14:46', '', 60, 'CHN', 'pingping@example.com', '007201222973', '08233155435', 'Liyue', 'Penjual Teh', 'surat39.pdf'),
(40, '2', 0, 'Sara', '1999-11-08 19:14:46', '', 21, 'INA', 'sara@example.com', '088201222973', '08122445578', 'Sidoarjo', 'Waitress', 'surat41.pdf'),
(41, '2', 1, 'Diana', '2017-08-03 19:14:46', '', 3, 'INA', 'diana@example.com', '088721222973', '088731456789', 'Sidoarjo', '', 'surat41.pdf'),
(42, '3', 0, 'Thomas', '1970-12-13 19:14:46', '', 60, 'JPN', 'thomas@example.com', '008712222971', '0852237890', 'Tokyo', 'karyawan', 'surat42@example.com'),
(43, '2', 1, 'lisa', '1999-12-10 19:14:46', '', 21, 'INA', 'lisa@example.com', '078721222987', '082331567008', 'Kediri', 'mahasiswa', 'surat43.pdf'),
(44, '2', 0, 'Pedro', '2000-01-31 19:14:46', '', 20, 'INA', 'pedro@example.com', '012798099221', '082142944333', 'Semarang', 'karyawan', 'surat44.pdf'),
(45, '2', 0, 'windi', '1999-12-28 19:14:46', '', 21, 'INA', 'windi@gmai.com', '092198099802', '083312556780', 'Kediri', 'Karyawan', 'surat45.pdf'),
(46, '3', 1, 'Signora', '1970-12-31 19:14:46', '', 60, 'GER', 'signora@example.com', '072198099998', '085233140045', 'Muchen', '', 'surat46.pdf'),
(47, '1', 1, 'Klee', '2019-12-01 19:14:46', '', 1, 'INA', 'klee@example.com', '0621980999870', '08923315004', 'Surabaya', '', 'surat47.pdf'),
(48, '2', 1, 'Fany', '2001-12-09 19:14:46', '', 19, 'INA', 'fany@example.com', '051798099801', '085233150032', 'Mojokerto', 'Guru', 'surat48.pdf'),
(49, '2', 1, 'Rika', '1998-07-22 19:14:46', '', 22, 'INA', 'rika@example.com', '012798099801', '08521789088', 'Gresik', 'karyawan', 'surat49.pdf'),
(50, '2', 0, 'Hutao', '1998-01-22 19:14:46', '', 22, 'JPN', 'hutao@example.com', '7502068898870', '085211346780', 'Tokyo', 'Konsultan', 'surat50.pdf'),
(51, '1', 0, 'Samsul Guardian', '2018-03-05 21:46:36', '', 2, 'IND', 'samsul@example.org', '1348574485236', '089745820108', 'Timika', 'Pelajar', 'surat1.png'),
(52, '1', 1, 'Bambang Wizard', '2015-10-06 08:45:26', '', 5, 'GER', 'bambang@example.net', '7286329336966', '081975368229', 'Biak', 'Tunawisma', 'surat2.pdf'),
(53, '2', 1, 'Malik Healer', '1959-12-12 22:51:29', '', 61, 'USA', 'malik@example.org', '1703977286666', '087632195305', 'Jayapura', 'Pengusaha', 'surat3.jpg'),
(54, '2', 0, 'Budi Archer', '1983-09-06 17:15:18', '', 63, 'INA', 'budi@example.com', '0492958561946', '086321962583', 'Jember', 'TNI', 'surat4.pdf'),
(55, '2', 1, 'Rowan King', '1975-05-06 08:45:26', '', 45, 'GER', 'rowan@example.net', '4862872278367', '083123635982', 'Merauke', 'Polri', 'surat5.pdf'),
(56, '2', 0, 'Ramon Queen', '1976-06-06 08:45:26', '', 44, 'INA', 'ramon@example.net', '5432453836968', '080123696378', 'Sorong', 'Mahasiswa', 'surat6.pdf'),
(57, '2', 1, 'Jarwo Hunter', '1977-07-27 08:45:26', '', 43, 'INA', 'jarwo@example.net', '7286329354232', '089657896320', 'Pontianak', 'ASN', 'surat7.pdf'),
(58, '2', 0, 'Udin Knight', '1978-08-15 08:45:26', '', 42, 'INA', 'udin@example.net', '3760572687267', '087987023120', 'Palembang', 'Guru', 'surat8.pdf'),
(59, '2', 1, 'Bro Dragon', '1979-09-12 08:45:26', '', 41, 'INA', 'bro@example.net', '2782078670738', '085654932139', 'Surabaya', 'Mahasiswa', 'surat9.pdf'),
(60, '2', 1, 'Cemeng Cengeng', '1980-10-06 08:45:26', '', 40, 'INA', 'cemeng@example.net', '8267807862708', '085259875820', 'Medan', 'Karyawan', 'surat10.pdf'),
(61, '2', 1, 'Cempe kece', '1981-11-09 08:45:26', '', 39, 'INA', 'cempe@example.net', '3675436484560', '087896541238', 'Malang', 'Penjahat', 'surat11.pdf'),
(62, '3', 1, 'Bledhug Gludhug', '1960-10-06 08:45:26', '', 60, 'INA', 'bledhug@example.net', '3426348644868', '084975698236', 'Bandung', 'Penjahit', 'surat12.pdf'),
(63, '3', 0, 'Precil Nyicil', '1959-10-06 08:45:26', '', 61, 'INA', 'precil@example.net', '9435648634486', '088787414963', 'Cirebon', 'Koki', 'surat13.pdf'),
(64, '3', 0, 'Tobil Kobil', '1958-10-06 08:45:26', '', 62, 'INA', 'tobil@example.net', '1686167863738', '089636969369', 'Surabaya', 'Pensiunan', 'surat14.pdf'),
(65, '3', 1, 'Gudhel Gembel', '1957-07-20 01:50:27', '', 63, 'JPN', 'gudhel@example.com', '7502068896180', '087414744479', 'Sibolga', 'Pemilik Rumah Makan', 'surat15.png'),
(6, '1', 0, 'Boyati', '2018-01-05 21:46:36', '', 2, 'AUS', 'boyati@example.org', '1348574485269', '089745820169', 'Rawamangun', 'Pengangguran', 'suket6.png'),
(7, '1', 1, 'Jauhar Secondary', '2015-01-06 08:45:26', '', 5, 'GER', 'jauhar_secondary@example.net', '7286329336969', '081975368269', 'Selokan', 'Pengemis', 'suket7.pdf'),
(8, '1', 1, 'Prima Shaladen', '1959-01-12 22:51:29', '', 61, 'USA', 'prima_s@example.org', '1703977286666', '087632196969', 'Panti Jompo', 'Pengamen Jalanan', 'suket8.jpg'),
(9, '1', 0, 'Ramadhan Jauhar', '1983-01-06 17:15:18', '', 63, 'DEN', 'ramadhan_j@example.com', '0492958561969', '086321962569', 'Rogojampi', 'Bakul Lombok', 'suket9.pdf'),
(10, '1', 1, 'Wibi Jago', '1975-01-06 08:45:26', '', 45, 'GER', 'wibi_jago@example.net', '4862872278369', '083123635969', 'Sumberwadung', 'Bakul Sayur', 'suket10.pdf'),
(11, '2', 0, 'Yanto', '1976-01-06 08:45:26', '', 44, 'KOR', 'yanto@example.net', '5432453836969', '080123696369', 'Sempu', 'Tukang Demo 212', 'suket11.pdf'),
(12, '2', 1, 'Aitakata', '1977-01-27 08:45:26', '', 43, 'BAR', 'aitakata@example.net', '7286329354269', '089657896369', 'Keputih', 'Artis', 'suket12.pdf'),
(13, '2', 0, 'Eminem', '1978-01-15 08:45:26', '', 42, 'USA', 'eminem@example.net', '3760572687269', '087987023169', 'Mayangsari', 'Pelajar', 'suket13.pdf'),
(14, '2', 1, 'Lil Dicky', '1979-01-12 08:45:26', '', 41, 'INA', 'dicky@example.net', '2782078670769', '085654932169', 'Gubeng', 'Beban Masyarakat', 'suket14.pdf'),
(15, '2', 1, 'Lil Pump', '1980-01-06 08:45:26', '', 40, 'COK', 'pump@example.net', '8267807862769', '085259875869', 'Mojokerto', 'Beban Keluarga', 'suket15.pdf'),
(16, '3', 1, 'Jotaro', '1981-01-09 08:45:26', '', 39, 'CHA', 'jotaro@example.net', '3675436484569', '087896541269', 'Banyuwangi', 'Maling', 'suket16.pdf'),
(17, '3', 1, 'Dio', '1960-01-06 08:45:26', '', 60, 'INA', 'dio@example.net', '3426348644869', '084975698269', 'Genteng', 'Bakul Risol', 'suket17.pdf'),
(18, '3', 0, 'Mitsuha', '1959-01-06 08:45:26', '', 61, 'COD', 'mitsuha@example.net', '9435648634469', '088787414969', 'Jimbaran', 'Pemilik Love Hotel', 'suket18.pdf'),
(19, '3', 0, 'Joshuke', '1958-01-06 08:45:26', '', 62, 'INA', 'joshuke@example.net', '1686167863769', '086936969369', 'Gumitir', 'Gosipper', 'suket19.pdf'),
(20, '3', 1, 'Jolyne', '1957-01-20 01:50:27', '', 63, 'JPN', 'jolyne@example.com', '7502068896169', '087414744469', 'Jatiroto', 'Korban Pandemi', 'suket20.png'),
(21, '2', 0, 'Diluc Ragnvindr', '1997-04-30 20:42:31', 'L', 23, 'MDS', 'diluc@example.org', '3648926492841', '081211113004', 'Tavern', 'Hunter', 'surat21.png'),
(22, '2', 1, 'Zhongli', '1975-12-31 09:43:17', 'L', 45, 'LIY', 'zhongli@example.net', '3946534056281', '081211113112', 'Archon', 'Reseller', 'surat22.pdf'),
(23, '2', 1, 'Keqing', '2001-11-20 12:31:22', 'P', 19, 'LIY', 'keqing@example.org', '1923728334635', '081211112011', 'Liyue Qixing', 'Ninja', 'surat23.jpg'),
(24, '2', 1, 'Mona Megistus', '2001-08-31 18:15:19', 'P', 19, 'MDS', 'mona@example.com', '3456209208232', '081211113108', 'Hexenzirkel Mondstadt', 'Peramal', 'surat24.pdf'),
(25, '1', 1, 'Qiqi', '2016-03-03 01:55:21', 'P', 4, 'CHN', 'qiqi@example.com', '0303326346224', '081211112007', 'Bubu Pharmacy', '', 'surat25.png'),
(26, '2', 0, 'Ningguang', '1997-08-26 20:42:31', 'P', 23, 'LIY', 'ningguang@gmail.com', '2608362462951', '081211112608', 'Liyue Qixing', 'Penjaga', 'surat26.png'),
(27, '2', 1, 'Beidou', '2001-02-14 03:53:17', 'P', 19, 'CHN', 'beidou@example.net', '1402832498365', '081211111402', 'Crux Fleet Liyue', 'Pedagang', 'surat27.pdf'),
(28, '2', 0, 'Venti', '1999-06-16 17:31:28', 'L', 21, 'JPN', 'venti@example.org', '1606346239685', '081211111606', 'Archon', 'Penunggang naga', 'surat28.jpg'),
(29, '2', 0, 'Razor', '2002-09-09 18:15:19', 'L', 18, 'MDS', 'razor@example.com', '0909984933636', '081211110909', 'Andrius', 'Peternak serigala', 'surat29.pdf'),
(30, '2', 1, 'Chongyun', '2006-09-07 01:55:21', 'L', 14, 'CHN', 'chongyun@example.com', '0709213234997', '081211110709', 'Liyue harbor', 'Pedagang es krim', 'surat30.png'),
(31, '2', 1, 'Kamisato Ayaka', '2001-09-28 07:45:21', 'P', 19, 'JPN', 'ayaka@gmail.com', '2809234766341', '081211112809', 'Inazuma', 'Bisnis Es', 'surat31.pdf'),
(32, '2', 0, 'Barbara Page', '2005-07-05 17:25:21', 'P', 15, 'MDS', 'barbara@example.com', '0507123286236', '081211110507', 'Church of Favonius', 'Biarawati', 'surat32.png'),
(33, '2', 1, 'Jean Gunnhildr', '1997-03-14 19:21:21', 'P', 23, 'MDS', 'jean@example.net', '1403236529374', '081211111403', 'Knights of Favonius', 'Penjaga', 'surat33.pdf'),
(34, '2', 0, 'Xiao', '2001-04-17 13:51:29', 'L', 19, 'LIY', 'xiao@gmail.com', '1704487238623', '081211111704', 'Liyue Adeptus', 'Penjual tombak', 'surat34.pdf'),
(35, '2', 0, 'Kaeya Alberich', '1998-11-30 17:31:49', 'L', 22, 'IND', 'kaeya@example.org', '3011846351524', '081211113011', 'Favonius Mondstadt', 'Bisnis Es', 'surat35.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan_tiket`
--

DROP TABLE IF EXISTS `pemesanan_tiket`;
CREATE TABLE IF NOT EXISTS `pemesanan_tiket` (
  `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) NOT NULL,
  `id_penerbangan` int(11) NOT NULL,
  PRIMARY KEY (`id_pemesanan`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pemesanan_tiket`
--

INSERT INTO `pemesanan_tiket` (`id_pemesanan`, `id_pelanggan`, `id_penerbangan`) VALUES
(1, 1, 1),
(2, 2, 5),
(3, 5, 2),
(4, 4, 3),
(5, 3, 4),
(36, 50, 37),
(37, 38, 38),
(38, 37, 39),
(39, 39, 40),
(40, 41, 41),
(41, 40, 42),
(42, 36, 44),
(43, 45, 43),
(44, 44, 45),
(45, 43, 36),
(46, 42, 46),
(47, 46, 47),
(48, 47, 48),
(49, 48, 50),
(50, 49, 49),
(51, 51, 51),
(52, 52, 52),
(53, 53, 53),
(54, 54, 54),
(55, 55, 55),
(56, 56, 56),
(57, 57, 57),
(58, 58, 58),
(59, 59, 59),
(60, 60, 60),
(61, 61, 61),
(62, 62, 62),
(63, 63, 63),
(64, 64, 64),
(65, 65, 65),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25),
(26, 26, 26),
(27, 27, 27),
(28, 28, 28),
(29, 29, 29),
(30, 30, 30),
(31, 31, 31),
(32, 32, 32),
(33, 33, 33),
(34, 34, 34),
(35, 35, 35);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbangan`
--

DROP TABLE IF EXISTS `penerbangan`;
CREATE TABLE IF NOT EXISTS `penerbangan` (
  `id_penerbangan` int(11) NOT NULL AUTO_INCREMENT,
  `id_pesawat` int(11) NOT NULL,
  `id_bandara_asal` int(11) NOT NULL,
  `id_bandara_tujuan` int(11) NOT NULL,
  `id_kursi` int(11) NOT NULL,
  `waktu_berangkat` datetime NOT NULL,
  `waktu_tiba` datetime NOT NULL,
  `lama_penerbangan` time NOT NULL,
  PRIMARY KEY (`id_penerbangan`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `penerbangan`
--

INSERT INTO `penerbangan` (`id_penerbangan`, `id_pesawat`, `id_bandara_asal`, `id_bandara_tujuan`, `id_kursi`, `waktu_berangkat`, `waktu_tiba`, `lama_penerbangan`) VALUES
(1, 2, 3, 1, 5, '2021-01-11 00:00:00', '2021-01-11 23:00:00', '23:00:00'),
(2, 3, 4, 2, 4, '2021-01-11 07:53:21', '2021-01-11 21:27:19', '13:33:58'),
(3, 1, 5, 3, 3, '2020-09-18 16:51:57', '2020-09-18 20:49:45', '03:57:48'),
(4, 4, 1, 4, 2, '2020-01-16 18:53:34', '2020-01-16 20:56:33', '02:02:59'),
(5, 5, 2, 5, 1, '2020-03-11 04:39:53', '2020-03-11 09:06:36', '04:26:43'),
(36, 3, 1, 2, 36, '2021-01-08 16:43:30', '2021-01-08 17:43:30', '01:00:00'),
(37, 3, 2, 3, 37, '2021-01-08 16:43:30', '2021-01-08 17:30:30', '00:47:00'),
(38, 3, 1, 2, 38, '2021-01-15 12:00:00', '2021-01-15 13:00:00', '01:00:00'),
(39, 3, 2, 38, 39, '2021-01-15 12:00:00', '2021-01-15 16:00:00', '04:00:00'),
(40, 3, 38, 43, 40, '2021-01-15 12:00:00', '2021-01-15 13:00:00', '01:00:00'),
(41, 3, 41, 40, 41, '2021-01-15 12:00:00', '2021-01-15 12:45:00', '00:45:00'),
(42, 3, 2, 1, 42, '2021-01-20 17:00:00', '2021-01-20 18:00:00', '01:00:00'),
(43, 3, 48, 41, 43, '2021-01-20 17:00:00', '2021-01-20 18:00:00', '01:00:00'),
(44, 3, 36, 50, 44, '2021-01-20 13:00:00', '2021-01-20 15:00:00', '02:00:00'),
(45, 3, 47, 45, 45, '2021-01-20 13:00:00', '2021-01-20 16:00:00', '03:00:00'),
(46, 3, 37, 42, 46, '2021-01-20 13:00:00', '2021-01-20 17:00:00', '04:00:00'),
(47, 3, 42, 43, 47, '2021-01-28 10:00:00', '2021-01-28 12:00:00', '02:00:00'),
(48, 3, 46, 47, 48, '2021-01-20 00:00:00', '2021-01-20 10:00:00', '10:00:00'),
(49, 3, 5, 2, 49, '2021-01-20 18:00:00', '2021-01-20 20:00:00', '02:00:00'),
(50, 3, 1, 2, 50, '2021-01-20 18:00:00', '2021-01-20 19:00:00', '01:00:00'),
(51, 4, 64, 62, 51, '2020-12-19 09:10:00', '2020-12-19 14:12:00', '05:02:00'),
(52, 4, 64, 62, 52, '2020-12-19 09:10:00', '2020-12-19 14:12:00', '05:02:00'),
(53, 4, 64, 62, 53, '2020-12-19 09:10:00', '2020-12-19 14:12:00', '05:02:00'),
(54, 4, 64, 62, 54, '2020-12-19 09:10:00', '2020-12-19 14:12:00', '05:02:00'),
(55, 4, 64, 62, 55, '2020-12-19 09:10:00', '2020-12-19 14:12:00', '05:02:00'),
(56, 4, 64, 62, 56, '2020-12-19 09:10:00', '2020-12-19 14:12:00', '05:02:00'),
(57, 4, 64, 62, 57, '2020-12-19 09:10:00', '2020-12-19 14:12:00', '05:02:00'),
(58, 4, 64, 62, 58, '2020-12-19 09:10:00', '2020-12-19 14:12:00', '05:02:00'),
(59, 4, 64, 62, 59, '2020-12-19 09:10:00', '2020-12-19 14:12:00', '05:02:00'),
(60, 4, 64, 62, 61, '2020-12-19 09:10:00', '2020-12-19 14:12:00', '05:02:00'),
(61, 4, 64, 62, 61, '2020-12-19 09:10:00', '2020-12-19 14:12:00', '05:02:00'),
(62, 4, 64, 62, 62, '2020-12-19 09:10:00', '2020-12-19 14:12:00', '05:02:00'),
(63, 4, 64, 62, 63, '2020-12-19 09:10:00', '2020-12-19 14:12:00', '05:02:00'),
(64, 4, 64, 62, 64, '2020-12-19 09:10:00', '2020-12-19 14:12:00', '05:02:00'),
(65, 4, 64, 62, 65, '2020-12-19 09:10:00', '2020-12-19 14:12:00', '05:02:00'),
(6, 1, 6, 12, 6, '2020-12-19 04:10:00', '2020-12-19 14:12:00', '10:02:00'),
(7, 1, 6, 12, 7, '2020-12-19 04:10:00', '2020-12-19 14:12:00', '10:02:00'),
(8, 1, 6, 12, 8, '2020-12-19 04:10:00', '2020-12-19 14:12:00', '10:02:00'),
(9, 1, 6, 12, 9, '2020-12-19 04:10:00', '2020-12-19 14:12:00', '10:02:00'),
(10, 1, 6, 12, 10, '2020-12-19 04:10:00', '2020-12-19 14:12:00', '10:02:00'),
(11, 1, 6, 12, 11, '2020-12-19 04:10:00', '2020-12-19 14:12:00', '10:02:00'),
(12, 1, 6, 12, 12, '2020-12-19 04:10:00', '2020-12-19 14:12:00', '10:02:00'),
(13, 1, 6, 12, 13, '2020-12-19 04:10:00', '2020-12-19 14:12:00', '10:02:00'),
(14, 1, 6, 12, 14, '2020-12-19 04:10:00', '2020-12-19 14:12:00', '10:02:00'),
(15, 1, 6, 12, 15, '2020-12-19 04:10:00', '2020-12-19 14:12:00', '10:02:00'),
(16, 1, 6, 12, 16, '2020-12-19 04:10:00', '2020-12-19 14:12:00', '10:02:00'),
(17, 1, 6, 12, 17, '2020-12-19 04:10:00', '2020-12-19 14:12:00', '10:02:00'),
(18, 1, 6, 12, 18, '2020-12-19 04:10:00', '2020-12-19 14:12:00', '10:02:00'),
(19, 1, 6, 12, 19, '2020-12-19 04:10:00', '2020-12-19 14:12:00', '10:02:00'),
(20, 1, 6, 12, 20, '2020-12-19 04:10:00', '2020-12-19 14:12:00', '10:02:00'),
(25, 2, 26, 21, 25, '2020-12-31 04:00:00', '2020-12-31 12:00:00', '08:00:00'),
(21, 2, 26, 21, 21, '2020-12-31 04:00:00', '2020-12-31 12:00:00', '08:00:00'),
(24, 2, 26, 21, 24, '2020-12-31 04:00:00', '2020-12-31 12:00:00', '08:00:00'),
(23, 2, 26, 21, 23, '2020-12-31 04:00:00', '2020-12-31 12:00:00', '08:00:00'),
(22, 2, 26, 21, 22, '2020-12-31 04:00:00', '2020-12-31 12:00:00', '08:00:00'),
(26, 2, 26, 21, 26, '2020-12-31 04:00:00', '2020-12-31 12:00:00', '08:00:00'),
(27, 2, 26, 21, 27, '2020-12-31 04:00:00', '2020-12-31 12:00:00', '08:00:00'),
(28, 2, 26, 21, 28, '2020-12-31 04:00:00', '2020-12-31 12:00:00', '08:00:00'),
(29, 2, 26, 21, 29, '2020-12-31 04:00:00', '2020-12-31 12:00:00', '08:00:00'),
(30, 2, 26, 21, 30, '2020-12-31 04:00:00', '2020-12-31 12:00:00', '08:00:00'),
(31, 2, 26, 21, 31, '2020-12-31 04:00:00', '2020-12-31 12:00:00', '08:00:00'),
(32, 2, 26, 21, 32, '2020-12-31 04:00:00', '2020-12-31 12:00:00', '08:00:00'),
(33, 2, 26, 21, 33, '2020-12-31 04:00:00', '2020-12-31 12:00:00', '08:00:00'),
(34, 2, 26, 21, 34, '2020-12-31 04:00:00', '2020-12-31 12:00:00', '08:00:00'),
(35, 2, 26, 21, 35, '2020-12-31 04:00:00', '2020-12-31 12:00:00', '08:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesawat`
--

DROP TABLE IF EXISTS `pesawat`;
CREATE TABLE IF NOT EXISTS `pesawat` (
  `id_pesawat` int(11) NOT NULL AUTO_INCREMENT,
  `id_maskapai` int(11) NOT NULL,
  `id_bandara_asal` int(11) NOT NULL,
  `id_bandara_tujuan` int(11) NOT NULL,
  `jumlah_kursi_1` int(11) NOT NULL,
  `kursi_dipesan_1` int(11) NOT NULL,
  `kursi_kosong_1` int(11) NOT NULL,
  `jumlah_kursi_2` int(11) NOT NULL,
  `kursi_dipesan_2` int(11) NOT NULL,
  `kursi_kosong_2` int(11) NOT NULL,
  `jumlah_kursi_3` int(11) NOT NULL,
  `kursi_dipesan_3` int(11) NOT NULL,
  `kursi_kosong_3` int(11) NOT NULL,
  PRIMARY KEY (`id_pesawat`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pesawat`
--

INSERT INTO `pesawat` (`id_pesawat`, `id_maskapai`, `id_bandara_asal`, `id_bandara_tujuan`, `jumlah_kursi_1`, `kursi_dipesan_1`, `kursi_kosong_1`, `jumlah_kursi_2`, `kursi_dipesan_2`, `kursi_kosong_2`, `jumlah_kursi_3`, `kursi_dipesan_3`, `kursi_kosong_3`) VALUES
(1, 1, 6, 12, 5, 0, 5, 0, 5, 5, 0, 5, 5),
(2, 2, 26, 21, 5, 2, 3, 5, 4, 1, 5, 2, 3),
(3, 4, 4, 2, 25, 25, 0, 20, 15, 5, 15, 15, 0),
(4, 1, 64, 62, 5, 5, 0, 5, 5, 0, 5, 5, 0),
(5, 4, 1, 5, 47, 1, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_kedatangan`
--

DROP TABLE IF EXISTS `status_kedatangan`;
CREATE TABLE IF NOT EXISTS `status_kedatangan` (
  `id_status_kedatangan` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) NOT NULL,
  `id_penerbangan` int(11) NOT NULL,
  `no_paspor` varchar(16) NOT NULL,
  `alamat_di_indo` varchar(50) NOT NULL,
  `hewan_tumbuhan` tinyint(4) NOT NULL,
  `narkoba_sajam` tinyint(4) NOT NULL,
  `uang_1000` tinyint(4) NOT NULL,
  `rokok_25batang` tinyint(4) NOT NULL,
  `barang_dagangan` tinyint(4) NOT NULL,
  `miras` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_status_kedatangan`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `status_kedatangan`
--

INSERT INTO `status_kedatangan` (`id_status_kedatangan`, `id_pelanggan`, `id_penerbangan`, `no_paspor`, `alamat_di_indo`, `hewan_tumbuhan`, `narkoba_sajam`, `uang_1000`, `rokok_25batang`, `barang_dagangan`, `miras`) VALUES
(1, 3, 4, '5579241026364364', 'Tulungagung', 1, 1, 1, 1, 1, 1),
(2, 5, 3, '4556358037338755', '78947 Pfeffer Glens Suite 859', 0, 0, 1, 0, 1, 1),
(3, 4, 2, '374123687651840', '10084 Mara Place', 1, 0, 0, 0, 1, 0),
(4, 2, 5, '5405055867761531', '1592 Cormier Village Suite 494', 1, 0, 1, 0, 1, 0),
(5, 1, 1, '5210251073977485', '68538 Reynold Fork', 1, 0, 0, 1, 1, 0),
(36, 50, 37, '5579241026364390', 'Jakarta', 1, 0, 1, 0, 0, 0),
(37, 38, 38, '5579241026364191', 'Surabaya', 1, 0, 1, 0, 1, 0),
(38, 37, 39, '4578241026364392', 'Surabaya', 1, 0, 0, 0, 0, 0),
(39, 39, 40, '4179241026364881', 'Jakarta', 0, 0, 0, 0, 0, 0),
(40, 41, 41, '5142241026367312', 'Sidoarjo', 0, 0, 0, 0, 0, 0),
(41, 40, 42, '6142241026368765', 'Sidoarjo', 0, 0, 0, 0, 0, 0),
(42, 36, 44, '5142241026367312', 'Depok', 1, 0, 0, 0, 0, 0),
(43, 45, 43, '876224102636826', 'Kediri', 0, 0, 1, 1, 0, 0),
(44, 44, 45, '997654102636731', 'Semarang', 0, 0, 1, 1, 1, 0),
(45, 43, 36, '5142241026367311', 'Kediri', 0, 0, 0, 0, 0, 0),
(46, 42, 46, '5442241026367312', 'Denpasar', 0, 0, 0, 0, 1, 0),
(47, 46, 47, '9742241026367323', 'Surabaya', 1, 0, 0, 0, 1, 0),
(48, 47, 48, '7742241026367322', 'Mojokerto', 0, 0, 0, 1, 1, 0),
(49, 48, 50, '66524102636732', 'Gresik', 0, 0, 0, 0, 0, 0),
(50, 49, 49, '8865241026376112', 'Denpasar', 0, 0, 0, 0, 0, 0),
(53, 53, 53, 'C3698639', 'Jayapura', 0, 1, 0, 0, 0, 0),
(52, 52, 52, 'B1306976', 'Biak', 0, 0, 0, 0, 0, 0),
(51, 51, 51, 'A1369657', 'Timika', 0, 0, 0, 0, 0, 0),
(54, 54, 54, 'D4978623', 'Jember', 0, 0, 0, 0, 0, 0),
(55, 55, 55, 'E7865498', 'Merauke', 0, 0, 0, 0, 0, 0),
(56, 56, 56, 'F1697685', 'Sorong', 0, 0, 0, 1, 0, 0),
(57, 57, 57, 'G3674362', 'Pontianak', 0, 0, 0, 0, 0, 0),
(58, 58, 58, 'H7863297', 'Palembang', 0, 0, 0, 1, 0, 0),
(59, 59, 59, 'I9637568', 'Padang', 0, 0, 1, 0, 0, 0),
(60, 60, 60, 'J3214569', 'Medan', 0, 0, 0, 0, 0, 0),
(61, 61, 61, 'K7896321', 'Malang', 1, 0, 0, 0, 1, 0),
(62, 62, 62, 'L3012579', 'Bandung', 0, 0, 0, 1, 0, 0),
(63, 63, 63, 'M8697135', 'Cirebon', 0, 0, 0, 0, 1, 0),
(64, 64, 64, 'N3214762', 'Surabaya', 0, 0, 0, 1, 0, 0),
(65, 65, 65, 'O9863146', 'Sibolga', 1, 0, 0, 0, 0, 0),
(6, 6, 6, 'F1697669', 'Rawamangun', 0, 0, 0, 1, 0, 0),
(7, 7, 7, 'G3674369', 'Selokan', 0, 0, 0, 0, 0, 0),
(8, 8, 8, 'H7863269', 'Panti Jompo', 0, 0, 0, 1, 0, 0),
(9, 9, 9, 'I9637569', 'Rogojampi', 0, 0, 1, 0, 0, 0),
(10, 10, 10, 'J3214569', 'Sumberwadung', 0, 0, 0, 0, 1, 0),
(11, 11, 11, 'K7896369', 'Sempu', 1, 0, 0, 0, 1, 0),
(12, 12, 12, 'L3012569', 'Keputih', 0, 1, 0, 1, 0, 0),
(13, 13, 13, 'M8697169', 'Mayangsari', 0, 0, 0, 0, 1, 0),
(14, 14, 14, 'N3214769', 'Gubeng', 0, 0, 0, 0, 1, 0),
(15, 15, 15, 'O9863169', 'Mojokerto', 1, 0, 0, 0, 1, 0),
(16, 16, 16, 'A1369669', 'Banyuwangi', 0, 0, 1, 0, 0, 0),
(17, 17, 17, 'B1306969', 'Genteng', 0, 0, 0, 0, 0, 0),
(18, 18, 18, 'C3698669', 'Jimbaran', 0, 1, 0, 0, 0, 0),
(19, 19, 19, 'D4978669', 'Gumitir', 0, 0, 0, 1, 0, 0),
(20, 20, 20, 'E7865469', 'Jatiroto', 0, 1, 0, 0, 0, 0),
(21, 21, 21, '5579241026364364', '21 Tavern St', 1, 1, 1, 1, 1, 1),
(22, 22, 22, '4556358037338755', '17 Monstadt St', 0, 0, 1, 0, 1, 1),
(23, 23, 23, '3741236876518403', '34 Starsnatch Cliff', 1, 0, 1, 0, 1, 0),
(24, 24, 24, '5405055867761531', '22 Musk Reef', 1, 0, 1, 0, 1, 0),
(25, 25, 25, '5210251073977485', '200 Mingyun Village', 1, 0, 0, 1, 1, 0),
(26, 26, 26, '5712246961283647', '11 Qingyun Peak', 0, 0, 1, 0, 1, 0),
(27, 27, 27, '3462856256222731', '37 Tianqiu Valley', 1, 0, 0, 0, 0, 0),
(28, 28, 28, '5746346294622037', '77 Windrise', 0, 1, 0, 0, 0, 1),
(29, 29, 29, '2342556193793638', '99 Cape Oath', 0, 0, 1, 0, 0, 0),
(30, 30, 30, '9704759629462469', '121 Guyun Stone Forest', 0, 1, 0, 0, 1, 0),
(31, 31, 31, '3457398692662868', '66 Wangshu Inn', 1, 0, 0, 1, 0, 0),
(32, 32, 32, '9680735775278426', '22 Starfell Lake', 0, 0, 0, 0, 1, 0),
(33, 33, 33, '9079542585797934', '57 Lingju Pass', 0, 1, 0, 0, 0, 0),
(34, 34, 34, '8857937209089934', '676 Cape Oath', 0, 0, 1, 1, 0, 0),
(35, 35, 35, '6667734892000432', '10 Tianqiu Valley', 0, 1, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_pelanggan`
--

DROP TABLE IF EXISTS `status_pelanggan`;
CREATE TABLE IF NOT EXISTS `status_pelanggan` (
  `id_status_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `statusPelanggan` varchar(10) NOT NULL,
  PRIMARY KEY (`id_status_pelanggan`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `status_pelanggan`
--

INSERT INTO `status_pelanggan` (`id_status_pelanggan`, `statusPelanggan`) VALUES
(1, 'Balita'),
(2, 'Reguler'),
(3, 'Lansia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tipe_kursi`
--

DROP TABLE IF EXISTS `tipe_kursi`;
CREATE TABLE IF NOT EXISTS `tipe_kursi` (
  `id_tipe_kursi` int(11) NOT NULL AUTO_INCREMENT,
  `id_fitur` varchar(200) NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`id_tipe_kursi`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tipe_kursi`
--

INSERT INTO `tipe_kursi` (`id_tipe_kursi`, `id_fitur`, `harga`) VALUES
(3, '3', 333),
(2, '2', 423),
(1, '1', 795);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `viewlamapenerbangan`
-- (Lihat di bawah untuk tampilan aktual)
--
DROP VIEW IF EXISTS `viewlamapenerbangan`;
CREATE TABLE IF NOT EXISTS `viewlamapenerbangan` (
`id_penerbangan` int(11)
,`lama_penerbangan` time
);

-- --------------------------------------------------------

--
-- Struktur untuk view `viewlamapenerbangan`
--
DROP TABLE IF EXISTS `viewlamapenerbangan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewlamapenerbangan`  AS  select `penerbangan`.`id_penerbangan` AS `id_penerbangan`,`penerbangan`.`lama_penerbangan` AS `lama_penerbangan` from `penerbangan` ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
