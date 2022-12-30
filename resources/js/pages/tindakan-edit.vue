<template>
	<div class="pt-8 columns-1">
		<div class="max-w-l rounded overflow-hidden shadow-lg" style="background: #ffffff">
		  <div class="px-6 py-4">
		    <div class="font-bold text-xl mb-2">Edit Tindakan Resiko Jatuh</div>
		  </div>
	  	<form class="rounded px-8 pt-6 pb-8 mb-4" @submit.prevent="store">
        <div class="grid grid-cols-1">
          <div class="mb-4 pr-2">
            <div class="flex w-full">
              <span
                  class="inline-flex items-center px-3 ml-2 text-xs text-white bg-black border border-r-0 border-black rounded-l-md dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">
                  Data Skala
              </span>
              <select class="t-form-group t-form" v-model="post.tri_resiko_jatuh_dewasa_id">
                <option v-for="(x,index) in posts" :key="index" :value="x.id">{{ format_date(x.tanggal) }} - {{x.jam}}</option>
              </select>
            </div>
          </div>
        </div>
        <div class="grid grid-cols-2">
          <div class="mb-4 pr-2">
            <div class="flex w-full">
              <span
                  class="inline-flex items-center px-3 ml-2 text-xs text-white bg-black border border-r-0 border-black rounded-l-md dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">
                  Tanggal
              </span>
              <input class="t-form-group t-form" type="date" v-model="post.tanggal">
            </div>
          </div>
          <div class="mb-4 pr-2">
            <div class="flex w-full">
              <span
                  class="inline-flex items-center px-3 ml-2 text-xs text-white bg-black border border-r-0 border-black rounded-l-md dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">
                  Jam
              </span>
              <input class="t-form-group t-form" type="time" v-model="post.jam">
            </div>
          </div>
        </div>
        <div class="mb-4 pl-2 pr-2">
          <div class="overflow-x-auto">
            <table class="min-w-full border">
              <tr class="border">
                <td colspan="2"><b>Skala (1) (Resiko Rendah)</b></td>
              </tr>
              <tr class="border">
                <td>1. Orientasi Pasien Pada <br> Lingkungan Kamar / Bangsal</td>
                <td><input type="checkbox" v-model="post.std_rr1"></td>
              </tr>
              <tr class="border">
                <td>2. Pastikan Rem Tempat Tidur <br> Terkunci</td>
                <td><input type="checkbox" v-model="post.std_rr2"></td>
              </tr>
              <tr class="border">
                <td>3. Pastikan Bel Pasien <br> Terjangkau</td>
                <td><input type="checkbox" v-model="post.std_rr3"></td>
              </tr>
              <tr class="border">
                <td>4. Singkirkan Barang Yang <br> Berbahaya Terutama Pada <br> Malam Hari (Kursi Tambahan <br> Dll)</td>
                <td><input type="checkbox" v-model="post.std_rr4"></td>
              </tr>
              <tr class="border">
                <td>5. Minta Persetujuan Pasien <br> Agar Lampu Malam Tetap <br> Menyala Karena Lingkungan <br> Masih Asing</td>
                <td><input type="checkbox" v-model="post.std_rr5"></td>
              </tr>
              <tr class="border">
                <td>6. Pastikan Alat Bantu Jalan <br> Dalam Jangkauan (Bila <br> Menggunakan) </td>
                <td><input type="checkbox" v-model="post.std_rr6"></td>
              </tr>
              <tr class="border">
                <td>7. Pastikan Alat Kaki Tidak Licin</td>
                <td><input type="checkbox" v-model="post.std_rr7"></td>
              </tr>
              <tr class="border">
                <td>8. Pastikan Kebutuhan Pribadi <br> Dalam Jangkauan</td>
                <td><input type="checkbox" v-model="post.std_rr8"></td>
              </tr>
              <tr class="border">
                <td>9. Tempatkan Meja Pasien <br> Dengan Baik Agar Tidak <br> Menghalangi</td>
                <td><input type="checkbox" v-model="post.std_rr9"></td>
              </tr>
              <tr class="border">
                <td>10. Tempatkan Pasien Sesuai <br> Dengan Tinggi Badannya</td>
                <td><input type="checkbox" v-model="post.std_rr10"></td>
              </tr>
              <tr>
                <td colspan="2"><b>Skala Resiko Jatuh Tinggi (2) (Protokol 1,2)</b></td>
              </tr>
              <tr class="border">
                <td>1. Pasang Gelang Kuning Dan <br> Penanda/Simbol Resiko <br> Jatuh Di Luar Kamar</td>
                <td><input type="checkbox" v-model="post.std_rt1"></td>
              </tr>
              <tr class="border">
                <td>2. Menjelaskan Kepada Pasien <br> Dan Keluarga Kemungkinan <br> Resiko Jatuh Dan Tindakan <br> Pencegahan Resiko Jatuh</td>
                <td><input type="checkbox" v-model="post.std_rt2"></td>
              </tr>
              <tr class="border">
                <td>3. Minta Agar Pasien Segera <br> Memencet Bel Bila Perlu <br> Bantuan</td>
                <td><input type="checkbox" v-model="post.std_rt3"></td>
              </tr>
              <tr class="border">
                <td>4. Awasi Atau Bantu Sebagian <br> ADL Pasien</td>
                <td><input type="checkbox" v-model="post.std_rt4"></td>
              </tr>
              <tr class="border">
                <td>5. Cepat Menanggapi Bel</td>
                <td><input type="checkbox" v-model="post.std_rt5"></td>
              </tr>
              <tr class="border">
                <td>6. Review Kembali Obat-<br>Obatan Yang Beresiko </td>
                <td><input type="checkbox" v-model="post.std_rt6"></td>
              </tr>
              <tr class="border">
                <td>7. Beritahu Pasien Agar <br> Mobilisasi Secara Bertahan <br> Duduk Perlahan Sebelum <br> Berdiri</td>
                <td><input type="checkbox" v-model="post.std_rt7"></td>
              </tr>
              <tr class="border">
                <td>8. Pasang Penanda Resiko <br> Jatuh Di Luar Kamar</td>
                <td><input type="checkbox" v-model="post.std_rt8"></td>
              </tr>
              <tr>
                <td colspan="2"><b>Skala Resiko Jatuh Sangat Tinggi (Protokol 1,2,3)</b></td>
              </tr>
              <tr class="border">
                <td>1. Kaji Kebutuhan BAB/BAK <br> Secara Teratur Setiap 2-3 Jam</td>
                <td><input type="checkbox" v-model="post.std_rst1"></td>
              </tr>
              <tr class="border">
                <td>2. Kolaborasi Dengan <br> Fisioterapi/Case Manager</td>
                <td><input type="checkbox" v-model="post.std_rst2"></td>
              </tr>
              <tr class="border">
                <td>3. Bila Memungkinkan <br> Pindahkan Pasien Dekat <br> Nurse Station</td>
                <td><input type="checkbox" v-model="post.std_rst3"></td>
              </tr>
              <tr class="border">
                <td>4. Kaji Kebutuhan Dengan <br> Menggunakan Pagar Tempat <br> Tidur</td>
                <td><input type="checkbox" v-model="post.std_rst4"></td>
              </tr>
              <tr class="border">
                <td>5. Orientasi Ulang Bila Perlu</td>
                <td><input type="checkbox" v-model="post.std_rst5"></td>
              </tr>
              <tr class="border">
                <td><b>Apakah Terjadi Insiden Jatuh?</b></td>
                <td><input type="checkbox" v-model="post.evaluasi"></td>
              </tr>
            </table>
          </div>
        </div>
        <div class="mb-4 pr-2">
          <div class="flex w-full">
            <span
                class="inline-flex items-center px-3 ml-2 text-xs text-white bg-black border border-r-0 border-black rounded-l-md dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600 w-32">
                Keterangan
            </span>
            <input type="text" class="t-form-group t-form" v-model="post.keterangan">                
          </div>
        </div>
        <div class="grid grid-cols-1">
          <div class="mb-4">
            <BtnWithIcon
                icon="PencilIcon"
                color="green"
                title="Edit Tindakan"
                icon-size="sm"
                type="submit"
                class="mb-4 float-right">
                Edit
            </BtnWithIcon>
          </div>
          <div class="mb-4">
          </div>
        </div>
      </form>
		</div>
	</div>
</template>

<script>
import BtnWithIcon from '../components/global/BtnWithIcon.vue';
import BtnIcon from '../components/global/BtnIcon.vue';
import TableComp from '../components/global/TableComp.vue';
import axios from 'axios';
import { reactive, ref, onMounted } from 'vue';
import { useRouter, useRoute } from 'vue-router'
import moment from 'moment';
export default {
  setup() {
    //vue router
    let posts = ref([])
    const router = useRouter()
    const route = useRoute()
    const validation = ref([])
    let idd = `${route.params.id}`
    const post = reactive({
      id: '',
      tanggal : '',
      jam: '',
      tri_resiko_jatuh_dewasa_id: '',
      std_rr1: '',
      std_rr2: '',
      std_rr3: '',
      std_rr4: '',
      std_rr5: '',
      std_rr6: '',
      std_rr7: '',
      std_rr8: '',
      std_rr9: '',
      std_rr10: '',
      std_rt1: '',
      std_rt2: '',
      std_rt3: '',
      std_rt4: '',
      std_rt5: '',
      std_rt6: '',
      std_rt7: '',
      std_rt8: '',
      std_rst1: '',
      std_rst2: '',
      std_rst3: '',
      std_rst4: '',
      std_rst5: '',
      evaluasi: '',
      keterangan: ''
    })
    onMounted(() => {

          //get API from Laravel Backend
          axios.get('http://localhost:8000/api/rjd/data/')
          .then(response => {
            
            //assign state posts with response data
            posts.value = response.data.data

          }).catch(error => {
              console.log(error.response.data)
          })

          axios.get(`http://localhost:8000/api/tindakan/data/${route.params.id}`)
          .then(response => {
            post.id = response.data.data[0].id
            post.tanggal = response.data.data[0].tanggal
            post.jam = response.data.data[0].jam
            post.tri_resiko_jatuh_dewasa_id = response.data.data[0].tri_resiko_jatuh_dewasa_id
            if(response.data.data[0].std_rr1 === 1)
            {
              post.std_rr1 = true
            }
            else
            {
              post.std_rr1 = false
            }
            if(response.data.data[0].std_rr2 === 1)
            {
              post.std_rr2 = true
            }
            else
            {
              post.std_rr2 = false
            }
            if(response.data.data[0].std_rr3 === 1)
            {
              post.std_rr3 = true
            }
            else
            {
              post.std_rr3 = false
            }
            if(response.data.data[0].std_rr4 === 1)
            {
              post.std_rr4 = true
            }
            else
            {
              post.std_rr4 = false
            }
            if(response.data.data[0].std_rr5 === 1)
            {
              post.std_rr5 = true
            }
            else
            {
              post.std_rr5 = false
            }
            if(response.data.data[0].std_rr6 === 1)
            {
              post.std_rr6 = true
            }
            else
            {
              post.std_rr6 = false
            }
            if(response.data.data[0].std_rr7 === 1)
            {
              post.std_rr7 = true
            }
            else
            {
              post.std_rr7 = false
            }
            if(response.data.data[0].std_rr8 === 1)
            {
              post.std_rr8 = true
            }
            else
            {
              post.std_rr8 = false
            }
            if(response.data.data[0].std_rr9 === 1)
            {
              post.std_rr9 = true
            }
            else
            {
              post.std_rr9 = false
            }
            if(response.data.data[0].std_rr10 === 1)
            {
              post.std_rr10 = true
            }
            else
            {
              post.std_rr10 = false
            }
            if(response.data.data[0].std_rt1 === 1)
            {
              post.std_rt1 = true
            }
            else
            {
              post.std_rt1 = false
            }
            if(response.data.data[0].std_rt2 === 1)
            {
              post.std_rt2 = true
            }
            else
            {
              post.std_rt2 = false
            }
            if(response.data.data[0].std_rt3 === 1)
            {
              post.std_rt3 = true
            }
            else
            {
              post.std_rt3 = false
            }
            if(response.data.data[0].std_rt4 === 1)
            {
              post.std_rt4 = true
            }
            else
            {
              post.std_rt4 = false
            }
            if(response.data.data[0].std_rt5 === 1)
            {
              post.std_rt5 = true
            }
            else
            {
              post.std_rt5 = false
            }
            if(response.data.data[0].std_rt6 === 1)
            {
              post.std_rt6 = true
            }
            else
            {
              post.std_rt6 = false
            }
            if(response.data.data[0].std_rt7 === 1)
            {
              post.std_rt7 = true
            }
            else
            {
              post.std_rt7 = false
            }
            if(response.data.data[0].std_rt8 === 1)
            {
              post.std_rt8 = true
            }
            else
            {
              post.std_rt8 = false
            }
            if(response.data.data[0].std_rst1 === 1)
            {
              post.std_rst1 = true
            }
            else
            {
              post.std_rst1 = false
            }
            if(response.data.data[0].std_rst2 === 1)
            {
              post.std_rst2 = true
            }
            else
            {
              post.std_rst2 = false
            }
            if(response.data.data[0].std_rst3 === 1)
            {
              post.std_rst3 = true
            }
            else
            {
              post.std_rst3 = false
            }
            if(response.data.data[0].std_rst4 === 1)
            {
              post.std_rst4 = true
            }
            else
            {
              post.std_rst4 = false
            }
            if(response.data.data[0].std_rst5 === 1)
            {
              post.std_rst5 = true
            }
            else
            {
              post.std_rst5 = false
            }
            if(response.data.data[0].evaluasi === 1)
            {
              post.evaluasi = true
            }
            else
            {
              post.evaluasi = false
            }
            post.evaluasi = response.data.data[0].evaluasi
            post.keterangan = response.data.data[0].keterangan
            console.log("OK")

          }).catch(error => {
              console.log(`http://localhost:8000/api/tindakan/data/${route.params.id}`)
          })

      })

    //method store
    function store() {
      axios.post(`http://localhost:8000/api/tindakan/data/${route.params.id}`, {
          tanggal : post.tanggal,
          jam: post.jam,
          tri_resiko_jatuh_dewasa_id: post.tri_resiko_jatuh_dewasa_id,
          std_rr1: post.std_rr1,
          std_rr2: post.std_rr2,
          std_rr3: post.std_rr3,
          std_rr4: post.std_rr4,
          std_rr5: post.std_rr5,
          std_rr6: post.std_rr6,
          std_rr7: post.std_rr7,
          std_rr8: post.std_rr8,
          std_rr9: post.std_rr9,
          std_rr10: post.std_rr10,
          std_rt1: post.std_rt1,
          std_rt2: post.std_rt2,
          std_rt3: post.std_rt3,
          std_rt4: post.std_rt4,
          std_rt5: post.std_rt5,
          std_rt6: post.std_rt6,
          std_rt7: post.std_rt7,
          std_rt8: post.std_rt8,
          std_rst1: post.std_rst1,
          std_rst2: post.std_rst2,
          std_rst3: post.std_rst3,
          std_rst4: post.std_rst4,
          std_rst5: post.std_rst5,
          evaluasi: post.evaluasi,
          keterangan: post.keterangan
        }).then(() => {
            //redirect ke post index
            router.push({
                name: 'tindakan'
            })

        }).catch(error => {
            //assign state validation with error 
            validation.value = error.response.data
        })
    }

    //return
    return {
        post,
        posts,
        validation,
        router,
        store
    }
  },
	components:{
    BtnWithIcon
  },
  methods: { 
      format_date(value){
         if (value) {
           return moment(String(value)).format('DD-MM-YY')
          }
      },
  },
}
</script>