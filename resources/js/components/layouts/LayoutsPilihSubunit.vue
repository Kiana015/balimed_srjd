<template>
  <div
    v-if="permission.map(e => e.perm_id).includes(204)"
    class="hidden sm:grid sm:grid-cols-2 sm:gap-4"
  >
    <v-select
      :options="dataSubunit"
      label="nama_subunit"
      v-model="subunitSelected"
      :clearable="false"
      :loading="loadingSubunit"
    />
  </div>
</template>

<script>
export default {
  data () {
    return {
      loadingSubunit: false,
      dataSubunit: [],
      subunitSelected: {
        id: 0,
        kode_subunit: '0',
        nama_subunit: 'Pilih Subunit'
      },
      dokterSelected: {
        id: 0,
        nama: 'Pilih Dokter'
      },
      dataDokter: [],
      loadingDokter: false
    }
  },
  computed: {
    currentRole () {
      const user = this.$store.state.auth.user
      if ('user' in user) {
        return user.active_role.ability
      }
      return null
    },
    permission () {
      const user = this.$store.state.auth.user
      if ('user' in user) {
        return user.permission
      }
      return []
    }
  },
  watch: {
    subunitSelected (newVal) {
      if ('id' in newVal && newVal.id !== 0) {
        localStorage.setItem('subunitSelected', JSON.stringify(newVal))
        this.loadDataDokter()
      }
    }
  },
  mounted () {
    this.loadDataSubunit()
  },
  methods: {
    loadDataSubunit () {
      this.loadingSubunit = true
      const newdataSubunit = [{
        kode_subunit: '0',
        nama_subunit: 'Pilih Subunit'
      }]
      this.dataSubunit = []
      axios.get('/api/master/subunit-rawat-inap').then((res) => {
        this.loadingSubunit = false
        if (res.data.status) {
          this.dataSubunit = [...newdataSubunit, ...res.data.data]
          this.$store.commit('SET_DATA_SUBUNIT', res.data.data)
          if (localStorage.subunitSelected) {
            this.subunitSelected = JSON.parse(localStorage.subunitSelected)
          }
        } else {
          alert(res.data.message)
        }
      })
        .catch(() => {
          this.loadingSubunit = false
          alert('error')
        })
    }
  }
}
</script>