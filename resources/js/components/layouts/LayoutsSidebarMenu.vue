<template>
  <div>
    <aside
      :class="`
      ${showSidebar ? 'fixed' : 'hidden'}
      z-30
      top-0
      h-screen
      w-80
        bg-white
        dark:bg-gray-800
        border-r
        border-gray-200
        dark:border-gray-700
        overflow-auto
        pb-8
      `"
    >
      <!-- logo -->
      <div class="py-4 px-8 border-b dark:border-gray-700">
        <RouterLink to="/spa/home">
          <img
            src="./../../../img/logo-balimed.png"
            alt="Balimed"
            class="h-10"
          >
        </RouterLink>
      </div>
      <div class="p-4">
        <RouterLink to="/spa/skj" class="sidebar-menu">
          <span class="ti-book mr-2 text-brand-500"></span> Skala Resiko Jatuh
        </RouterLink>
      </div>
    </aside>
    <!-- sidebar overlay -->
    <div
      :class="`
        ${showSidebar ? 'fixed' : 'hidden'}
        lg:hidden
        top-0
        z-20
        h-screen
        w-full
        bg-gray-900
        opacity-50
      `"
      @click="toggleSidebar"
    >

    </div>
  </div>
</template>
<script>
import { ChevronUpIcon } from '@heroicons/vue/24/outline'

export default {
  components: {
    ChevronUpIcon
  },
  computed: {
    menu () {
      const auth = this.$store.state.auth.user
      if (auth && auth.menu) {
        return auth.menu.filter(e => e.text !== 'Dashboard')
      }
      return []
    }
  },
  props: {
    showSidebar: {
      type: Boolean,
      default: false
    }
  },
  data () {
    return {
      childOpen: []
    }
  },
  methods: {
    toggleSidebar () {
      this.$store.commit('SET_SIDEBAR', !this.showSidebar)
    },
    toggleChild (id) {
      const childOpen = [...this.childOpen]
      if (this.childOpen.includes(id)) {
        childOpen.splice(childOpen.findIndex(e => e === id), 1)
      } else {
        childOpen.push(id)
      }
      this.childOpen = childOpen
    },
  }
}
</script>