<template>
  <transition
    enter-active-class="transition ease-out duration-300"
    enter-from-class="opacity-0"
    enter-to-class="opacity-100"
    leave-active-class="transition ease-in duration-200"
    leave-from-class="opacity-100"
    leave-to-class="opacity-0"
  >
    <div v-show="showing" class="fixed inset-0 z-50 overflow-y-auto">
      <div
        class="
          flex
          items-start
          justify-center
          min-h-screen
          pt-4
          px-4
          pb-20
        "
      >
        <div class="fixed inset-0 transition-opacity" aria-hidden="true">
          <button
            v-if="showClose"
            aria-label="close"
            class="
              absolute
              z-50
              bg-white
              dark:bg-gray-800
              rounded-full
              py-2
              px-2
              top-4
              sm:top-3
              right-4
              sm:right-3
              cursor-pointer
              focus:outline-none
            "
            @click.prevent="close()"
          >
            <svg
              class="h-4 w-4 text-gray-600"
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M6 18L18 6M6 6l12 12"
              />
            </svg>
          </button>
          <div class="absolute inset-0 bg-gray-900 opacity-75" @click.prevent="close()" />
        </div>

        <div
          class="
            m-0
            sm:m-8
            inline-block
            align-middle
            w-full
            bg-white
            dark:bg-gray-800
            rounded-lg
            shadow-xl
            transform
            transition-all
          "
          :class="(size === 'lg') ? 'max-w-6xl' : (size === 'md') ? 'max-w-4xl' : (size === 'sm') ? 'max-w-2xl' : 'max-w-2xl'"
        >
          <button
            v-if="showClose"
            aria-label="close"
            class="
              block
              sm:hidden
              absolute
              z-50
              bg-white
              dark:bg-gray-800
              rounded-full
              py-2
              px-2
              top-4
              sm:top-3
              right-4
              sm:right-3
              cursor-pointer
              focus:outline-none
            "
            @click.prevent="close()"
          >
            <svg
              class="h-4 w-4 text-gray-600"
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M6 18L18 6M6 6l12 12"
              />
            </svg>
          </button>
          <slot />
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
export default {
  name: 'VueTailwindModal',
  props: {
    showing: {
      type: Boolean,
      default: false
    },
    showClose: {
      type: Boolean,
      default: true
    },
    size: {
      type: String,
      default: 'sm'
    }
  },
  methods: {
    close () {
      this.$emit('update:showing', false)
      this.$emit('close')
    }
  }
}
</script>
