<template>
  <button
    :type="type"
    :title="title"
    :class="className"
    :disabled="loading"
    @click="handleClick"
  >
    <component :is="icon" v-if="!loading" :class="`${iconSize === 'sm' ? 'w-4 h-4' : iconSize === 'md' ? 'w-5 h-5' : ''}`" />
    <SpinnerIcon v-else :variant="(color === 'gray') ? 'text-indigo-500 dark:text-indigo-300' : (color === 'light') ? 'text-gray-700' : 'text-white'" />
  </button>
</template>

<script>
import { AdjustmentsVerticalIcon, TableCellsIcon, CalendarDaysIcon, DocumentTextIcon,
ChevronLeftIcon, ChevronRightIcon, PencilIcon, TrashIcon, PhotoIcon, SpeakerWaveIcon, SpeakerXMarkIcon,
ArrowPathIcon, PlusIcon, CheckIcon, XMarkIcon, ArrowLeftIcon, UserIcon } from '@heroicons/vue/24/outline'
import SpinnerIcon from './SpinnerIcon.vue'

export default {
  components: {
    SpinnerIcon,
    AdjustmentsVerticalIcon, TableCellsIcon, ChevronLeftIcon, ChevronRightIcon,SpeakerWaveIcon,
    ArrowPathIcon, PlusIcon, CheckIcon, PencilIcon, TrashIcon, XMarkIcon,
    ArrowLeftIcon, PhotoIcon, CalendarDaysIcon, UserIcon, DocumentTextIcon, SpeakerXMarkIcon
  },
  props: {
    type: {
      type: String,
      default: 'button'
    },
    title: {
      type: String,
      default: 'Title'
    },
    loading: {
      type: Boolean,
      default: false
    },
    icon: {
      type: String,
      default: 'PencilIcon'
    },
    color: {
      type: String,
      default: 'indigo'
    },
    addClass: {
      type: String,
      default: () => null
    },
    iconSize: {
      type: String,
      default: 'md'
    }
  },
  computed: {
    className () {
      let dataClass = `
        py-2
        px-2
        text-sm
        font-medium
        rounded-md
        focus:outline-none
        focus:ring-2
        focus:ring-offset-2
      `
      if (this.color.substr(0, 4) === 'gray') {
        dataClass += `
          ${(this.color === 'gray') ? '' : 'bg-' + this.color}
          text-gray-700
          dark:text-gray-300
          border border-gray-300
          dark:border-gray-700
          hover:bg-gray-50
          dark:hover:bg-gray-700
          focus:ring-indigo-500
        `
        if (this.loading) {
          dataClass += `
            pl-4
            pr-0
            text-gray-500
            cursor-not-allowed
          `
        } else {
          dataClass += `
            text-gray-700
            dark:text-gray-300
          `
        }
      } else if (this.color === 'transparent') {
        dataClass += `
          text-gray-700
          dark:text-gray-300
          bg-transparent
          focus:outline-none
        `
      } else if (this.color === 'light') {
        dataClass += `
          bg-white
          dark:bg-gray-800
          text-gray-700
          dark:text-gray-300
          border border-gray-300
          dark:border-gray-700
          hover:bg-gray-50
          dark:hover:bg-gray-700
          focus:ring-indigo-500
        `
        if (this.loading) {
          dataClass += `
            pl-4
            pr-0
            text-gray-500
            cursor-not-allowed
          `
        } else {
          dataClass += `
            text-gray-700
            dark:text-gray-300
          `
        }
      } else {
        dataClass += `
          text-white
          border border-transparent
          focus:ring-${this.color}-500
        `
        if (this.loading) {
          dataClass += `
            pl-4
            pr-0
            bg-${this.color}-500
            hover:bg-${this.color}-500
            cursor-not-allowed
          `
        } else {
          dataClass += `
            bg-${this.color}-600
            hover:bg-${this.color}-700
          `
        }
      }

      dataClass += ' ' + this.addClass
      return dataClass
    }
  },
  methods: {
    handleClick (val) {
      this.$emit('handleClick', val)
    }
  }
}
</script>
