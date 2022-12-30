<template>
  <button
    type="button"
    class="p-3 mr-2 rounded-full bg-orange-600 dark:bg-brand-900 text-white opacity-0"
    @click="toggleDarkMode"
  >
    <SunIcon v-if="theme === 'light'" class="w-4 h-4" />
    <MoonIcon v-else class="w-4 h-4" />
  </button>
</template>

<script>
import { MoonIcon, SunIcon } from '@heroicons/vue/24/outline'

export default {
  components: {
    MoonIcon, SunIcon
  },
  data () {
    return {
      theme: 'light'
    }
  },
  computed: {
    showToggle () {
      const auth = this.$store.state.auth.user
      if ('user' in auth && auth.user.name === 'Jhonarendra') {
        return true
      }
      return false
    }
  },
  mounted () {
    this.setTheme()
  },
  methods: {
    setTheme () {
      const htmlEl = document.querySelector('html')
      if (localStorage.theme) {
        // On page load or when changing themes, best to add inline in `head` to avoid FOUC
        // if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        if (localStorage.theme === 'dark') {
          htmlEl.classList.add('dark')
          this.theme = 'dark'
        } else {
          htmlEl.classList.remove('dark')
          this.theme = 'light'
        }
      } else {
        localStorage.setItem('theme', 'light')
      }
    },
    toggleDarkMode () {
      this.theme = (this.theme === 'dark') ? 'light' : 'dark'
      localStorage.setItem('theme', this.theme)
      this.setTheme()
    }
  }
}
</script>
