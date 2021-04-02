//Library
const sql = require('mssql')
const wa = require('@open-wa/wa-automate');

//COLOR CODE
const red = '\x1b[31m'
const yellow = '\x1b[33m'
const reset = "\x1b[0m"
const cyan = '\x1b[36m%s\x1b[0m'
//OPTION
const cmd = cmds.join(' | ').toLowerCase()
const auth = {
	password: '****',
	database: 'PULAU',
	options: {
    enableArithAbort: true,
    encrypt: true
  	},
	user: 'sa',
	server: 'localhost',
}


wa.create({
	sessionId : 'Absensi',
	headless : true,
}).then(client => start(client));

async function start(client) {
	let pool = await sql.connect(auth)
	let able = ['SDL','SDA','RELIEF','KEPULAUAN', 'ETNIS', 'PROVINSI', 'PENDUDUK']
	console.log(yellow, 'Started', reset ,'!!!');
	var today = new Date();
	var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
	client.onMessage(async message => {
		console.log(yellow, time , reset, 'Chat Masuk dari',  red, message.sender.id.split('@')[0].trim(),  message.sender.pushname, reset)
		switch(message.body.toLowerCase()){
			case '.menu' :{
				(async () =>{
					await client.sendText(message.from, `
*.menu* 	Menampilkan menu ini
*.daftartabel*	Menampilkan daftar tabel yang ada
*.daftarpulau*	Menampilkan daftar tabel yang ada
*.isitabel*		Menampilkan isi dari suatu tabel tertentu
*.kolomtabel*	Menampilkan list kolom dari suatu tabel
*.tambah*	Menampilkan bantuan untuk menambah data
*.hapus*	Menampilkan bantuan untuk menghapus data
*.update*		Menampilkan bantuan untuk mengubah data
`)
				})();
				break;
			}
			case '.daftartabel' :{
				(async () => {
			        try {
			        	let table = await pool.request().query(`SELECT TABLE_NAME FROM PULAU.INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';`).catch((err) => console.log(err))
			          	let string = JSON.stringify(table.recordset).replace(/[\{\[\]\}""]/g,'').replace(/TABLE_NAME:/g, '')
			        	await client.sendText(message.from, string.split(',').join('\n'))
			        }catch(err){}
			        })();
				break;
			}
			case '.daftarpulau' :{
				(async () => {
			        try {
			          	let pulau = await pool.request().query(`SELECT IdPulau,NamaPulau FROM KEPULAUAN;`).catch((err) => console.log(err))
			          	let string = JSON.stringify(pulau.recordset).replace(/[\{\[\]\}""]/g,'').replace(/IdPulau:/g, `ID :`).replace(/,NamaPulau:/g, '  ')
			          	await client.sendText(message.from, string.split(',').join('\n'))
			        }catch(err){}
			        })();
				break;
			}
			case '.tambah':{
				(async () => {
					try{
						await client.sendText(message.from, 'Tabel yang bisa anda tambah datanya :\n' + able.join('\n'))
						await client.sendText(message.from, 'untuk menambah data gunakan perintah .insertdata [namatabel] | [Input Values]')
						await client.sendText(message.from, `Contoh : .insertdata | RELIEF | 'B0001','Bukit Bintang', 'Bukit', 100 `)
					}catch(err){
						console.log(err)
					}
				})()
				break;
			}
			case '.hapus':{
				(async () => {
					try{
						await client.sendText(message.from, 'Tabel yang bisa anda hapus datanya :\n' + able.join('\n'))
						await client.sendText(message.from, 'untuk menghapus data gunakan perintah .deldata [namatabel] | [Where Condition]')
						await client.sendText(message.from, `Contoh : .deldata | RELIEF | KdRelief = 'B1169`)
					}catch(err){
						console.log(err)
					}
				})()
				break;
			}
			case '.update':{
				(async () => {
					try{
						await client.sendText(message.from, 'Tabel yang bisa anda update datanya :\n' + able.join('\n'))
						await client.sendText(message.from, 'untuk mengubah data gunakan perintah .updata [namatabel] | [Yang ingin diubah] | [identifier] ')
						await client.sendText(message.from, `Contoh : .updata | RELIEF | NamaRelief = 'Iyaa' | KdRelief = 'B1169'`)
					}catch(err){
						console.log(err)
					}
				})()
				break;
			}
		}
		if(message.body.toLowerCase().startsWith('.insertdata')){
			(async () => {
					try{
						var id = message.body.slice(11)
						var tab = id.split('|')[1].replace(/\s/g,'')
						var val = id.split('|')[2].replace(/\s/g,'')
						console.log(tab)
						console.log(val)
						let table = ['SDL','SDA','RELIEF','KEPULAUAN', 'ETNIS', 'PROVINSI', 'PENDUDUK']
						const lowercase = table.map(table => table.toLowerCase());
						console.log(lowercase)
						if(lowercase.indexOf(tab) != -1){
							const transaction = new sql.Transaction(pool)
					        transaction.begin(err => {
					            const request = new sql.Request(transaction)
					            request.query(`INSERT INTO ${tab} VALUES (${val})`, (err, result) => {
					                    if(err){
					                        console.log(err.message)
					                        client.sendText(message.from, err.message)
					                    }else{
					                    	console.log(result.rowsAffected)
					                        client.sendText(message.from, 'Row affected = ' + result.rowsAffected)
					                    }
					                transaction.commit(err => {
					                        console.log("Transaction committed.")
					                })
					            })
					        })
						}
						else{
							await client.sendText(message.from, 'Table Tidak ada, silahkan cek tabel di .daftartabel')
						}
					}catch(err){console.log(err)}
			})()
		}
		else if (message.body.toLowerCase().startsWith('.updata')){
			(async () => {
					try{
						var id = message.body.slice(8)
						var tab = id.split('|')[1].replace(/\s/g,'')
						var val = id.split('|')[2].replace(/\s/g,'')
						var con = id.split('|')[3].replace(/\s/g,'')
						let table = ['SDL','SDA','RELIEF','KEPULAUAN', 'ETNIS', 'PROVINSI', 'PENDUDUK']
						const lowercase = table.map(table => table.toLowerCase());
						console.log(lowercase)
						if(lowercase.indexOf(tab) != -1){
							const transaction = new sql.Transaction(pool)
					        transaction.begin(err => {
					            const request = new sql.Request(transaction)
					            request.query(`UPDATE ${tab} SET ${val} WHERE ${con}`, (err, result) => {
					                    if(err){
					                        console.log(err.message)
					                        client.sendText(message.from, err.message)
					                    }else{
					                    	console.log(result.rowsAffected)
					                        client.sendText(message.from, 'Row affected = ' + result.rowsAffected)
					                    }
					                transaction.commit(err => {
					                        console.log("Transaction committed.")
					                })
					            })
					        })
						}
						else{
							await client.sendText(message.from, 'Table Tidak ada, silahkan cek tabel di .daftartabel')
						}
					}catch(err){console.log(err)}
			})()
		}

		else if(message.body.toLowerCase().startsWith('.deldata')){
			(async () => {
					try{
						var id = message.body.slice(9)
						var tab = id.split('|')[1].replace(/\s/g,'')
						var val = id.split('|')[2].replace(/\s/g,'')
						let table = ['SDL','SDA','RELIEF','KEPULAUAN', 'ETNIS', 'PROVINSI', 'PENDUDUK']
						const lowercase = table.map(table => table.toLowerCase());
						console.log(lowercase)
						if(lowercase.indexOf(tab) != -1){
							const transaction = new sql.Transaction(pool)
					        transaction.begin(err => {
					            const request = new sql.Request(transaction)
					            request.query(`DELETE FROM ${tab} WHERE (${val})`, (err, result) => {
					                    if(err){
					                        console.log(err.message)
					                        client.sendText(message.from, err.message)
					                    }else{
					                    	console.log(result.rowsAffected)
					                        client.sendText(message.from, 'Row affected = ' + result.rowsAffected)
					                    }
					                transaction.commit(err => {
					                        console.log("Transaction committed.")
					                })
					            })
					        })
						}
						else{
							await client.sendText(message.from, 'Table Tidak ada, silahkan cek tabel di .daftartabel')
						}
					}catch(err){console.log(err)}
			})()
		}
		else if (message.body.toLowerCase().startsWith('.isitabel')){
			(async () => {
			        try {
			        	var id = message.body.slice(10)
						var tab = id.replace(/\s/g,'')
			        	let isi = await pool.request().query(`SELECT * FROM ${tab}`)
				        let col = await pool.request().query(`SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '${tab}';`)
				        let string = JSON.stringify(isi.recordset).replace(/\{/g,'\n').replace(/[\[\]""]/g,'').replace(/\,/g,'\t')
				        let colRem = JSON.stringify(col.recordset).replace(/[\{\[\]\}""]/g,'').replace(/COLUMN_NAME:/g, '').split(',')
				        for (let i = 0;i < colRem.length;i++){
				            var regex = new RegExp(colRem[i] + ':',"g")
				            string = string.replace(regex, ' ')
				        }
			        	await client.sendText(message.from, string.split('}').join(''))
			        }catch(err){}
			        })();
		}
		else if (message.body.toLowerCase().startsWith('.kolomtabel')){
			(async () => {
			        try {
			        	var id = message.body.slice(12)
						var tab = id.replace(/\s/g,'')
			        	let col = await pool.request().query(`SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '${tab}';`).catch((err) => console.log(err))
			          	let string = JSON.stringify(col.recordset).replace(/[\{\[\]\}""]/g,'').replace(/COLUMN_NAME:/g, '')
			        	console.log(string.split(',').join('\n'))
			        	await client.sendText(message.from, string.split(',').join('\n'))
			        }catch(err){}
			        })();
		}
	});
}
