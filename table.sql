CREATE DATABASE PULAU

USE PULAU

CREATE TABLE SDL(
	KodeSDL char(4) NOT NULL,
	NamaSDL nvarchar(50) NOT NULL,
	JumlahSDL bigint,
	JenisSDL nvarchar(50) NOT NULL,
	LokasiSDL nvarchar(50) NOT NULL,
	PRIMARY KEY (KodeSDL)
);

CREATE TABLE SDA(
	KodeSDA char(4) NOT NULL,
	NamaSDA nvarchar(50) NOT NULL,
	JumlahSDA bigint,
	JenisSDA nvarchar(50) NOT NULL,
	LokasiSDA nvarchar(50) NOT NULL,
	PRIMARY KEY (KodeSDA)
);


CREATE TABLE RELIEF(
	KdRelief char(5) NOT NULL,
	NamaRelief nvarchar(50) NOT NULL,
	JenisRelief nvarchar(50) NOT NULL,
	KetinggianMDPL int,
	PRIMARY KEY (KdRelief)
);

CREATE TABLE KEPULAUAN(
	IdPulau char(4) NOT NULL,
	NamaPulau nvarchar(100) NOT NULL,
	Luas bigint,
	PRIMARY KEY (IdPulau)
);

CREATE TABLE LETAK_ASTRONOMIS(
	GarisBujur nvarchar(25)  NOT NULL,
	GarisLintang nvarchar(25)  NOT NULL, 
	TipeFloraFauna nvarchar(50),
	PRIMARY KEY (GarisBujur,GarisLintang)
);

CREATE TABLE LETAK_GEOGRAFIS(
	KodeBatas char(5) NOT NULL,
	BatasBarat nvarchar(75) NOT NULL,
	BatasTimur nvarchar(75) NOT NULL, 
	BatasUtara nvarchar(75) NOT NULL, 
	BatasSelatan nvarchar(75) NOT NULL, 
	PRIMARY KEY  (KodeBatas)
);

CREATE TABLE ETNIS(
	NamaSuku nvarchar(50)  NOT NULL,
	Daerah nvarchar(50)  NOT NULL,
	Agama nvarchar(25),
	Ras nvarchar(25),
	Bahasa nvarchar(50),
	PRIMARY KEY (NamaSuku, Daerah)
);

CREATE TABLE PROVINSI(
	KodeProvinsi char(2) NOT NULL,
	NamaProvinsi nvarchar(50) NOT NULL,
	NamaKepalaDaerah nvarchar(50) NOT NULL,
	IbukotaProvinsi nvarchar(50)  NOT NULL,
	PRIMARY KEY  (KodeProvinsi)
);

CREATE TABLE PENDUDUK(
	NIK char(16) NOT NULL,
	Nama nvarchar(50) NOT NULL,
	Agama nvarchar(25),
	Umur tinyint,
	KTP bit NOT NULL,
	Ttl nvarchar(50), 
	Pekerjaan nvarchar(50),
	Pendidikan nvarchar(50),
	Alamat nvarchar(100),
	JenisKelamin bit NOT NULL, 
	GolDarah nvarchar(2),
	StatusPerkawinan bit  NOT NULL,
	PRIMARY KEY (NIK)
);

CREATE TABLE AKTA_LAHIR(
	NomorAkta nvarchar(25) NOT NULL,
	NIK char(16) NOT NULL,
	KotaTerbit nvarchar(25),
	TanggalTerbit date NOT NULL,
	NamaIbu nvarchar(25),
	NamaAyah nvarchar(25),
	Nama nvarchar(25),
	AnakKe tinyint,
	TempatLahir nvarchar(25) NOT NULL,
	TanggalLahir tinyint NOT NULL,
	BulanLahir tinyint NOT NULL,
	TahunLahir int NOT NULL,
	PRIMARY KEY (NomorAkta),
	FOREIGN KEY (NIK) REFERENCES PENDUDUK(NIK)
);


CREATE TABLE KK(
	NoKK char(16) NOT NULL,
	NIK char(16) NOT NULL,
	JmlKeluarga tinyint,
	Pengesah nvarchar(25) NOT NULL,
	TglDikeluarkan date,
	NamaKepalaKeluarga nvarchar(25) NOT NULL,
	PRIMARY KEY (NoKK),
	FOREIGN KEY (NIK) REFERENCES PENDUDUK(NIK)
);

CREATE TABLE IKLIM(
	KodeIklim int NOT NULL,
	NamaIklim nvarchar(25)  NOT NULL,
	Suhu nvarchar(10),
	PRIMARY KEY (KodeIklim),
);

CREATE TABLE MUSIM(
	KodeMusim int NOT NULL,
	KdIklim int NOT NULL,
	NamaMusim nvarchar(25)  NOT NULL,
	Suhu smallint,
	Durasi nvarchar(25),
	PRIMARY KEY (KodeMusim),
	FOREIGN KEY (KdIklim) REFERENCES IKLIM(KodeIklim)
);

CREATE TABLE WILAYAH_ADMINISTRASI(
	KodeWilayah char(4) NOT NULL,
	NamaWilayah nvarchar(25) NOT NULL, 
	KodeProv char(2) NOT NULL,
	JumlahKecamatan smallint,
	JumlahKelurahan smallint,
	JumlahPenduduk int,
	Luas bigint,
	PRIMARY KEY (KodeWilayah),
	FOREIGN KEY (KodeProv) REFERENCES PROVINSI(KodeProvinsi)
);


CREATE TABLE PERANGKAT_DAERAH(
	IdPejabat char(18) NOT NULL,
	NamaPejabat nvarchar(25) NOT NULL, 
	Jabatan nvarchar(25) NOT NULL, 
	LembagaPenaung nvarchar(25) NOT NULL, 
	Periode nchar(9),
	KodeProv char(2) NOT NULL,
	PRIMARY KEY (IdPejabat),
	FOREIGN KEY (KodeProv) REFERENCES PROVINSI(KodeProvinsi)
);

DROP TABLE PERANGKAT_DAERAH

CREATE TABLE KepMemilikiEtnis(
	IdPulau char(4) NOT NULL,
	NamaSuku nvarchar(50)  NOT NULL,
	Daerah nvarchar(50)  NOT NULL,
	PRIMARY KEY (IdPulau,NamaSuku,Daerah),

	FOREIGN KEY (IdPulau) REFERENCES KEPULAUAN(IdPulau),
	FOREIGN KEY (NamaSuku,Daerah) REFERENCES ETNIS(NamaSuku,Daerah)
);

CREATE TABLE KepMemilikiRelief(
	IdPulau char(4) NOT NULL,
	KdRelief char(5)  NOT NULL,
	PRIMARY KEY (IdPulau,KdRelief),

	FOREIGN KEY (IdPulau) REFERENCES KEPULAUAN(IdPulau),
	FOREIGN KEY (KdRelief) REFERENCES RELIEF(KdRelief)
);

CREATE TABLE LAMenyebabkanIklim(
	KdIklim int NOT NULL,
	GarisBujur nvarchar(25)  NOT NULL, 
	GarisLintang nvarchar(25)  NOT NULL, 
	PRIMARY KEY (KdIklim, GarisBujur, GarisLintang),
	FOREIGN KEY (KdIklim) REFERENCES IKLIM(KodeIklim),
	FOREIGN KEY (GarisBujur,GarisLintang) REFERENCES LETAK_ASTRONOMIS(GarisBujur,GarisLintang)
	
);

CREATE TABLE KepMemilikiProv(
	IdPulau char(4) NOT NULL,
	KodeProv char(2) NOT NULL,
	PRIMARY KEY (IdPulau,KodeProv),

	FOREIGN KEY (IdPulau) REFERENCES KEPULAUAN(IdPulau),
	FOREIGN KEY (KodeProv) REFERENCES PROVINSI(KodeProvinsi)
);

CREATE TABLE ProvDihuniPenduduk(
	KodeProv char(2) NOT NULL,
	NIK char(16) NOT NULL,
	PRIMARY KEY (KodeProv, NIK),

	FOREIGN KEY (KodeProv) REFERENCES PROVINSI(KodeProvinsi),
	FOREIGN KEY (NIK) REFERENCES PENDUDUK(NIK)
);

CREATE TABLE LetakKepulauan(
	IdPulau char(4) NOT NULL,
	KdBatas char(5) NOT NULL,
	GarisBujur nvarchar(25)  NOT NULL, 
	GarisLintang nvarchar(25)  NOT NULL, 
	PRIMARY KEY  (IdPulau, KdBatas, GarisLintang, GarisBujur),

	FOREIGN KEY (IdPulau) REFERENCES KEPULAUAN(IdPulau),
	FOREIGN KEY (KdBatas) REFERENCES LETAK_GEOGRAFIS(KodeBatas),
	FOREIGN KEY (GarisBujur,GarisLintang) REFERENCES LETAK_ASTRONOMIS(GarisBujur,GarisLintang)
);

CREATE TABLE LetakProvinsi(
	KodeProv char(2) NOT NULL,
	KdBatas char(5) NOT NULL,
	GarisBujur nvarchar(25)  NOT NULL, 
	GarisLintang nvarchar(25)  NOT NULL, 
	PRIMARY KEY  (KodeProv,KdBatas, GarisLintang, GarisBujur),

	FOREIGN KEY (KodeProv) REFERENCES PROVINSI(KodeProvinsi),
	FOREIGN KEY (KdBatas) REFERENCES LETAK_GEOGRAFIS(KodeBatas),
	FOREIGN KEY (GarisBujur,GarisLintang) REFERENCES LETAK_ASTRONOMIS(GarisBujur,GarisLintang)
);

CREATE TABLE KepMemilikiSD(
	IdPulau char(4) NOT NULL,
	KodeSDL char(4) NOT NULL,
	KodeSDA char(4) NOT NULL,
	PRIMARY KEY (IdPulau, KodeSDL, KodeSDA),

	FOREIGN KEY (IdPulau) REFERENCES KEPULAUAN(IdPulau),
	FOREIGN KEY (KodeSDL) REFERENCES SDL(KodeSDL),
	FOREIGN KEY (KodeSDA) REFERENCES SDA(KodeSDA)
);

CREATE TABLE ProvMengelolaSD(
	KodeProv char(2) NOT NULL,
	KodeSDL char(4) NOT NULL,
	KodeSDA char(4) NOT NULL,
	PRIMARY KEY (KodeProv, KodeSDL, KodeSDA),

	FOREIGN KEY (KodeProv) REFERENCES PROVINSI(KodeProvinsi),
	FOREIGN KEY (KodeSDL) REFERENCES SDL(KodeSDL),
	FOREIGN KEY (KodeSDA) REFERENCES SDA(KodeSDA)
);
