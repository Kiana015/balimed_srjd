<template>
  <div>
    <iframe
      v-if="url"
      id="resep-iframe"
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
      iFrameEl: null,
      iframeHeight: 1000
    }
  },
  computed: {
    pasienAktif () {
      return JSON.parse('{"id":43,"pasien_id":5,"no_rm":"202200000004","nomor_registrasi":"RG00000043","nomor_antrian":"1","status_antrian":5,"status_antrian_ugd":2,"mulai_layan_poli":"2022-12-20 14:59:16","nama_depan":"Gunaya","nama_belakang":"Wayan","nama":"Gunaya Wayan","tempat_lahir":"Batur Tengah","tanggal_lahir":"1998-12-06","dokter_id":1,"subunit_id":30,"kode_subunit":"U01","nama_subunit":"UGD","nama_dokter":"Gunaya","penjamin_id":2,"nama_penjamin":"BPJS\/JKN","jenis_kelamin":"Laki","nomor_bed":"","tanggal_masuk":"2022-12-22 00:52:00"}')
    },
    urlRajal () {
      return this.$store.state.setupUnit.setupUnit.url_rajal
    },
    url () {
      return `${this.urlRajal}/build/spa/form/resep`
    }
  },
  watch: {
    pasienAktif () {
      this.setPasienToIFrame()
    }
  },
  mounted () {
    this.iFrameEl = document.getElementById('resep-iframe')
    setTimeout(() => {
      this.setPasienToIFrame()
    }, 1000)
  },
  methods: {
    setPasienToIFrame () {
      this.sendDataToIframe({
        pasien: this.pasienAktif
      })
    },
    sendDataToIframe (message) {
      if (!this.iFrameEl) {
        return false
      }
      const dataMessage = JSON.stringify({
        data: message
      })
      this.iFrameEl.contentWindow.postMessage(dataMessage, '*')
      // document.getElementById('resep-iframe').contentWindow.postMessage(dataMessage, '*')
      // console.log(dataMessage, 'sudah')
    },
    setIframeHeight () {
      if (!this.iFrameEl) {
        return false
      }
      const height = this.iFrameEl.contentWindow.document.body.scrollHeight
      this.iframeHeight = height
    }
  }
}
</script>