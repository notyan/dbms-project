/*No 1*/
Select kep.NamaPulau, count(PP.KodeProv)
FROM kepulauan as kep
join KepMemilikiProv as PP on PP.IdPulau = kep.IdPulau
group by kep.NamaPulau
having count(PP.KodeProv) > 3

/*No 2*/
Select kep.NamaPulau
FROM kepulauan as kep
join KepMemilikiProv as PP on PP.IdPulau = kep.IdPulau
join LetakKepulauan as LK on LK.IdPulau = kep.IdPulau
join LETAK_GEOGRAFIS as LG on LG.KodeBatas = lk.KdBatas
WHERE	LG.BatasBarat LIKE '%Selat%' OR LG.BatasTimur LIKE '%Selat%' OR LG.BatasUtara LIKE '%Selat%' OR LG.BatasSelatan LIKE '%Selat%'
Group By kep.NamaPulau
having count(PP.KodeProv) > 3

/*No 15*/
Select *
FROM kepulauan as kep
join LetakKepulauan as LK on LK.IdPulau = kep.IdPulau
join LETAK_GEOGRAFIS as LG on LG.KodeBatas = lk.KdBatas
join KepMemilikiSD as KMSD on KMSD.IdPulau = kep.IdPulau
join SDA on SDA.KodeSDA = KMSD.KodeSDA
WHERE LG.BatasSelatan LIKE '%Laut%' And SDA.NamaSDA = 'hutan'

/*12. List sumber daya alam yang dikelola suatu provinsi dan lokasinya di Pulau yg punya danau/ gunung/ sungai*/
Select * 
FROM PROVINSI as PROV
join KepMemilikiProv as PP on PP.KodeProv = Prov.KodeProvinsi
join ProvMengelolaSD as PMSD on PMSD.KodeProv =  PROV.KodeProvinsi
Join KEPULAUAN as KEP on KEP.IdPulau = PP.IdPulau
JOIN KepMemilikiRelief AS KMR on KMR.IdPulau = KEP.IdPulau
Join RELIEF as R on R.KdRelief = KMR.KdRelief
WHERE R.NamaRelief Like '%Laut%' OR  R.NamaRelief Like '%Danau%' OR R.NamaRelief Like '%Gunung%'

/*No 7
Propinsi apa saja yg memiliki batas laut("..") dan di seberah arah mana
*/
Select PROV.NamaProvinsi, LG.BatasBarat, LG.BatasTimur, LG.BatasUtara, LG.BatasSelatan
FROM PROVINSI as PROV
JOIN LetakProvinsi AS LP ON LP.KodeProv = PROV.KodeProvinsi 
JOIN LETAK_GEOGRAFIS as LG ON LG.KodeBatas = LP.KdBatas
WHERE LG.BatasBarat LIKE '%Laut%'  OR LG.BatasTimur LIKE '%Laut%' OR LG.BatasUtara LIKE '%Laut%'  OR LG.BatasSelatan LIKE '%Laut%' 


/*No 16*/
Select *
FROM kepulauan as kep
join LetakKepulauan as LK on LK.IdPulau = kep.IdPulau
join LETAK_GEOGRAFIS as LG on LG.KodeBatas = lk.KdBatas
join KepMemilikiSD as KMSD on KMSD.IdPulau = kep.IdPulau
join SDL on SDL.KodeSDL = KMSD.KodeSDL
WHERE LG.BatasBarat LIKE '%Laut%' OR LG.BatasTimur LIKE '%Laut%' OR LG.BatasUtara LIKE '%Laut%' OR LG.BatasSelatan LIKE '%Laut%'

/*No 17*/
Select *
FROM kepulauan as kep
join KepMemilikiRelief as KMR on KMR.IdPulau = kep.IdPulau
join RELIEF on RELIEF.KdRelief = KMR.KdRelief
where	kep.luas > 125000 and RELIEF.NamaRelief Like 'Gunung%' 

/*OR kep.luas > 125000 and RELIEF.NamaRelief Like 'Gunung%'*/





