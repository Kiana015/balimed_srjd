<template>
  <div class="mt-4">
    <FormTriage
      ref="FormTriage"
      :pasien="pasienAktif"
      :disabled-form="disabledFormTriage"
    />
  </div>
</template>

<script>
import FormTriage from './../components/form/FormTriage.vue'
export default {
  components: {
    FormTriage
  },
  computed: {
    pasienAktif () {
      return JSON.parse('{"id":43,"pasien_id":5,"no_rm":"202200000004","nomor_registrasi":"RG00000043","nomor_antrian":"1","status_antrian":5,"status_antrian_ugd":2,"mulai_layan_poli":"2022-12-20 14:59:16","nama_depan":"Gunaya","nama_belakang":"Wayan","nama":"Gunaya Wayan","tempat_lahir":"Batur Tengah","tanggal_lahir":"1998-12-06","dokter_id":1,"subunit_id":30,"kode_subunit":"U01","nama_subunit":"UGD","nama_dokter":"Gunaya","penjamin_id":2,"nama_penjamin":"BPJS\/JKN","jenis_kelamin":"Laki","nomor_bed":"","tanggal_masuk":"2022-12-22 00:52:00"}')
    },
    disabledFormTriage () {
      return false
    }
  },
  watch: {
    pasienAktif () {
      this.changeData()
    }
  },
  methods: {
    changeData () {
      setTimeout(() => {
        this.$refs.FormTriage.showData()
      }, 500)
    }
  }
}
</script>