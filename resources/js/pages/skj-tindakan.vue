<template>
	<div class="pt-8 columns-1">
		<div class="max-w-l rounded overflow-hidden shadow-lg" style="background: #ffffff">
		  <div class="grid grid-cols-1 lg:grid-cols-2">
			  <div class="px-6 py-4">
			    <div class="font-bold text-xl mb-2">Tindakan Skala Resiko Jatuh</div>
			  </div>
			  <div class="px-6 pb-2 lg: pt-4">
			   <RouterLink to="/spa/skj">
			    <BtnWithIcon
				    icon="ChevronLeftIcon"
				    color="indigo"
				    title="Skala Jatuh"
				    icon-size="sm"
						class="lg:float-right mb-5">
				    	Skala
					</BtnWithIcon>
			   </RouterLink>
			   <RouterLink to="/spa/tindakan/tambah">
			    <BtnWithIcon
				    icon="PlusIcon"
				    color="green"
				    title="Tambah Tindakan SRJD"
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
			  	<table class="min-w-relative border-l">
			  		<tr class="border-b">
			  			<td colspan="2"></td>
			  			<td align="right" v-for="(post, index) in posts" :key="index">
			  				<div class="grid grid-cols-2">
			  					<RouterLink :to="{name: 'tindakan-edit', params:{id: post.id}}">
				  					<BtnIcon
									title="Edit"
									color="green"
									icon="PencilIcon"
									add-class="m-1"
									/>
				  				</RouterLink>
				  				<BtnIcon color="red" icon="TrashIcon" title="Delete"  @click.prevent="postDelete(post.id)" add-class="w-10 m-1"/>
			  				</div>
			  			</td>
			  		</tr>
			  		<tr class="border-b border-r">
			  			<td rowspan='2' align="center" class="border-r w-64 border-l"><b>Protokol</b></td>
			  			<td rowspan='2' align="center" class="border-r w-64"><b>Tindak Pencegahan</b></td>
			  			<td class="border-r" width="200px" align="center" v-for="(post, index) in posts" :key="index">Tgl {{ format_date(post.tanggal) }}</td>
			  		</tr>
			  		<tr class="border-b border-r">
			  			<td class="border-r" align="center" v-for="(post,index) in posts" :key="index">Jam {{post.jam}}</td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r border-t" align="center"><b>Standar (1)</b></td>
			  			<td class="border-l border-r border-b	">1. Orientasi Pasien Pada <br> Lingkungan Kamar / Bangsal</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rr1 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b>(Resiko Rendah)</b></td>
			  			<td class="border-l border-r border-b">2. Pastikan Rem Tempat Tidur <br> Terkunci</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rr2 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">3. Pastikan Bel Pasien <br> Terjangkau</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rr3 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">4. Singkirkan Barang Yang <br> Berbahaya Terutama Pada <br> Malam Hari (Kursi Tambahan <br> Dll)</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rr4 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">5. Minta Persetujuan Pasien <br> Agar Lampu Malam Tetap <br> Menyala Karena Lingkungan <br> Masih Asing</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rr5 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">6. Pastikan Alat Bantu Jalan <br> Dalam Jangkauan (Bila <br> Menggunakan) </td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rr6 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">7. Pastikan Alat Kaki Tidak Licin</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rr7 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">8. Pastikan Kebutuhan Pribadi <br> Dalam Jangkauan</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rr8 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">9. Tempatkan Meja Pasien <br> Dengan Baik Agar Tidak <br> Menghalangi</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rr9 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r border-b" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">10. Tempatkan Pasien Sesuai <br> Dengan Tinggi Badannya</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rr10 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r border-t" align="center"><b>Resiko Jatuh Tinggi</b></td>
			  			<td class="border-l border-r border-b">1. Pasang Gelang Kuning Dan <br> Penanda/Simbol Resiko <br> Jatuh Di Luar Kamar</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rt1 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b>(Protokol 1,2)</b></td>
			  			<td class="border-l border-r border-b">2. Menjelaskan Kepada Pasien <br> Dan Keluarga Kemungkinan <br> Resiko Jatuh Dan Tindakan <br> Pencegahan Resiko Jatuh</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rt2 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">3. Minta Agar Pasien Segera <br> Memencet Bel Bila Perlu <br> Bantuan</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rt3 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">4. Awasi Atau Bantu Sebagian <br> ADL Pasien</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rt4 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">5. Cepat Menanggapi Bel</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rt5 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">6. Review Kembali Obat-<br>Obatan Yang Beresiko </td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rt6 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">7. Beritahu Pasien Agar <br> Mobilisasi Secara Bertahan <br> Duduk Perlahan Sebelum <br> Berdiri</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rt7 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r border-b" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">8. Pasang Penanda Resiko <br> Jatuh Di Luar Kamar</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rt8 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r border-t" align="center"><b>Resiko Jatuh Sangat Tinggi</b></td>
			  			<td class="border-l border-r border-b">1. Kaji Kebutuhan BAB/BAK <br> Secara Teratur Setiap 2-3 Jam</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rst1 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b>(Resiko Rendah)</b></td>
			  			<td class="border-l border-r border-b">2. Kolaborasi Dengan <br> Fisioterapi/Case Manager</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rst2 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">3. Bila Memungkinkan <br> Pindahkan Pasien Dekat <br> Nurse Station</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rst3 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">4. Kaji Kebutuhan Dengan <br> Menggunakan Pagar Tempat <br> Tidur</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rst4 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border-r">
			  			<td class="border-l border-r border-b" align="center"><b></b></td>
			  			<td class="border-l border-r border-b">5. Orientasi Ulang Bila Perlu</td>
			  			<td align="center" class="border-b" v-for="(post, index) in posts" :key="index"><p v-if="post.std_rst5 === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border">
			  			<td align="center"><b>Evaluasi</b></td>
			  			<td class="border">Apakah Terjadi Insiden Jatuh?</td>
			  			<td class="border" align="center" v-for="(post, index) in posts" :key="index"><p v-if="post.evaluasi === 1"><span>	&#10003;</span></p></td>
			  		</tr>
			  		<tr class="border">
			  			<td colspan="2" class="border"><b>Paraf/Nama Petugas</b></td>
			  			<td class="border" align="center" v-for="(post, index) in posts" :key="index"></td>
			  		</tr>
			  	</table>
			  </div>
		  </div>
		</div>
	</div>
</template>

<script>
import BtnWithIcon from '../components/global/BtnWithIcon.vue';
import BtnIcon from '../components/global/BtnIcon.vue';
import TableComp from '../components/global/TableComp.vue';
import axios from 'axios';
import { onMounted, ref } from 'vue';
import moment from 'moment';
import { PencilIcon, TrashIcon, ArrowLongDownIcon, ChevronUpDownIcon } from '@heroicons/vue/24/outline'
export default {
	setup() {

      //reactive state
      let posts = ref([])

      //mounted
      onMounted(() => {

          //get API from Laravel Backend
          axios.get('http://localhost:8000/api/tindakan/data')
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
				   axios.get(`http://localhost:8000/api/tindakan/delete/${id}`)
				   .then(() => {
				              
				       //splice posts 
				       router.push({
                name: 'tindakan'
            	 })

				    }).catch(error => {
				        console.log("Error Hapus")
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
    TrashIcon
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