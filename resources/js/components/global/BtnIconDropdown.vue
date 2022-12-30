  <template>
    <button class="bg-grey-200 hover:bg-black text-black hover:text-white font-bold py-2 px-4 rounded" @click="toggle">
        Action
    </button>
    <div v-if="active">
      Action
    </div>
  </template>
  
  <script>
    import {Cog8ToothIcon} from '@heroicons/vue/24/outline'
    import SpinnerIcon from './SpinnerIcon.vue'
    export default {
      components: { SpinnerIcon, Cog8ToothIcon},
      data () {
        return {
          active: false
        }
      },
      methods: {
        toggle () {
          this.active = !this.active
        }
      }
    }
  </script>