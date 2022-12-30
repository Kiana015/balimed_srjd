<template>
  <nav
    :class="`
      fixed
      top-0
      ${(sidebar) ? (showSidebar) ? 'lg:pl-80' : '' : ''}
      z-20
      w-full
      flex
      px-8
      bg-white
      dark:bg-brand-800
      text-gray-500
      border-b
      border-gray-200
      dark:border-brand-700`
    "
  >
    <div v-if="sidebar" class="py-1">
      <button
        class="
          p-4
        "
        @click="toggleSidebar"
      >
        <Bars3Icon class="w-6 h-6 dark:text-gray-300" />
      </button>
      
    </div>
    <div class="py-4 flex-1">
      <!-- <LayoutsPilihSubunit /> -->
    </div>
    <div class="flex py-4">
      <ToggleDarkMode />
      <LayoutsUserMenu />
    </div>
  </nav>
</template>

<script>
import LayoutsUserMenu from './LayoutsUserMenu.vue'
// import LayoutsPilihSubunit from './LayoutsPilihSubunit.vue'
import ToggleDarkMode from './../global/ToggleDarkMode.vue'
import { Bars3Icon } from '@heroicons/vue/24/outline'

export default {
  components: {
    LayoutsUserMenu, ToggleDarkMode,
    Bars3Icon,
    // LayoutsPilihSubunit
  },
  props: {
    sidebar: {
      type: Boolean,
      default: false
    },
    showSidebar: {
      type: Boolean,
      default: false
    }
  },
  data () {
    return {
      menu: []
      // menu: [
      //   { href: '/spa/home', text: 'Dashboard'},
      //   { href: '/spa/antrian', text: 'Antrian'},
      //   { href: '/spa/assessment-keperawatan', text: 'Assessment Keperawatan'}
      // ]
    }
  },
  methods: {
    toggleSidebar () {
      this.$store.commit('SET_SIDEBAR', !this.showSidebar)
    }
  }
}
</script>