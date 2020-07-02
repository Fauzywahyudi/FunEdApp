-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 27, 2020 at 04:15 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pkn_quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id_about` int(11) NOT NULL,
  `text` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id_about`, `text`) VALUES
(1, 'Aplikasi edukatif berbasis android yang akan dibuat oleh peneliti bernama  \"FunEd App\" yang merupakan singkatan dari Fun Educational Application. Produk yang diharapkan dalam pengembangan ini adalah dihasilkannya media berbasis android untuk pembelajaran PPKn pada Sekolah Menengah Kejuruan (SMK) yang berkualitas dan layak digunakan dalam proses pembelajaran.\n\nMelalui pengembangan media pembelajaran \"FunEd App\" berbasis android menggunakan program android studio materi PPKn untuk tingkat Sekolah Menengah Kejuruan (SMK) merupakan bentuk upaya memecahkan permasalahan dalam pembelajaran yang dihadapi oleh siswa khususnya pada materi PPKn di SMK.\n\nPengembangan media pembelajaran berbasis android dalam proses belajar mengajar akan memudahkan dan membantu siswa untuk belajar secara mandiri karena media pembelajaran berbasis android bersifat praktis dan mudah digunakan kapanpun. \n\nMedia pembelajaran berbasis android bisa membantu guru untuk mengatasi permasalahan keterbatasan bahan bacaan dan materi yang akan diajarkan. Guru dapat menarik minat belajar siswa dengan menggunakan media pembelajaran berbasis android yang menggabungkan media gambar dan teks yang bervariasi sehingga dapat meransang siswa untuk belajar menyenangkan.');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama`) VALUES
(1, 'admin', 'admin', 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `bab`
--

CREATE TABLE `bab` (
  `id_bab` int(11) NOT NULL,
  `bab` int(11) NOT NULL,
  `nama_bab` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bab`
--

INSERT INTO `bab` (`id_bab`, `bab`, `nama_bab`) VALUES
(1, 1, 'Wawasan Nusantara Dalam Konteks Negara Kesatuan Republik Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `hasil`
--

CREATE TABLE `hasil` (
  `id_hasil` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `pertanyaan` text NOT NULL,
  `pilihan` longtext NOT NULL,
  `jumlah_pertanyaan` int(11) NOT NULL,
  `pilihan_benar` int(11) NOT NULL,
  `tgl_selesai` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hasil`
--

INSERT INTO `hasil` (`id_hasil`, `id_siswa`, `pertanyaan`, `pilihan`, `jumlah_pertanyaan`, `pilihan_benar`, `tgl_selesai`) VALUES
(1, 1, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', '[\"Ketahanan nasional\",\"Menentukan segala kebijakan, keputusan, tindakan dan perbuatan bagi penyelanggaran negara di pusat dan daerah\",\"Pergaulan antar sesama yang lebih akrab\",\"Segala sesuatu yang berhubungan dengan kekuasaan partai politik\",\"Menentukan arah dan tujuan negara dalam berhubungan dengan negara lain.\",\"Pedoman untuk mengadakan hubungan antar bangsa berlandaskan persamaan kedudukan  senagai bangsa yang merdeka dan berdaulat.\",\"Pedoman dalam mewujudkan tujuan nasional sebagaimana terdapat dalam pembukaan UUD Negara RI tahun 1945\",\"Kesadaran cinta tanah air dan bangsa yang lebih lanjut akan membentuk sikap bela Negara pada setiap warga Negaran Indonesia.\",\"Kejujuran\",\"iklim penyelenggaraan Negara yang sehat dan dinamis \"]', 10, 1, '2020-06-25 09:01:35'),
(2, 1, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', '[\"Geostrategi\",\"Menentukan arah dan tujuan negara dalam berhubungan dengan negara lain. \",\"Terbentuknya satu masyarakat yang sama ras, agama, suku dan bahasa\",\"Segala sesuatu yang berhubungan dengan sejarah, ilmu sosial dan politik.\",\"Menentukan arah dan tujuan negara dalam berhubungan dengan negara lain.\",\"Mewujudkaan nasionalisme yang tinggi di segala aspek kehidupan rakyat Indonesia yang lebih mengutamakan kepentingan nasonal daripada kepentingan individu, kelompok, golongan, suku bangsa dan daerah.\",\"Pedoman untuk mengadakan hubungan antar bangsa berlandaskan persamaan kedudukan  senagai bangsa yang merdeka dan berdaulat.\",\"Sikap batiniah dan lahiriah yang mengakui, menerima dan menghormatisegala bentuk perbedaan dan kebhinnekaan sebagai kenyataan hidup sebagai karunia sang pencipta.\",\"Keadilan\",\"Kesadaran cinta tanah air dan bangsa yang lebih lanjut akan membentuk sikap bela Negara pada setiap warga Negaran Indonesia.\"]', 10, 3, '2020-06-25 09:33:37'),
(3, 1, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', '[\"Geostrategi\",\"Menentukan segala kebijakan yang berkaitan dengan hubungan anatara pemerintah pusat dan daerah\",\"Terbentuknya satu masyarakat yang sama ras, agama, suku dan bahasa\",\"Segala sesuatu yang berhubungan dengan partai politik\",\"Menentukan segala kebijakan yang berkaitan dengan hubungan anatara pemerintah pusat dan daerah\",\"Mewujudkan bangsa Indonesia yang maju dan sejahtera berdasarkan Pancasila dan UUD Negara RI tahun 1945.\",\"Pedoman,  motivasi, dorongan serta rambu-rambu dalam menentukan segala kebijakan, keputusan, tindakan  dan perbuatan bagi enyelenggara Negara di tingkat pusat dan daerah bagi seluruh rakyat Indonesia dalam kehidupan bermasyarakat, berbangsa dan bernegara\",\"Sikap batiniah dan lahiriah yang mengakui, menerima dan menghormatisegala bentuk perbedaan dan kebhinnekaan sebagai kenyataan hidup sebagai karunia sang pencipta.\",\"Solidaritas\",\"Kesadaran cinta tanah air dan bangsa yang lebih lanjut akan membentuk sikap bela Negara pada setiap warga Negaran Indonesia.\"]', 10, 3, '2020-06-25 09:34:29'),
(4, 1, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', '[\"Geostrategi\",\"Menentukan arah dan tujuan negara dalam berhubungan dengan negara lain. \",\"Pergaulan antar sesama yang lebih akrab\",\"Segala sesuatu yang berhubungan dengan wilayah negara dan batas-batas wilayah negara.\",\"Menentukan segala kebijakan, keputusan, tindakan dan perbuatan bagi penyelanggaran negara di pusat dan daerah\",\"Pedoman,  motivasi, dorongan serta rambu-rambu dalam menentukan segala kebijakan, keputusan, tindakan  dan perbatan bagi enyelenggara Negara di tingkat pusat dan daerah bagi seluruh rayat Indonesia dalam kehidupan bermasyarakat, berbangsa dan bernegara\",\"Mewujudkan bangsa Indonesia yang maju dan sejahtera berdasarkan Pancasila dan UUD Negara RI tahun 1945.\",\"Kesadaran cinta tanah air dan bangsa yang lebih lanjut akan membentuk sikap bela Negara pada setiap warga Negaran Indonesia.\",\"Keadilan\",\"iklim penyelenggaraan Negara yang sehat dan dinamis \"]', 10, 3, '2020-06-25 09:34:56'),
(5, 1, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', '[\"Wawasan kebangsaan\",\"Menentukan arah dan tujuan negara dalam berhubungan dengan negara lain. \",\"Terbentuknya satu masyarakat yang sama ras, agama, suku dan bahasa\",\"Segala sesuatu yang berkaitan dengan ketatanegaraan atau tindakan mengenai pemerintahan negara atau terhadap negara lain.\",\"Menentukan kebijakan yang berkaitan dengan bidang politik dan sosial budaya \",\"Pedoman dalam mewujudkan tujuan nasional sebagaimana terdapat dalam pembukaan UUD Negara RI tahun 1945\",\"Mewujudkaan nasionalisme yang tinggi di segala aspek kehidupan rakyat Indonesia yang lebih mengutamakan kepentingan nasonal daripada kepentingan individu, kelompok, golongan, suku bangsa dan daerah.\",\"Sikap batiniah dan lahiriah yang mengakui, menerima dan menghormatisegala bentuk perbedaan dan kebhinnekaan sebagai kenyataan hidup sebagai karunia sang pencipta.\",\"Kesetiaan\",\"Tatanan ekonomi yang benar-benar menjamin pemenuhan dan peningkatan kesejahteraan dan kemakmuran rakyat secara adil dan merata\"]', 10, 2, '2020-06-26 22:55:56'),
(6, 1, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', '[\"Ketahanan nasional\",\"Menentukan segala kebijakan yang berhubungan dengan penentuan politik luar negeri\",\"Kehidupan yang serasi, selaras dan seimbang\",\"Segala sesuatu yang berhubungan dengan partai politik\",\"Menentukan arah dan tujuan negara dalam berhubungan dengan negara lain.\",\"Mewujudkaan nasionalisme yang tinggi di segala aspek kehidupan rakyat Indonesia yang lebih mengutamakan kepentingan nasonal daripada kepentingan individu, kelompok, golongan, suku bangsa dan daerah.\",\"Pedoman dalam mewujudkan tujuan nasional sebagaimana terdapat dalam pembukaan UUD Negara RI tahun 1945\",\"Tatanan ekonomi yang benar-benar menjamin pemenuhan dan peningkatan kesejahteraan dan kemakmuran rakyat secara adil dan merata\",\"Keadilan\",\"Sikap batiniah dan lahiriah yang mengakui, menerima dan menghormatisegala bentuk perbedaan dan kebhinnekaan sebagai kenyataan hidup sebagai karunia sang pencipta.\"]', 10, 1, '2020-06-26 22:56:16');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan`
--

CREATE TABLE `pertanyaan` (
  `id_pertanyaan` int(11) NOT NULL,
  `pertanyaan` text NOT NULL,
  `jawaban` text NOT NULL,
  `opsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pertanyaan`
--

INSERT INTO `pertanyaan` (`id_pertanyaan`, `pertanyaan`, `jawaban`, `opsi`) VALUES
(1, 'Cara pandang dan sikap bangsa Indonesia mengenai diri dan lingkungannya yang serba seragam dan bernilai startegis dengan mengutamakan persatuan dan kesatuan bangsa serta kesatuan wilayah dalam penyelenggaraan kehidupan bermasyarakat, berbangsa dan bernegara untuk mencapai tujuan nasional disebutâ€¦', 'Wawasan nusantara', '[\"Geopolitik\",\"Geostrategi\",\"Wawasan nusantara\",\"Wawasan kebangsaan\",\"Ketahanan nasional\"]'),
(2, 'Wawasan nusantara berfungsi sebagai pedoman, motivasi, dorongan dan rambu-rambu dalam....', 'Menentukan segala kebijakan, keputusan, tindakan dan perbuatan bagi penyelanggaran negara di pusat dan daerah', '[\"Menentukan arah dan tujuan negara dalam berhubungan dengan negara lain. \",\"Menentukan segala kebijakan yang berhubungan dengan penentuan politik luar negeri\",\"Menentukan kebijakan yang berkaitan dengan bidang politik dan sosial budaya \",\"Menentukan segala kebijakan, keputusan, tindakan dan perbuatan bagi penyelanggaran negara di pusat dan daerah\",\"Menentukan segala kebijakan yang berkaitan dengan hubungan anatara pemerintah pusat dan daerah\"]'),
(3, 'Persatuan dalam keberagaman harus dipahami oleh setiap warga masyarakat agar dapat mewujudkan hal-hal berikut ini, kecuali....', 'Terbentuknya satu masyarakat yang sama ras, agama, suku dan bahasa', '[\"Pembangunan berjalan lancar\",\"Pergaulan antar sesama yang lebih akrab\",\"Kehidupan yang serasi, selaras dan seimbang\",\"Perbedaan yang ada tidak  menjadi sumber masalah\",\"Terbentuknya satu masyarakat yang sama ras, agama, suku dan bahasa\"]'),
(4, 'Secara etimologis kata geopolitik terbentuk dari dua kata yaitu geo yang berarti planet bumi dan politik yang berarti.....', 'Segala sesuatu yang berkaitan dengan ketatanegaraan atau tindakan mengenai pemerintahan negara atau terhadap negara lain.', '[\"Segala sesuatu yang berhubungan dengan partai politik\",\"Segala sesuatu yang berhubungan dengan kekuasaan partai politik\",\"Segala sesuatu yang berhubungan dengan sejarah, ilmu sosial dan politik.\",\"Segala sesuatu yang berhubungan dengan wilayah negara dan batas-batas wilayah negara.\",\"Segala sesuatu yang berkaitan dengan ketatanegaraan atau tindakan mengenai pemerintahan negara atau terhadap negara lain.\"]'),
(5, 'Wawasan nusantara berfungsi sebagai pedoman, motivasi, dorongan dan rambu-rambu dalam....', 'Menentukan segala kebijakan, keputusan, tindakan dan perbuatan bagi penyelanggaran negara di pusat dan daerah', '[\"Menentukan segala kebijakan yang berhubungan dengan penentuan politik luar negeri\",\"Menentukan segala kebijakan, keputusan, tindakan dan perbuatan bagi penyelanggaran negara di pusat dan daerah\",\"Menentukan segala kebijakan yang berkaitan dengan hubungan anatara pemerintah pusat dan daerah\",\"Menentukan kebijakan yang berkaitan dengan bidang politik dan sosial budaya \",\"Menentukan arah dan tujuan negara dalam berhubungan dengan negara lain.\"]'),
(6, 'Pada hakikatnya wawasan nusantara adalah cara pandang bangsa Indonesia terhadap diri dan lingkungannya berdasarkan Pancasila dan UUD NRI Tahun 1945. Dengan demikian Fungsi wawasan nusantara adalahâ€¦', 'Pedoman,  motivasi, dorongan serta rambu-rambu dalam menentukan segala kebijakan, keputusan, tindakan  dan perbatan bagi enyelenggara Negara di tingkat pusat dan daerah bagi seluruh rayat Indonesia dalam kehidupan bermasyarakat, berbangsa dan bernegara', '[\"Pedoman,  motivasi, dorongan serta rambu-rambu dalam menentukan segala kebijakan, keputusan, tindakan  dan perbatan bagi enyelenggara Negara di tingkat pusat dan daerah bagi seluruh rayat Indonesia dalam kehidupan bermasyarakat, berbangsa dan bernegara\",\"Mewujudkaan nasionalisme yang tinggi di segala aspek kehidupan rakyat Indonesia yang lebih mengutamakan kepentingan nasonal daripada kepentingan individu, kelompok, golongan, suku bangsa dan daerah.\",\"Mewujudkan bangsa Indonesia yang maju dan sejahtera berdasarkan Pancasila dan UUD Negara RI tahun 1945.\",\"Pedoman dalam mewujudkan tujuan nasional sebagaimana terdapat dalam pembukaan UUD Negara RI tahun 1945\",\"Pedoman untuk mengadakan hubungan antar bangsa berlandaskan persamaan kedudukan  senagai bangsa yang merdeka dan berdaulat.\"]'),
(7, 'Pada hakikatnya wawasan nusantara adalah cara pandang bangsa Indonesia terhadap diri dan lingkungannya berdasarkan Pancasila dan UUD NRI Tahun 1945. Dengan demikian tujuan wawasan nusantara adalah â€¦', 'Pedoman,  motivasi, dorongan serta rambu-rambu dalam menentukan segala kebijakan, keputusan, tindakan  dan perbuatan bagi enyelenggara Negara di tingkat pusat dan daerah bagi seluruh rakyat Indonesia dalam kehidupan bermasyarakat, berbangsa dan bernegara', '[\"Pedoman,  motivasi, dorongan serta rambu-rambu dalam menentukan segala kebijakan, keputusan, tindakan  dan perbuatan bagi enyelenggara Negara di tingkat pusat dan daerah bagi seluruh rakyat Indonesia dalam kehidupan bermasyarakat, berbangsa dan bernegara\",\"Mewujudkaan nasionalisme yang tinggi di segala aspek kehidupan rakyat Indonesia yang lebih mengutamakan kepentingan nasonal daripada kepentingan individu, kelompok, golongan, suku bangsa dan daerah.\",\"Mewujudkan bangsa Indonesia yang maju dan sejahtera berdasarkan Pancasila dan UUD Negara RI tahun 1945.\",\"Pedoman dalam mewujudkan tujuan nasional sebagaimana terdapat dalam pembukaan UUD Negara RI tahun 1945\",\"Pedoman untuk mengadakan hubungan antar bangsa berlandaskan persamaan kedudukan  senagai bangsa yang merdeka dan berdaulat.\"]'),
(8, 'Pada hakikatnya wawasan nusantara adalah cara pandang bangsa Indonesia terhadap diri dan lingkungannya berdasarkan Pancasila dan UUD NRI Tahun 1945. Dengan demikian Implementasi wawasan nusantara dalam kehidupan politik akan menciptakanâ€¦... ', 'iklim penyelenggaraan Negara yang sehat dan dinamis', '[\"Iklim penyelenggaraan Negara yang sehat dan dinamis\",\"Tatanan ekonomi yang benar-benar menjamin pemenuhan dan peningkatan kesejahteraan dan kemakmuran rakyat secara adil dan merata\",\"Sikap batiniah dan lahiriah yang mengakui, menerima dan menghormatisegala bentuk perbedaan dan kebhinnekaan sebagai kenyataan hidup sebagai karunia sang pencipta.\",\"Kesadaran cinta tanah air dan bangsa yang lebih lanjut akan membentuk sikap bela Negara pada setiap warga Negaran Indonesia.\",\"Menciptakan kehidupan masyarakat dan bangsa yang rukun dengan membeda-bedakan suku, agama, atau kepercayaan dan golongan berdasarkan status social.\"]'),
(9, 'Azas wawasan nusantara yang menyatakan bahwa adanya kesuaian pembagian hasil dengan adil  jerih  payah dan kegiatan baik perorangan, golongan, kelompok maupun daerah adalahâ€¦', 'Keadilan', '[\"Keadilan\",\"Kejujuran\",\"Solidaritas\",\"Kerja sama\",\"Kesetiaan\"]'),
(10, 'Implementasi wawasan nusantara dalam kehidupan pertahanan keamanan akan menciptakanâ€¦.', 'Kesadaran cinta tanah air dan bangsa yang lebih lanjut akan membentuk sikap bela Negara pada setiap warga Negaran Indonesia.', '[\"iklim penyelenggaraan Negara yang sehat dan dinamis \",\"Tatanan ekonomi yang benar-benar menjamin pemenuhan dan peningkatan kesejahteraan dan kemakmuran rakyat secara adil dan merata\",\"Sikap batiniah dan lahiriah yang mengakui, menerima dan menghormatisegala bentuk perbedaan dan kebhinnekaan sebagai kenyataan hidup sebagai karunia sang pencipta.\",\"Kesadaran cinta tanah air dan bangsa yang lebih lanjut akan membentuk sikap bela Negara pada setiap warga Negaran Indonesia.\",\"Menciptakan kehidupan masyarakat dan bangsa yang rukun dengan membeda-bedakan suku, agama, atau kepercayaan dan golongan berdasarkan status social.\"]');

-- --------------------------------------------------------

--
-- Table structure for table `petunjuk`
--

CREATE TABLE `petunjuk` (
  `id_petunjuk` int(11) NOT NULL,
  `text` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petunjuk`
--

INSERT INTO `petunjuk` (`id_petunjuk`, `text`) VALUES
(1, '1. Mulai Quis');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `nama` text NOT NULL,
  `jk` varchar(10) DEFAULT NULL,
  `kelas` varchar(15) DEFAULT NULL,
  `jurusan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nis`, `password`, `nama`, `jk`, `kelas`, `jurusan`) VALUES
(1, '1234567890', 'fauzy', 'Fauzy Wahyudi', 'Laki-laki', 'IF-2', 'Teknik Informatika'),
(2, '123456', 'piul', 'Rofiul', 'Laki-laki', 'IF-1', 'Teknik Informatika');

-- --------------------------------------------------------

--
-- Table structure for table `sub_bab`
--

CREATE TABLE `sub_bab` (
  `id_sub_bab` int(11) NOT NULL,
  `id_bab` int(11) NOT NULL,
  `nama_sub_bab` text NOT NULL,
  `isi` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_bab`
--

INSERT INTO `sub_bab` (`id_sub_bab`, `id_bab`, `nama_sub_bab`, `isi`) VALUES
(1, 1, 'Pertemuan 1', '1. Pengertian Wawasan Nusantara\nBanyak pengertian tentang Wawasan Nusantara, tetapi ada satu pendapat pengertian Wawasan Nusantara yang diusulkan menjadi Ketetapan Majelis Permusyawaratan Rakyat dan dibuat di Lemhanas Tahun 1999 sebagai berikut.\n\nâ€œCara pandang dan sikap bangsa Indonesia mengenai diri dan lingkungannya yang serba beragam dan bernilai strategis dengan mengutamakan persatuan dan kesatuan bangsa serta kesatuan wilayah dalam  menyelenggarakan kehidupan bermasyarakat, berbangsa, dan bernegara untuk mencapai tujuan nasionalâ€.\n\nSecara etimologis, Wawasan Nusantara berasal dari kata Wawasan dan Nusantara. Wawasan berasal dari kata Wawas (bahasa jawa) yang berarti pandangan, tinjauan dan penglihatan indrawi. Jadi wawasan adalah pandangan, tinjauan, penglihatan, tanggap indrawi. Wawasan berarti pula cara pandang dan cara melihat. Nusantara berasal dari kata nusa dan antara. Nusa artinya pulau atau kesatuan kepulauan. Antara artinya menunjukkan letak antara dua unsur. Jadi Nusantara adalah kesatuan kepulauan yang terletak antara dua benua, ian yaitu benua Asia dan Australia, dan dua samudra, yaitu samudra Hindia dan Pasifik. Berdasarkan pengertian modern, kata â€œnusantaraâ€ digunakan sebagai pengganti nama Indonesia. \n\nSedangkan terminologis, Wawasan menurut beberapa pendapat sebagai berikut :\n\na. Menurut prof. Wan Usman, â€œWawasan Nusantara adalah cara pandang bangsa Indonesia mengenai diri dan tanah airnya sebagai Negara kepulauan dengan semua aspek kehidupan yang beragam.â€\n\nb. Menurut GBHN 1998, Wawasan Nusantara adalah cara pandang dan sikap bangsa Indonesia mengenai diri dan lingkungannya, dengan dalam penyelenggaraan kehidupan bermasyarakat, berbangsa, dan bernegara.\n\nc. Menurut kelompok kerja Wawasan Nusantara untuk diusulkan menjadi tap. MPR, yang dibuat Lemhannas tahun 1999, yaitu â€œcara pandang dan sikap bangsa Indonesia mengenai diri dan lingkungannya yang serba beragam dan bernilai strategis dengan mengutamakan persatuan dan kesatuan bangsa serta kesatuan wilayah dalam penyelenggaraan kehipan bermasyarakat, berbangsa, dan bernegara untuk mencapai tujuan nasional.â€\n\nBerdasarkan pendapat-pendapat diatas, secara sederhana wawasan nusantara berarti cara pandang bangsa Indonesia terhadap diri dan lingkungannya. Wawasan Nusantara sebagai Wawasan Nasional Indonesia pada hakikatnyamerupakan perwujudan dari kepulauan Nusantara sebagai satu kesatuan (HANKAM). \n\n2. Hakikat Wawasan Nusantara\n   Hakikat Wawasan Nusantara adalah keutuhan nusantara dalam pengertian cara pandang yang selalu utuh menyeluruh dalam lingkup nusantara demi kepentingan nasional. Hal tersebut berarti bahwa setiap warga masyarakat dan aparatur negara harus berpikir, bersikap, dan bertindak secara utuh menyeluruh demi kepentingan bangsa dan negara Indonesia. Demikian juga produk yang dihasilkan oleh lembaga negara harus dalam lingkup dan demi kepentingan bangsa dan negara Indonesia tanpa menghilangkan kepentingan lainnya, seperti kepentingan daerah, golongan, dan perorangan.\n\nKita memandang bangsa Indonesia dengan Nusantara merupakan satu kesatuan. Jadi, hakikat Wawasan Nusantara adalah keutuhan dan kesatuan wilayah nasional. Dengan kata lain, hakikat Wawasan  Nusantara adalah â€œpersatuan bangsa dan kesatuan wilayah. Dalam GBHN disebutkan bahwa hakikat Wawasan Nusantara diwujudkan dengan menyatakan kepulauan nusantara sebagai satu kesatuan politik, ekonomi, social budaya, dan pertahanan keamanan.\n\n\n\n\n\n\n\n\n\nSumber : https://www.google.co.id//blog.djarumbeasiswaplus.org\nGambar 7.1. Persatuan dan Kesatuan sebagai wujud Wawasan Nusantara'),
(2, 1, 'Pertemuan 2', 'Wawasan Nusantara berkedudukan sebagai visi bangsa. Wawasan nasional merupakan visi bangsa yang bersangkutan dalam menuju masa depan. Visi bangsa Indonesia sesuai dengan konsep Wawasan Nusantara adalah menjadi bangsa yang satu dengan wilayah  yang satu dan utuh pula. Kedudukan Wawasan Nusantara sebagai salah satu konsepsi ketatanegaran Republik Indonesia.\n\n1. Kedudukan\nWawasan Nusantara sebagai wawasan nasional bangsa Indonesia merupakan   ajaran   yang   diyakini   kebenarannya   oleh   seluruh rakyat Indonesia agar tidak terjadi penyesatan atau penyimpangan dalam   upaya mewujudkan cita-cita dan tujuan nasional. Dengan demikian, Wawasan Nusantara menjadi landasan visional dalam menyelenggarakan kehidupan nasional.\n\n2. Fungsi\nWawasan Nusantara berfungsi sebagai pedoman, motivasi, dorongan, serta rambu-rambu dalam menentukan segala kebijaksanaan, keputusan, tindakan, dan perbuatan bagi penyelenggaraan  negara di tingkat pusat dan daerah maupun bagi seluruh rakyat Indonesia dalam kehidupan bermasyarakat, berbangsa, dan bernegara.\n\n3. Tujuan\nWawasan Nusantara bertujuan mewujudkan nasionalisme yang tinggi di segala aspek kehidupan rakyat Indonesia yang lebih mengutamakan kepentingan nasional daripada kepentingan individu, kelompok golongan, suku bangsa atau daerah. Kepentingan-kepentingan tersebut tetap dihormati, diakui, dan dipenuhi selama tidak bertentangan dengan kepentingan nasional atau kepentingan masyarakat. Nasionalisme yang tinggi disegala bidang demi tercapainya tujuan nasional tersebut merupakan pancaran dari makin meningkatnya rasa, paham, dan semangat kebangsaan dalam jiwa bangsa Indonesia sebagai hasil pemahaman dan penghayatan Wawasan Nusantara.'),
(3, 1, 'Pertemuan 3', '1. Aspek Trigatra Wawasan Nusantara\n\na.Â Letak dan Bentuk Geografis\nIndonesia terletak pada 6 LU â€“ 11 LS, 95 BT â€“ 141 BT, dilalui garis khatulistiwa yang ditengah-tengahnya terbentang garis equator sehingga Indonesia mempunyai 2 musim yaitu musim hujan dan kemarau. \n\nb.Â Â Keadaan dan Kemampuan Penduduk\nPenduduk ialah semua orang yang menempati suatu daerah tertentu. Kemampuan penduduk yang tidak seimbang dengan pertumbuhan penduduk dapat menimbulkan ancaman-ancaman terhadap pertahanan nasional. \nTiga faktor kependudukan yang sangat berpengaruh :\na. Kelahiran (Natalitas)\nb. Kematian (Mortalitas)\nc. Perpindahan (Migrasi)\nd.Â Keadaan dan kekayaan alam\n\nSifat unik kekayaan alam yaitu jumlahnya yang terbatas dan penyebarannya tidak merata. Sehingga menimbulkan ketergantungan dari dan oleh negara dan bangsa lain.\n\nBentuk sumber daya alam ada dua :\n1. Dapat diperbarui\n2. Tidak dapat diperbarui\n3. Sumber daya alam harus diolah atau dimanfaatkan dengan prinsip atau azaz :\n\na. Azaz maksimal\nArtinya sumber daya alam yang dikelola atau dimanfaatkan harus betul-betul menciptakan kemakmuran dan kesejahteraan rakyat.\n\nb. Azaz lestarai\nArtinya pengolahan sumber daya alam tidak  boleh menimbulkan kerusakan lingkungan, menjaga keseimbangan alam.\n\nc. Azaz Berdaya saing\nArtinya bahwa hasil-hasil sumber daya alam harus bisa bersaing dengan sumber daya alam negara lain.\n\n\n\n\n\n\n\n\n\nSumber :\nhttps://www.google.co.id/rajaampatlodges.com dan ameliaahidayat.weebly.com\nGambar 7.2. Indahnya Kekayaan Alam Indonesia sebagai Anugrah Tuhan Yang Maha Esa\n\n2.  Aspek Pancagatra Wawasan Nusantara\na.Â Â Â  Ideologi\nIdeologi suatu negara diartikan sebagai guiding of principles atau prinsip yangdijadikan dasar suatu bangsa. Ideologi adalah pengetahuan dasar atau cita-cita.Ideologi merupakan konsep yang mendalam mengenai kehidupan yang dicita-citakan serta yang ingin diiperjuangkan dalam kehidupan nyata.Ideologi dapat dijabarkan kedalam sistem nilai kehidupan, yaitu serangkaiannilai yang tersusun secara sistematis dan merupakan kebulatan ajaran dan doktrin.Dalam strategi pembinaan ideologi ada beberapa prinsip yang harus diperhatikan yaitu : Ideologi harus diaktualisasikan dalam bidang kenegaraan oleh WNIâ€¡ Ideologi sebagai perekat pemersatu harus ditanamkan pada seluruh WNI\nIdeologi harus dijadikan panglima, bukan sebaliknyaâ€¡ Aktualisasi ideologi dikembangkan kearah keterbukaan dan kedinamisanâ€¡ Ideologi pancasila mengakui keaneragaman dalam hidup berbangsa dandijadikan alat untuk menyejahterakan dan mempersatukan masyarakatâ€¡ Kalangan elit eksekutif, legislatif, dan yudikatif harus harus mewujudkancita-cita bangsa dengan melaksanakan GBHN dengan mengedepankankepentingan bangsaâ€¡ Mensosialisasikan pancasila sebagai ideologi humanis, religius, demokratis,nasionalis, dan berkeadilan Tumbuhkan sikap positif terhadap warga negara dengan meningkatkanmotivasi untuk mewujudkan cita-cita bangsa\n\nb.Â Â Politik	\nDalam hal ini politik diartikan sebagai asas, haluan, atau kebijaksanaanyang digunakan untuk mencapai tujuan dan kekuasaan. Kehidupan politikÂ dapat dibagi kedalam dua sektor yaitu sektor masyarakat yang memberikaninput dan sektor pemerintah yang berfungsi sebagai output.Sistem politik yang diterapkan dalam suatu negara sangat menentukankehidupan politik di negara yang bersangkutan. Upaya bangsa Indonesiauntuk meningkatkan ketahanan di bidang politik adalah upaya mencarikeseimbangan dan keserasian antara keluaran dan masukan berdasarkanÂ pancasila dan merupakan pencerminan dari demokrasi Pancasila.\n\n\n\n\n\n\nSumber : https://www.google.co.id/ www.pusakaindonesia.org dan img.antaranews.com\nGambar  7.3. Pemilu dan Kampanye damai perwujudan Sistem politik Indonesia yang sehat berdasarkan demokrasi Pancasila\n\nc.Â  Ekonomi\nKegiatan ekonomi adalah seluruh kegiatan pemerintah dan masyarakatdalam mengelola faktor produksi dan distribusi barang dan jasa untukÂ kesejahteraan rakyat. Upaya meningkatkan ketahanan ekonomi adalah upayameningkatkan kapasitas produksi dan kelancaran barang dan jasa secaramerata ke seluruh wilayah negara.Upaya untuk menciptakan ketahan ekonomi adalah Sistem ekonomi diarahkan untuk kemakmuran rakyat.\nEkonomi kerakyatan harus menghindari free fight liberalism, etatisme, dantidak dibenarkan adanya monopoli Struktur ekonomi dimantapkan secara seimbang dan selaras antarsektorÂ Pembangunan ekonomi dilaksanakan bersama atas dasar kekeluargaan. Pemerataan pembangunan dan hasil-hasilnya harus dilaksanankan secaraselaras dan seimbang antarwilayah dan antarsektorÂ Kemampuan bersaing harus ditumbuhkan dalam meningkatkan kemandirianekonomi. Ketahanan dibidang ekonomi dapat ditingkatkan melaluiÂ pembangunan nasional yang berhasil, namun tidak dapat dilupakan faktor-faktor non-teknis dapat mempengaruhi karena saling terkait dan berhubungan.\n\n\nd.Â  Sosial Budaya\nSosial budaya dapat diartikan sebagai kondisi dinamik budayaÂ bangsa yang berisai keuletan untuk mengembangkankekuatan nasional dalmmenghadapi dan mengatasi ATHG, baik dari dalam maupun luar, baik yanglangsung maupun yang tidak langsung, yang membahayakan kelangsunganhidup sosial NKRI berdasarkan Pancasila dan UUD 1945.Sedangkan esensi ketahanan budaya adalah pengaturan danÂ penyelenggaraan kehidupan sosial budaya. Dengan demikian, ketahananÂ budaya merupakan pengembangan sosial budaya dimana setiap wargamasyarakat dapat mengembangkan kemampuan pribadi dengan segenapÂ potensinya berdasarkan nilai-nilai pancasila.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nSumber : https://www.google.co.id/media.viva.co.id\nGambar 7.4. Adat-Budaya-Kalimantan\n\ne.Â Â Pertahanan dan Keamanan\nPertahanan dan keamanan diartikan sebagai kondisi dinamikÂ kehidupan pertahanan dan keamanan bangsa Indonesia yang berisi keuletandan ketangguhan yang mengandung kemampuan mengembangkan kekuatan nasional dalam menghadapi dan mengatasi ATHG yang membahayakanidentitas, integritas, dan kelangsungan hidup bangsa berdasarkan pancasila dan UUD 1945.Ketahanan dibidang keamanan adalah ketangguhan suatu bangsa dalam upaya bela negara, dimana seluruh IPOLEKSOSBUD-HANKAM disusun,dikerahkan secara terpimpin, terintegrasi, terorganisasi untuk menjaminterselenggaranya Sistem Ketahan Nasional Prinsip- prinsip Sistem Ketahanan Nasional antara lain :Bangsa Indonesia cinta damai tetapi lebih cinta kemerdekaan Pertahanan keamanan dilandasi dengan landasan ideal pancasila, landasankonstitusional UUD 1945, dan landasan visional wawasan nusantara Pertahanan keamanan negara merupakan upaya terpadu yang melibatkan segenap potensi dan kekuatan nasional Pertahanan dan keamanan diselenggarakan dengan Sishankamnas (Sishankamrata).\n\n\n\n3. Hubungan antar Gatra\nAntara Trigatra dan Pancagatra serta antar gatra itu sendiri terdapat hubungan timbal balik yang erat yang dinamakan korelasi dan interdependensi, dalam arti bahwa: \na. Ketahanan Nasional pada hakikatnya bergantung kepada kemampuan bangsa dan Negara di dalam mendayagunakan secara optimal gatra Alamiah (Trigatra) sebagai modal dasar untuk penciptaan kondisi dinamis yang merupakan kekuatan dalam penyelenggaraan kehidupan nasional (Pancagatra). \nb. Ketahanan nasional adalah suatu pengertian holistic, yaitu suatu tatanan yang utuh, menyeluruh dan terpadu, dimana terdapat saling hubungan antar gatra didalam keseluruhan kehidupan nasional (Astagatra). \nc. Kelemahan di salah satu gatra dapat mengakibatkan kelemahan di gatra lain dan mempengaruhi kondisi secara keseluruhan sebaliknya kekuatan dari salah satu atau beberapa gatra dapat didayagunakan untuk memperkuat gatra lainnya yang lemah, dan mempengaruhi kondisi secara keseluruhan. \nd. Ketahanan Nasional Indonesia bukan merupakan suatu penjumlahan ketahanan segenap gatranya, melainkan suatu resultante keterkaitan yang integrative dari kondisi-kondisi dinamik kehidupan bangsa di bidang-bidang ideology, politik, ekonomi, social budaya, pertahanan dan keamanan.\n\nSelanjutnya hubungan antar gatra, dikemukakan seperti uraian berikut: \n(1) Gatra geografi, Karakter geografi sangat mempengaruhi jenis, kualitas dan persebaran kekayaan alam dan sebaliknya kekayaan alam dapat mempengaruhi karakter geografi. \n(2) Antara Gatra Geografi dan Gatra Kependudukan; Bentuk-bentuk kehidupan dan penghidupan serta persebaran penduduk sangat erat kaitannya dengan karakter geografi dan sebaliknya karakter geografi mempengaruhi kehidupan dari pendudukanya. \n(3) Antara Gatra Kependudukan dan Gatra Kekayaan Alam; Kehidupan dan penghidupan pendudukan dipengaruhi oleh jenis, kualitas, kuantitas dan persebaran kekayaan alam, demikian pula sebaliknya jenis, kualitas, kuantitas dan persebaran kekayaan alam dipengaruhi oleh faktor-faktor kependudukan khususnya kekayaan alam yang dapat diperbaharui.  Kekayaan alam mempunyai manfaat nyata jika telah diolah oleh penduduk yang memiliki kemampuan dalam ilmu pengetahuan dan teknologi. \n(4) Hubungan Antar gatra Dalam Pancagatra; Setiap gatra dalam Pancagatra memberikan kontribusi tertentu pada gatra-gatra lain dan sebaliknya setiap gatra menerima kontribusi dari gatra-gatra lain secara terintegrasi.\n\na.  Antara Gatra Ideologi dengan Gatra Politik, Ekonomi, Sosial-Budaya, Pertahanan dan Keamanan, dalam arti ideologi sebagai falsafah bangsa dan landasan idiil negara merupakan nilai penentu bagi kehidupan nasional yang meliputi seluruh gatra dalam Pancagatra dalam memelihara kelangsungan hidup bangsa dan pencapaian tujuan nasional.\nb. Antara Gatra Politik dengan Gatra Ideologi, Ekonomi, Sosial Budaya, Pertahanan dan Keamanan; Berarti kehidupan politik yang mantap dan dinamis menjalankan kebenaran ideologi, memberikan iklim yang kondusif untuk pengembnagan ekonomi, sosial budaya, pertahanan dan keamanan.  Kehidupan politik bangsa dipengaruhi oleh bermacam hal yang satu dengan yang lainnya saling berkaitan.  Ia dipengaruhi oleh tingkat kecerdasan dan kesadaran politik, tingkat kemakmuran ekonomi, ketaatan beragama, keakraban sosial dan rasa keamanannya.\nc.  Antara Gatra Ekonomi dengan Gatra Ideologi, Politik, Sosial Budaya, Pertahanan dan Keamanan; Berarti kehidupan ekonomi yang tumbuh mantap dan merata, akan menyakinkan kebenaran ideologi yang dianut, mendinamisir kehidupan politik dan perkembangan sosial budaya serta mendukung pengembangan Pertahanan dan Keamanan.  Keadaan ekonomi yang stabil, maju dan merata menunjang stabilitas dan peningkatan ketahanan aspek lain.\nd.  Antara Gatra Sosial Budaya dengan Gatra Ideologi, Politik, Ekonomi, Pertahanan dan Keamanan; Dalam arti kehidupan sosial budaya yang serasi, stabil, dinamis, berbudaya dan berkepribadian, akan menyakinkan kebenaran ideologi, memberikan iklim yang kondusif untuk kehidupan politik yang berbudaya, kehidupan ekonomi yang tetap mementingkan kebersamaan serta kehidupan pertahanan dan keamanan yang menghormati hak-hak individu.  Keadaan sosial yang terintegrasi secara serasi, stabil, dinamis, berbudaya dan berkepribadian hanya dapat berkembang di dalam suasana aman dan damai.  Kebesaran dan keseluruhan nilai sosila budaya bangsa mencerminkan tingkat kesejahteraan dan keamanan nasional baik fisik materiik maupun mental spritual.  Keadaan sosial yang timpang dengan kontradiksi di berbagai bidang kehidupan memungkinkan timbulnya ketegangan sosial yang dapat berkembang menjadi gejolak sosial.\ne. Antara Gatra Pertahanan dan Keamanan dengan Gatra Ideologi, Politik, Ekonomi dan Sosial Budaya; Dalam arti kondisi kehidupan pertahanan dan keamanan yang stabil dan dinamis akan meyakinkan kebenaran ideologi, memberikan iklim yang kondusif untuk pengembangan kehidupan politik, ekonomi dan sosial budaya.  Keadaan pertahanan dan keamanan yang stabil, dinamis, maju dan berkembnag di seluruh aspek kehidupan akan memperkokoh dan menunjang kehidupan ideologi, politik, ekonomi dan sosial budaya.'),
(4, 1, 'Pertemuan 4', 'Wawasan Nusantara harus dijadikan arahan, pedoman, acuan, dan tuntutan bagi setiap individu bangsa Indonesia dalam membangun dan memelihara tuntutan bangsa  dan  Negara  Kesatuan  Republik  Indonesia.  Karena  itu,  implementasi atau penerapan Wawasan Nusantara harus tercermin pada pola pikir, pola sikap, dan pola tindak yang senantiasa mendahulukan kepentingan bangsa daripada kepentingan pribadi atau golongan. Dengan kata lain, Wawasan Nusantara menjadi  pola  yang  mendasari  cara  berpikir,  bersikap,  dan  bertindak  dalam rangka menghadapi, menyikapi, atau menangani berbagai masalah menyangkut kehidupan  bermasyarakat,  berbangsa,  dan  bernegara.  \n\nImplementasi Wawasan Nusantara senantiasa berorientasi pada kepentingan rakyat dan wilayah tanah air secara utuh dan menyeluruh sebagai berikut:\n\n1) Implementasi Wawasan Nusantara dalam kehidupan politik akan menciptakan iklim penyelenggaraan negara yang sehat dan dinamis. Hal tersebut nampak dalam wujud pemerintahan yang kuat, aspiratif, dan terpercaya yang dibangun sebagai penjelmaan kedaulatan rakyat\n\n2) Implementasi Wawasan Nusantara dalam kehidupan ekonomi akan menciptakan tatanan ekonomi yang benar-benar menjamin pemenuhan dan peningkatan kesejahteraan dan kemakmuran rakyat secara merata dan adil. Di samping itu, implementasi Wawasan Nusantara mencerminkan tanggung jawab pengelolaan sumber daya alam yang memperhatikan kebutuhan masyarakat antardaerah secara timbal balik serta kelestarian sumber daya alam itu sendiri.\n\n3) Implementasi Wawasan Nusantara dalam kehidupan sosial budaya akan menciptakan  sikap  batiniah  dan  lahiriah  yang  mengakui,  menerima, dan menghormati segala bentuk perbedaan atau kebhinekaan sebagai kenyataan hidup sekaligus karunia sang Pencipta. Implementasi ini juga akan menciptakan kehidupan masyarakat dan bangsa yang rukun dan bersatu tanpa membeda-bedakan suku, asal usul daerah, agama atau kepercayaan, serta golongan berdasarkan status sosialnya.\n\n4) Implementasi Wawasan Nusantara dalam kehidupan Hankam akan menumbuhkembangkan  kesadaran  cinta  tanah  air  dan  bangsa,  yang lebih lanjut akan membentuk sikap bela negara pada setiap warga negara Indonesia. Kesadaran dan sikap cinta tanah air dan bangsa serta bela negara ini akan menjadi modal utama yang akan menggerakkan partisipasi setiap warga negara Indonesia dalam menanggapi setiap bentuk ancaman, seberapa pun kecilnya dan dari manapun datangnya, atau setiap gejala yang membahayakan keselamatan bangsa dan kedalaulatan negara.\n\n5) Dalam pembinaan seluruh aspek kehidupan nasional sebagaimana dijelaskan di atas, implementasi Wawasan Nusantara harus menjadi nilai yang menjiwai segenap peraturan perundang-undagan yang berlaku pada setiap strata di seluruh Indonesia. Di samping itu, Wawasan Nusantara dapat diimplementasikan ke dalam segenap pranata sosial yang berlaku di masyarakat dalam nuansa kebhinnekaa sehingga menciptakan kehidupan yang toleran, akrab, peduli, hormat, dan taat hukum. Semua itu menggambarkan sikap, paham, dan semangat kebangsaan atau nasionalisme yang tinggi sebagai identitas atau jati diri bangsa Indonesia.\n\n6) Untuk itu, agar terketuk hati nurani setiap warga negara Indonesia dan sadar bermasyarakat, berbangsa, dan bernegara diperlukan pendekatan dengan program yang teratur, terjadwal, dan terarah. Hal ini akan mewujudkan keberhasilan implementasi Negara Kesatuan Republik Indonesia melalui pengukuhan Wawasan.Nusantara. \n\nDengan demikian, NKRI dan Wawasan Nusantara merupakan satu paket dalam kehidupan nasional guna mewujudkan ketahanan nasional yang tidak bisa tergantikan dengan yang lainnya.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id_about`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `bab`
--
ALTER TABLE `bab`
  ADD PRIMARY KEY (`id_bab`);

--
-- Indexes for table `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id_hasil`);

--
-- Indexes for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD PRIMARY KEY (`id_pertanyaan`);

--
-- Indexes for table `petunjuk`
--
ALTER TABLE `petunjuk`
  ADD PRIMARY KEY (`id_petunjuk`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `sub_bab`
--
ALTER TABLE `sub_bab`
  ADD PRIMARY KEY (`id_sub_bab`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id_about` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bab`
--
ALTER TABLE `bab`
  MODIFY `id_bab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hasil`
--
ALTER TABLE `hasil`
  MODIFY `id_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  MODIFY `id_pertanyaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `petunjuk`
--
ALTER TABLE `petunjuk`
  MODIFY `id_petunjuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_bab`
--
ALTER TABLE `sub_bab`
  MODIFY `id_sub_bab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
