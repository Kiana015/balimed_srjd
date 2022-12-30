<template>
  <div>
    <iframe
      v-if="url"
      id="booking-iframe"
      :src="url"
      class="w-full"
      :style="`height: ${iframeHeight}px`"
      scrolling="no"
    />
    <div class="w-full text-center">
      <button
        class="
          bg-brand-500
          text-white
          rounded-full
        "
        @click="iframeHeight -= 100"
      >
        <ChevronUpIcon class="w-5 h-5" />
      </button>
      <br />
      <button
        class="
          bg-brand-500
          text-white
          rounded-full
        "
        @click="iframeHeight += 100"
      >
        <ChevronDownIcon class="w-5 h-5" />
      </button>
    </div>
  </div>
</template>

<script>
import { ChevronDownIcon, ChevronUpIcon } from '@heroicons/vue/20/solid'
export default {
  components: {
    ChevronDownIcon, ChevronUpIcon
  },
  data () {
    return {
      iframeHeight: 1000
    }
  },
  computed: {
    pasienAktif () {
      return JSON.parse('{"id":43,"pasien_id":5,"no_rm":"202200000004","nomor_registrasi":"RG00000043","nomor_antrian":"1","status_antrian":5,"status_antrian_ugd":2,"mulai_layan_poli":"2022-12-20 14:59:16","nama_depan":"Gunaya","nama_belakang":"Wayan","nama":"Gunaya Wayan","tempat_lahir":"Batur Tengah","tanggal_lahir":"1998-12-06","dokter_id":1,"subunit_id":30,"kode_subunit":"U01","nama_subunit":"UGD","nama_dokter":"Gunaya","penjamin_id":2,"nama_penjamin":"BPJS\/JKN","jenis_kelamin":"Laki","nomor_bed":"","tanggal_masuk":"2022-12-22 00:52:00"}')
    },
    urlBooking () {
      return this.$store.state.setupUnit.setupUnit.url_booking
    },
    url () {
      return `${this.urlBooking}/build/spa/booking/laboratorium/form?layanan_id=${this.pasienAktif.id}`
    }
  },
  methods: {
    onSubmit (e) {
      e.preventDefault()
      this.url = document.getElementById('data-url').value
    },
    setIframeHeight () {
      const height = document.getElementById('booking-iframe').contentWindow.document.body.scrollHeight
      console.log(height)
      this.iframeHeight = height
    }
  },
  mounted () {

  }
}
</script>