<template>
	<div class="pt-8 columns-1">
		<div class="max-w-l rounded overflow-hidden shadow-lg" style="background: #ffffff">
		  <div class="grid grid-cols-1 lg:grid-cols-2">
			  <div class="px-6 py-4">
			    <div class="font-bold text-xl mb-2">Skala Resiko Jatuh</div>
			  </div>
			  <div class="px-6 pb-2 lg: pt-4">
			   <RouterLink to="/spa/tindakan">
			    <BtnWithIcon
				    icon="ChevronRightIcon"
				    color="indigo"
				    title="Tambah Skala"
				    icon-size="sm"
						class="lg:float-right mb-5">
				    	Tindakan
					</BtnWithIcon>
			   </RouterLink>
			   <RouterLink to="/spa/skj/tambah">
			    <BtnWithIcon
				    icon="PlusIcon"
				    color="green"
				    title="Tambah Skala"
				    icon-size="sm"
						class="lg:float-right mr-6">
				    	Tambah
					</BtnWithIcon>
			   </RouterLink>
			  </div>
		  </div>
		  <div class="grid grid-cols-2">
		  	<p class="px-6 py-2">Nama</p>
		  	<p class="px-6 py-2">: Nama Kamu</p>
		  	<p class="px-6 py-2">Kamar</p>
		  	<p class="px-6 py-2">: Kamar Kamu</p>
		  </div>
		  <div class="px-6 py-4">
			  <div class="overflow-x-auto">
			  	<table class="min-w-full">
			  		<tr>
			  			<td colspan="3"></td>
			  			<td align="center" v-for="(post, index) in posts" :key="index">
		  					<RouterLink :to="{name: 'skj-edit', params:{id: post.id}}">
			  					<BtnIcon
						          title="Edit"
						          color="green"
						          icon="PencilIcon"
						          add-class="m-1"
						        />
			  				</RouterLink>
			  				<BtnIcon color="red" icon="TrashIcon" title="Delete" @click.prevent="postDelete(post.id)" add-class="w-10 m-1"/>
			  			</td>
			  		</tr>
			  		<tr class="border-b border-t">
			  			<td rowspan='3' align="center" class="border-r"><b>No</b></td>
			  			<td rowspan='3' align="center" class="border-r"><b>Item Penilaian</b></td>
			  			<td align="center" width="50px" class="border-r">Tgl</td>
			  			<td class="border-r" width="200px" align="center" v-for="(post, index) in posts" :key="index">{{ format_date(post.tanggal) }}</td>
			  		</tr>
			  		<tr class="border-b">
			  			<td class="border-r" align="center">Jam</td>
			  			<td class="border-r" align="center" v-for="(post,index) in posts" :key="index">{{post.jam}}</td>
			  		</tr>
			  		<tr class="border-b">
			  			<td class="border-r" align="center">Skor</td>
			  			<td class="border-r" align="center" v-for="(post,index) in posts" :key="index"></td>
			  		</tr>
			  		<tr>
			  			<td align="center"><b>1</b></td>
			  			<td class="border-r border-l border-b"><b>Usia</b></td>
			  			<td class="border-r border-l border-b"></td>
			  			<td class="border-b border-r" v-for="(post,index) in posts" :key="index"></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b"><span>&#60;</span> 60 Tahun</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">0</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.usia_pilihan === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b"><span>&gt;</span> 60 Tahun</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">1</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.usia_pilihan === 2"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b"><span>&gt;</span> 80 Tahun</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">2</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.usia_pilihan === 3"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td class="border-t" align="center"><b>2</b></td>
			  			<td class="mr-3 border-r border-l border-b"><b>Defisit Sensoris</b></td>
			  			<td class="mr-3 border-r border-l border-b"></td>
			  			<td class="mr-3 border-r border-l border-b" v-for="(post,index) in posts" :key="index"></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">A. Kacamata Bukan Bifocal</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">0</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.defisit_sensoris_pilihan === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">B. Kacamata Bifocal</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">1</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.defisit_sensoris_pilihan === 2"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">C. Gangguan Pendengaran</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">1</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.defisit_sensoris_pilihan === 3"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">D. Kacamata Multifocal</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">2</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.defisit_sensoris_pilihan === 4"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">E. Katarak / Glaucoma</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">2</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.defisit_sensoris_pilihan === 5"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">F. Hampir Tidak Melihat</td>
			  			<td class="mr-3 border-r border-l border-b"></td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.defisit_sensoris_pilihan === 6"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td class="mr-3 border-r border-l border-t" align="center"><b>3</b></td>
			  			<td class="mr-3 border-r border-l border-b"><b>Aktivitas</b></td>
			  			<td class="mr-3 border-r border-l border-b"></td>
			  			<td class="mr-3 border-r border-l border-b" v-for="(post,index) in posts" :key="index"></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">A. Mandiri</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">0</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.aktivitas_pilihan === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">B. ADL Dibantu Sebagian</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">2</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.aktivitas_pilihan === 2"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">C. ADL Dibantu Penuh</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">3</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.aktivitas_pilihan === 3"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td class="mr-3 border-r border-l border-t" align="center"><b>4</b></td>
			  			<td class="mr-3 border-r border-l border-b"><b>Riwayat Jatuh</b></td>
			  			<td class="mr-3 border-r border-l border-b"></td>
			  			<td class="mr-3 border-r border-l border-b" v-for="(post,index) in posts" :key="index"></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">A. Tidak Pernah</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">0</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.riwayat_jatuh_pilihan === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">B. Jatuh <span>&#60;</span> 1 Tahun</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">1</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.riwayat_jatuh_pilihan === 2"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">C. Jatuh <span>&#60;</span> 1 Bulan</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">2</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.riwayat_jatuh_pilihan === 3"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">D. Jatuh Pada Saat Dirawat Sekarang</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">3</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.riwayat_jatuh_pilihan === 4"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td class="mr-3 border-r border-l border-t" align="center"><b>5</b></td>
			  			<td class="mr-3 border-r border-l border-b"><b>Kognisi</b></td>
			  			<td class="mr-3 border-r border-l border-b"></td>
			  			<td class="mr-3 border-r border-l border-b" v-for="(post,index) in posts" :key="index"></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">A. Orientasi Baik</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">0</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.kognisi_pilihan === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">B. Kesulitan Mengerti Perintah</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">2</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.kognisi_pilihan === 2"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">C. Gangguan Memori</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">2</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.kognisi_pilihan === 3"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">D. Kebingungan</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">3</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.kognisi_pilihan === 4"><span>	&#10003;</span></p></td>
			  		</tr>		  		
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">E. Disorientasi</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">3</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.kognisi_pilihan === 5"><span>	&#10003;</span></p></td>
			  		</tr>		
			  		<tr>
			  			<td class="mr-3 border-r border-l border-t" align="center"><b>6</b></td>
			  			<td class="mr-3 border-r border-l border-b"><b>Pengobatan</b></td>
			  			<td class="mr-3 border-r border-l border-b"></td>
			  			<td class="mr-3 border-r border-l border-b" v-for="(post,index) in posts" :key="index"></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">A. <span>&gt;</span> 4 Jenis Pengobatan</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">2</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.pengobatan_pilihan === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b" >B. Anti Hipertensi/Hipoglikemik/Antidepresan</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">2</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.pengobatan_pilihan === 2"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">C. Sedatif Psikotropika/Narkotika</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">2</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.pengobatan_pilihan === 3"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">D. Infus/Epidural/Spinal/Dower Catheter/Traksi</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">3</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.pengobatan_pilihan === 4"><span>	&#10003;</span></p></td>
			  		</tr>		  		
			  		<tr>
			  			<td class="mr-3 border-r border-l border-t" align="center"><b>7</b></td>
			  			<td class="mr-3 border-r border-l border-b"><b>Mobilitas</b></td>
			  			<td class="mr-3 border-r border-l border-b" align="center"></td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">A. Mandiri</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">0</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.mobilitas_pilihan === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">B. Menggunakan Alat Bantu Berpindah</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">1</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.mobilitas_pilihan === 2"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">C. Koordinasi/Keseimbangan Buruk</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">2</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.mobilitas_pilihan === 3"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">D. Dibantu Sebagian</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">3</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.mobilitas_pilihan === 4"><span>	&#10003;</span></p></td>
			  		</tr>	
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">E. Dibantu Penuh/Bed Rest/Nurse Assist</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">4</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.mobilitas_pilihan === 5"><span>	&#10003;</span></p></td>
			  		</tr>	
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">F. Lingkungan Dengan Banyak Furniture</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">4</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.mobilitas_pilihan === 6"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td class="mr-3 border-r border-l border-t" align="center"><b>8</b></td>
			  			<td class="mr-3 border-r border-l border-b"><b>Pola BAB/BAK</b></td>
			  			<td class="mr-3 border-r border-l border-b"></td>
			  			<td class="mr-3 border-r border-l border-b" v-for="(post,index) in posts" :key="index"></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">A. Teratur</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">0</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.pola_bab_bak_pilihan === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">B. Inkontinensia Urine/Feses</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">1</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.pola_bab_bak_pilihan === 2"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">C. Nokturia</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">2</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.pola_bab_bak_pilihan === 3"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">D. Urgensi/Frekuensi</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">3</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.pola_bab_bak_pilihan === 4"><span>	&#10003;</span></p></td>
			  		</tr>	
			  		<tr>
			  			<td class="mr-3 border-r border-l border-t" align="center"><b>9</b></td>
			  			<td class="mr-3 border-r border-l border-b"><b>Komorbiditas</b></td>
			  			<td class="mr-3 border-r border-l border-b" align="center"></td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">A. Diabetes/Penyakit Jantung/Stroke/ISK, dll</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">2</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.komorbiditas_pilihan === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b">B. Gangguan Saraf Pusat/Parkinson</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">3</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.komorbiditas_pilihan === 2"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td></td>
			  			<td class="mr-3 border-r border-l border-b" >C. Pasca Bedah 0-24 Jam</td>
			  			<td class="mr-3 border-r border-l border-b" align="center">3</td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.komorbiditas_pilihan === 3"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td class="mr-3 border-r border-l border-b border-t" colspan="2" align="center"><b>JUMLAH SKOR</b></td>
			  			<td class="mr-3 border-r border-l border-b"></td>	
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index">{{ post.jumlah_skor }}</td>
			  		</tr>
			  		<tr>
			  			<td class="mr-3 border-r border-l border-b" colspan="2" align="center"><b>KETERANGAN</b></td>
			  			<td class="mr-3 border-r border-l border-b"></td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index">{{ post.keterangan }}</td>
			  		</tr>
			  		<tr>
			  			<td class="mr-3 border-r border-l border-b" colspan="2"><b>RESIKO RENDAH</b></td>
			  			<td class="mr-3 border-r border-l border-b" align="center"> 0-7 </td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.resiko === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td class="mr-3 border-r border-l border-b" colspan="2"><b>RESIKO SEDANG</b></td>
			  			<td class="mr-3 border-r border-l border-b" align="center"> 8-13 </td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.resiko === 2"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr>
			  			<td class="mr-3 border-r border-l border-b" colspan="2"><b>RESIKO TINGGI</b></td>
			  			<td class="mr-3 border-r border-l border-b" align="center"> <span>&gt;</span> 14 </td>
			  			<td class="mr-3 border-r border-l border-b" align="center" v-for="(post,index) in posts" :key="index"><p v-if="post.resiko === 3"><span>	&#10003;</span></p></td>
			  		</tr>
			  	</table>
			  </div>
		  </div>
		</div>
	</div>
</template>

<script>
import BtnWithIcon from '../components/global/BtnWithIcon.vue';
import BtnIconDropdown from '../components/global/BtnIconDropdown.vue';
import BtnIcon from '../components/global/BtnIcon.vue';
import TableComp from '../components/global/TableComp.vue';
import axios from 'axios';
import { onMounted, ref } from 'vue';
import moment from 'moment';
import { PencilIcon, TrashIcon, ArrowLongDownIcon, ChevronUpDownIcon } from '@heroicons/vue/24/outline'
import { useRouter } from 'vue-router';
export default {
	setup() {

      //reactive state
      let posts = ref([])

	  const router = useRouter()

      //mounted
      onMounted(() => {

          //get API from Laravel Backend
          axios.get('http://localhost:8000/api/rjd/data')
          .then(response => {
            
            //assign state posts with response data
            posts.value = response.data.data

          }).catch(error => {
              console.log(error.response.data)
          })

      })

      function postDelete(id) {
			   if(confirm("Apakah Anda Yakin Menghapus Data Ini?")){
				   //delete data post by ID
				   axios.get(`http://localhost:8000/api/rjd/delete/${id}`)
				   .then(() => {
				              
				       //splice posts 
				       router.push({
                		name: 'skj'
            		   })

				    }).catch(error => {
				        console.log(error.response.data)
				    })			   
			   }

			}


      //return
      return {
          posts,
          postDelete
      }

  },
  components: {
    BtnWithIcon,
    TableComp,
    BtnIcon,
    PencilIcon,
    TrashIcon,
	BtnIconDropdown
  },
  methods: { 
      format_date(value){
         if (value) {
           return moment(String(value)).format('DD-MM-YY')
          }
      },
      format_time(value){
         if (value) {
           return moment(String(value)).format('HH:MM')
          }
      },
  },
  data () {
    return {
      columns: [
        { label: '-', field: 'checkbox' },
        { label: 'Tgl', field: 'tanggal'},
        { label: 'Defisit', field: 'defisit_sensoris_pilihan'},
        { label: 'Akt', field: 'aktivitas_pilihan'},
        { label: 'Riwayat', field: 'riwayat_jatuh_pilihan'},
        { label: 'Kog', field: 'kognisi_pilihan'},
        { label: 'Pengobatan', field: 'pengobatan_pilihan'},
        { label: 'Mob', field: 'mobilitas_pilihan'},
        { label: 'Pola BAB', field: 'pola_bab_bak_pilihan'},
        { label: 'Komorbiditas', field: 'komorbiditas_pilihan'},
        { label: 'Skor', field: 'jumlah_skor'},
        { label: 'Aksi', field: 'aksi' }
      ],
      items: [],
      tableDataChecked: [],
      tableLoading: true,
      doLoading: true,
      tableFilter: {
        sortKey: 'tanggal',
        sortOrder: 'desc',
        curPage: 1,
        perPage: 10,
        search: ''
      },
      tableMeta: {
        from: 1,
        to: 1,
        numPage: 1,
        total: 1
      }
    }
  }
}
</script>