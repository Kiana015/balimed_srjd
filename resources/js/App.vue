<template>
  <!-- ketika sudah ready, dan pakai layout admin -->
  <LayoutsAdmin v-if="ready && isLayout">
    <router-view />
  </LayoutsAdmin>

  <!-- ketika sudah ready, dan tidak pakai layout admin -->
  <template v-else-if="ready && !isLayout">
    <router-view />
  </template>

  <!-- ketika belum ready, loading -->
  <template v-else-if="!ready">
    <div
      class="
        fixed
        top-0
        left-0
        z-30
        h-screen
        w-full
      "
      style="background: rgba(255, 255, 255, .5)"
    >
      <div class="spinner-container" style="margin-top: 30%">
        <div class="spinner" />
      </div>
    </div>
  </template>
</template>

<script>
import LayoutsAdmin from './layouts/admin.vue'
export default {
  components: {
    LayoutsAdmin
  },
  data () {
    return {
      ready: false,
      withoutLayout: [
        'not-found'
      ],
    }
  },
  computed: {
    currentUrl () {
      return this.$route.name
    },
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
    },
    isLayout () {
      return !this.withoutLayout.includes(this.currentUrl)
    }
  },
  mounted () {
    this.loadUser()
  },
  methods: {
    /**
     * Disini taruh saja fungsi lain yang membutuhkan data sebelum aplikasi tampil
     * Misal data user
     */
    async loadUser () {
      this.ready = false
      const resUser = await this.$store.dispatch('fetchUser')
      if (resUser.data.status) {
        this.$store.commit('SET_USER', resUser.data.data)
      } else {
        alert(resUser.data.message)
      }
      
      /**
       * Load setup unit
       * Karena dipakai di beberapa tempat
       */
      if (this.isLayout) {
        const resSetupUnit = await this.$store.dispatch('fetchSetupUnit')
        if (resSetupUnit.data.status) {
          this.$store.commit('SET_SETUP_UNIT', resSetupUnit.data.data[0])
        } else {
          //
        }
      }
      this.ready = true
    }
  }
}
</script>