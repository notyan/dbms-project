USE PULAU

INSERT INTO SDL (KodeSDL, NamaSDL, JumlahSDL, JenisSDL, LokasiSDL)
VALUES 	('T001', 'Terumbu Karang', 11709,'Terbarukan', 'Bunaken'),
		('T002', 'Hutan Mangrove', 4500000, 'Terbarukan', 'Dangkalan Sunda'),
		('F001', 'Minyak Bumi', 4065, 'Tidak Terbarukan', 'Kutai Kartanegara'),
		('H001', 'Mutiara', 5400, 'Terbarukan', 'Raja Ampat');

INSERT INTO SDA (KodeSDA, NamaSDA, JumlahSDA, JenisSDA, LokasiSDA)
VALUES 	('F001', 'Batubara', 62000000, 'Tidak Terbarukan', 'Kutai Timur'),
		('B001', 'Emas', 25800000, 'Tidak Terbarukan', 'Mimika'),
		('T001', 'Hutan', 40546360, 'Terbarukan', 'Pulau Papua'),
		('T002', 'Minyak Kelapa Sawit', 4510000, 'Terbarukan', 'Pulau Sumatra');

INSERT INTO RELIEF (KdRelief, NamaRelief, JenisRelief, KetinggianMDPL)
VALUES 	('P0001', 'Pantai Baron', 'Pantai', 0),
		('G0001', 'Gunung Lawu', 'Gunung', 3265),
		('S0001', 'Bengawan Solo', 'Sungai', 140),
		('R0001', 'Rawa Pening', 'Rawa', 462),
		('L0001', 'Laut Raja Ampat', 'Laut', 0),
		('G0002', 'Gunung Liangpran', 'Gunung', 2240),
		('G0003', 'Gunung Kerinci', 'Gunung', 3805),
		('D0001', 'Danau Towuti', 'Danau', 300);

INSERT INTO KEPULAUAN (IdPulau, NamaPulau, Luas)
VALUES 	('01', 'Papua', 785753),
		('02', 'Kalimantan', 743330),
		('03', 'Sumatra', 473481),
		('04', 'Sulawesi', 180681),
		('05', 'Jawa', 128297);

INSERT INTO LETAK_ASTRONOMIS (GarisBujur, GarisLintang, TipeFloraFauna)
VALUES 	('141.3470° E', '5.0122° S', 'Australis'),
		('114.5548° E', '0.9619° N', 'Asiatis' ),
		('101.3431° E', '0.5897° S', 'Asiatis'),
		('120.5279° E', '1.8479° S', 'Peralihan'),
		('110.7122° E', '7.6145° S', 'Asiatis');


INSERT INTO LETAK_GEOGRAFIS (KodeBatas, BatasBarat, BatasTimur, BatasUtara, BatasSelatan)
VALUES 	('I3001', 'Negara India dan Samudra Hindia', 'Pulau Kalimantan dan Selat Malaka', 'Negara Malaysia, Singapura dan Teluk Benggala' , 'Kepulauan Mentawai dan Selat Sunda'),
		('I5001', 'Selat Sunda dan Pulau Sumatera', 'Selat Bali dan Pulau Bali', 'Laut Jawa dan Pulau Kalimantan', 'Samudera Hindia'),
		('I2001', 'Selat Karimata', 'Selat Makassar dan Laut Sulawesi', 'Negara Malaysia dan Laut Cina Selatan', 'Laut Jawa'),
		('I4001', 'Pulau Kalimantan dan Selat Makasar', 'Kepulauan Maluku dan Laut Banda', 'Negara Filiphina dan Laut Sulawesi', 'Pulau NTT dan NTB, dan Laut Flores'),
		('I1001', 'Kepulauan Maluku dan Laut Banda', 'Papua Nugini', 'Samudera Pasifik','Benua Australia, Samudera Hindia, Laut Arafu');

INSERT INTO ETNIS (NamaSuku, Daerah, Agama, Ras, Bahasa)
VALUES 	('Suku Jawa', 'Jawa', 'Islam', 'Melayu Mongoloid', 'Jawa'),
		('Suku Sunda', 'Jawa Barat', 'Islam', 'Melayu Mongoloid Muda', 'Sunda'),
		('Suku Batak', 'Sumatra Utara', 'Kristen', 'Melayu Mongoloid Tua', 'Batak'),
		('Suku Madura', 'Jawa Timur', 'Islam', 'Melayu Mongoloid Muda', 'Madura'),
		('Suku Asmat', 'Papua', 'Katolik', 'Melanesia', 'Asmat'),
		('Suku Dayak', 'Kalimantan Barat', 'Islam', 'Melayu Mongoloid', 'Dayak'),
		('Suku Bugis', 'Sulawesi Selatan', 'Islam', 'Melayu Mongoloid Muda', 'Bugis');

INSERT INTO  PROVINSI (KodeProvinsi, NamaProvinsi, NamaKepalaDaerah, IbukotaProvinsi)
VALUES 	('02', 'Jawa Barat', 	'Ridwan Kamil', 'Bandung'),
		('03', 'Jawa Tengah', 'Ganjar  Pranowo', 'Semarang'),
		('05', 'Daerah Istimewa Yogyakarta', 'Sri Sultan Hamengkubuwana X', 'Yogyakarta'),
		('06', 'Nangroe Aceh Darussalam', 'Nova Iriansyah', 'Banda Aceh'),
		('07', 'Sumatra Utara', 'Edy Rahmayadi', 'Medan'),
		('08', 'Sumatra Barat', 'Irwan Prayitno', 'Padang');

INSERT INTO PENDUDUK (NIK, Nama,Agama, Umur, KTP, Ttl, Pekerjaan, Pendidikan, Alamat, JenisKelamin, GolDarah, StatusPerkawinan)
VALUES 	('1050240212010001', 'Mad Defa', 'Islam', 19, 1, 'Gunung Kidul, 02 Desember 2001', 'Pelajar/Mahasiswa', 'SMA', 'Dekat Pantai GK', 1, 'O', 0),
		('0440121001010006', 'Kal Azalia', 'Islam', 20, 1, 'Surabaya, 10 Januari 2001', 'Pelajar/Mahasiswa', 'SMA', 'Beloran Sragen', 0, 'AB', 0),
		('3421090512000001', 'I Rafi', 'Islam', 20, 1, 'Jakarta, 05 Desember 2000', 'Pelajar/Mahasiswa', 'SMA', 'Dekat Lapangan', 1, 'A', 0);

/*BATAS NON FOREIGN*/

INSERT INTO AKTA_LAHIR (NomorAkta, NIK, KotaTerbit, TanggalTerbit, NamaIbu, NamaAyah, Nama, AnakKe, TempatLahir, TanggalLahir, BulanLahir, TahunLahir)
VALUES 	('1050-LU-02122001-0001', '1050240212010001', 'Gunung Kidul','2010-12-25', 'Lestari', 'Suryadi', 'Mad Defa', 2, 'Gunung Kidul', 02, 12, 2001 ),
		('0440-LU-10012001-0001', '0440121001010006', 'Surabaya','2003-02-20', 'Dewi', 'Isnaini', 'Kal Azalia', 1, 'Surabaya', 10, 01, 2001),
		('3421-LU-05122000-0001', '3421090512000001', 'Jakarta','2001-10-05', 'Iin', 'Rizal', 'I Rafi', 1, 'Jakarta', 05, 12, 2000);

INSERT INTO KK (NoKK, NIK, JmlKeluarga, Pengesah, TglDikeluarkan, NamaKepalaKeluarga)
VALUES 	('1050010212010002', '1050240212010001', 5, 'Hartanto', '2020-06-10', 'Suryadi'),
		('0440011001010001', '0440121001010006', 6, 'Yanto', '2019-07-11', 'Isnaini'),
		('3421010512000003', '3421090512000001', 7, 'Wiharto', '2018-02-20', 'Rizal');

INSERT INTO IKLIM (KodeIklim, NamaIklim)
VALUES (11,'Iklim Tropis');

INSERT INTO MUSIM (KodeMusim, KdIklim, NamaMusim, Suhu, Durasi)
VALUES 	(21, 11, 'Musim Hujan', 24, 'Oktober-Maret'),
		(22, 11, 'Musim Kemarau', 30, 'April-September');


INSERT INTO WILAYAH_ADMINISTRASI (KodeWilayah, NamaWilayah, KodeProv, JumlahKecamatan, JumlahKelurahan, JumlahPenduduk, Luas)
VALUES 	('3401', 'Kab KulonProgo', '05', 12, 88, 417473, 586),
		('3402', 'Kab Bantul', '05', 17, 75, 913407, 508),
		('3403', 'Kab GunungKidul', '05', 18, 144, 749447, 1431);

INSERT INTO PERANGKAT_DAERAH (IdPejabat, NamaPejabat, Jabatan, LembagaPenaung, Periode, KodeProv)
VALUES 	('011660419124032003', 'Ridwan Kamil', 'Gubernur', 'Independen', '2018-2023' , '02');

INSERT INTO KepMemilikiEtnis (IdPulau, NamaSuku, Daerah)
VALUES 	('01', 'Suku Asmat', 'Papua'),
		('02', 'Suku Dayak', 'Kalimantan Barat'),
		('03', 'Suku Batak', 'Sumatra Utara'),
		('04', 'Suku Bugis', 'Sulawesi Selatan'),
		('05', 'Suku Jawa', 'Jawa Tengah');

INSERT INTO KepMemilikiRelief (IdPulau, KdRelief)
VALUES	('01','L0001'),
		('02','G0002'),
		('03','G0003'),
		('04','D0001'),
		('05','G0001');

INSERT INTO KepMemilikiProv (IdPulau, KodeProv)
VALUES ();

INSERT INTO LAMenyebabkanIklim (KdIklim, GarisBujur, GarisLintang)

INSERT INTO ProvDihuniPenduduk (KodeProv, NIK)
VALUES ();

INSERT INTO LetakKepulauan (IdPulau, KdBatas, GarisBujur, GarisLintang)
VALUES 	('01', 'I1001', '141.3470° E', '5.0122° S'),
		('02', 'I2001', '114.5548° E', '0.9619° N'),
		('03', 'I3001', '101.3431° E', '0.5897° S'),
		('04', 'I4001', '120.5279° E', '1.8479° S'),
		('05', 'I5001', '110.7122° E', '7.6145° S');

INSERT INTO LetakProvinsi (KodeProv, KdBatas, GarisBujur, GarisLintang)
VALUES ();

INSERT INTO KepMemilikiSD (IdPulau, KodeSDL, KodeSDA)
VALUES ();

INSERT INTO ProvMengelolaSD (KodeProv, KodeSDL, KodeSDA)
VALUES ();
