<template>
	<div class="pt-8 columns-1">
		<div class="max-w-l rounded overflow-hidden shadow-lg" style="background: #ffffff">
		  <div class="px-6 py-4">
		    <div class="font-bold text-xl mb-2" >Edit Skala Resiko Jatuh</div>
		  </div>
	  	<form class="rounded px-8 pt-6 pb-8 mb-4" @submit.prevent="store">
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
        <div class="grid grid-cols-1">
          <div class="mb-4 pr-2">
            <div class="flex w-full">
              <span
                  class="inline-flex items-center px-3 ml-2 text-xs text-white bg-black border border-r-0 border-black rounded-l-md dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600 w-32">
                  Usia
              </span>
              <select class="t-form-group t-form" v-model="post.usia_pilihan">
                <option value="1">Di Bawah 60 Tahun </option>
                <option value="2">Di Atas 60 Tahun</option>
                <option value="3">Di Atas 80 Tahun</option>
              </select>
            </div>
          </div>
          <div class="mb-4 pr-2">
            <div class="flex w-full">
              <span
                  class="inline-flex items-center px-3 ml-2 text-xs text-white bg-black border border-r-0 border-black rounded-l-md dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600 w-32">
                  Defisit Sensoris
              </span>
              <select class="t-form-group t-form" v-model="post.defisit_sensoris_pilihan">
                <option value="1">Kacamata Bukan Bifocal</option>
                <option value="2">Kacamata Bifocal</option>
                <option value="3">Gangguan Pendengaran</option>
                <option value="4">Kacamata Multidiocal</option>
                <option value="5">Katarak</option>
                <option value="6">Hampir Tidak Melihat</option>
              </select>
            </div>
          </div>
          <div class="mb-4 pr-2">
            <div class="flex w-full">
              <span
                  class="inline-flex items-center px-3 ml-2 text-xs text-white bg-black border border-r-0 border-black rounded-l-md dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600 w-32">
                  Aktivitas
              </span>
              <select class="t-form-group t-form" v-model="post.aktivitas_pilihan">
                <option value="1">Mandiri</option>
                <option value="2">ADL Dibantu Sebagian</option>
                <option value="3">ADL Dibantu Penuh</option>
              </select>
            </div>
          </div>
          <div class="mb-4 pr-2">
            <div class="flex w-full">
              <span
                  class="inline-flex items-center px-3 ml-2 text-xs text-white bg-black border border-r-0 border-black rounded-l-md dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600 w-32">
                  Riwayat Jatuh
              </span>
              <select class="t-form-group t-form" v-model="post.riwayat_jatuh_pilihan">
                <option value="1">Tidak Pernah</option>
                <option value="2">Jatuh Kurang Dari 1 Tahun</option>
                <option value="3">Jatuh Kurang Dari 1 Bulan</option>
                <option value="4">Jatuh Pada Saat Dirawat Sekarang</option>
              </select>
            </div>
          </div>
          <div class="mb-4 pr-2">
            <div class="flex w-full">
              <span
                  class="inline-flex items-center px-3 ml-2 text-xs text-white bg-black border border-r-0 border-black rounded-l-md dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600 w-32">
                  Kognisi
              </span>
              <select class="t-form-group t-form" v-model="post.kognisi_pilihan">
                <option value="1">Orientasi Baik</option>
                <option value="2">Kesulitan Mengerti Perintah</option>
                <option value="3">Gangguan Memori</option>
                <option value="4">Kebingungan</option>
                <option value="5">Disorientasi</option>
              </select>
            </div>
          </div>
        </div>
        <div class="grid grid-cols-1">
          <div class="mb-4 pr-2">
            <div class="flex w-full">
              <span
                  class="inline-flex items-center px-3 ml-2 text-xs text-white bg-black border border-r-0 border-black rounded-l-md dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600 w-32">
                  Pengobatan
              </span>
              <select class="t-form-group t-form" v-model="post.pengobatan_pilihan">
                <option value="1">Lebih Dari 4 Jenis Pengobatan</option>
                <option value="2">Kesulitan Mengerti Perintah</option>
                <option value="3">Gangguan Memori</option>
                <option value="4">Kebingungan</option>
                <option value="5">Disorientasi</option>
              </select>
            </div>
          </div>
          <div class="mb-4 pr-2">
            <div class="flex w-full">
              <span
                  class="inline-flex items-center px-3 ml-2 text-xs text-white bg-black border border-r-0 border-black rounded-l-md dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600 w-32">
                  Mobilitas
              </span>
              <select class="t-form-group t-form" v-model="post.mobilitas_pilihan">
                <option value="1">Mandiri</option>
                <option value="2">Menggunakan Alat Bantu Berpindah</option>
                <option value="3">Koordinasi Keseimbangan Buruk</option>
                <option value="4">Dibantu Sebagian</option>
                <option value="5">Dibantu Penuh/Bed Rest/Nurse Assist</option>
              </select>
            </div>
          </div>
          <div class="mb-4 pr-2">
            <div class="flex w-full">
              <span
                  class="inline-flex items-center px-3 ml-2 text-xs text-white bg-black border border-r-0 border-black rounded-l-md dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600 w-32">
                  Pola BAB/BAK
              </span>
              <select class="t-form-group t-form" v-model="post.pola_bab_bak_pilihan">
                <option value="1">Teratur</option>
                <option value="2">Inkoetinensia Urine/Feses</option>
                <option value="3">Nokturia</option>
                <option value="4">Urgensi/Frekuensi</option>
              </select>
            </div>
          </div>
          <div class="mb-4 pr-2">
            <div class="flex w-full">
              <span
                  class="inline-flex items-center px-3 ml-2 text-xs text-white bg-black border border-r-0 border-black rounded-l-md dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600 w-32">
                  Komorbiditas
              </span>
              <select class="t-form-group t-form" v-model="post.komorbiditas_pilihan">
                <option value="1">Diabetes/Penyakit Jantung/Stroke/ISK, Dll</option>
                <option value="2">Gangguan Saraf Pusat/Parkinson</option>
                <option value="3">Pasca Bedah 0-24 Jam</option>
              </select>
            </div>
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
                title="Edit Skala"
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
export default {
  setup() {
    const router = useRouter()
    const route = useRoute()
    const validation = ref([])
    
    const post = reactive({
      id: '',
      usia_pilihan: '',
      defisit_sensoris_pilihan: '',
      aktivitas_pilihan: '',
      riwayat_jatuh_pilihan: '',
      kognisi_pilihan: '',
      pengobatan_pilihan: '',
      mobilitas_pilihan: '',
      pola_bab_bak_pilihan: '',
      komorbiditas_pilihan: '',
      keterangan: '',
      tanggal: '',
      jam: 'ssss',
    })
    let posts = ref([])

    onMounted(() => {
          //get API from Laravel Backend
          axios.get(`http://localhost:8000/api/rjd/data/${route.params.id}`)
          .then(response => {
            //assign state posts with response data
            post.id = response.data.data[0].id
            post.usia_pilihan = response.data.data[0].usia_pilihan
            post.defisit_sensoris_pilihan = response.data.data[0].defisit_sensoris_pilihan
            post.aktivitas_pilihan = response.data.data[0].aktivitas_pilihan
            post.riwayat_jatuh_pilihan = response.data.data[0].riwayat_jatuh_pilihan
            post.kognisi_pilihan = response.data.data[0].kognisi_pilihan
            post.pengobatan_pilihan = response.data.data[0].pengobatan_pilihan
            post.mobilitas_pilihan = response.data.data[0].mobilitas_pilihan
            post.pola_bab_bak_pilihan = response.data.data[0].pola_bab_bak_pilihan
            post.komorbiditas_pilihan = response.data.data[0].komorbiditas_pilihan
            post.keterangan = response.data.data[0].keterangan
            post.tanggal = response.data.data[0].tanggal
            post.jam = response.data.data[0].jam
            console.log(response.data.data[0].keterangan)

          }).catch(error => {
              console.log("No Data")
          })
    })

    //method store
    function store() {
      let id = post.id
      let usia = post.usia_pilihan
      let defisit = post.defisit_sensoris_pilihan
      let aktivitas = post.aktivitas_pilihan
      let riwayat_jatuh = post.riwayat_jatuh_pilihan
      let kognisi = post.kognisi_pilihan
      let pengobatan = post.pengobatan_pilihan
      let mobilitas = post.mobilitas_pilihan
      let pola = post.pola_bab_bak_pilihan
      let komo = post.komorbiditas_pilihan
      let ket = post.keterangan
      axios.post('http://localhost:8000/api/rjd/data/'+id, {
          usia_pilihan : usia,
          defisit_sensoris_pilihan : defisit,
          aktivitas_pilihan : aktivitas,
          riwayat_jatuh_pilihan : riwayat_jatuh,
          kognisi_pilihan : kognisi,
          pengobatan_pilihan : pengobatan,
          mobilitas_pilihan : mobilitas,
          pola_bab_bak_pilihan : pola,
          komorbiditas_pilihan : komo,
          keterangan : ket,
          tanggal: post.tanggal,
          jam: post.jam
        }).then(() => {
            //redirect ke post index
            router.push({
                name: 'skj'
            })

        }).catch(error => {
            //assign state validation with error 
            validation.value = error.response.data
        })
    }

    //return
    return {
        post,
        validation,
        router,
        store
    }
  },
	components:{
    BtnWithIcon
  }
}
</script>