<template>
  <button
    :type="type"
    :title="title"
    :class="className"
    :disabled="loading || disabled"
    @click="handleClick"
  >
    <span class="absolute left-0 inset-y-0 flex items-center pl-3">
      <component
        :is="icon"
        v-if="!loading"
        :class="`
          ${iconSize === 'sm' ? 'w-5 h-5' : ''}
          ${iconSize === 'md' ? 'w-6 h-6' : ''}
          ${iconSize === 'lg' ? 'w-8 h-8' : ''}
        `"
      />
      <SpinnerIcon v-else :variant="(color === 'gray') ? 'text-indigo-500 dark:text-indigo-300' : 'text-white'" />
    </span>
    <slot />
  </button>
</template>

<script>
import { AdjustmentsVerticalIcon, TableCellsIcon, CalendarDaysIcon, DocumentTextIcon,
ChevronLeftIcon, ChevronRightIcon, PencilIcon, TrashIcon, PhotoIcon, ArrowTopRightOnSquareIcon,
ArrowPathIcon, PlusIcon, CheckIcon, XMarkIcon, ArrowLeftIcon, UserIcon,
ArrowDownOnSquareIcon, ClipboardDocumentIcon } from '@heroicons/vue/24/outline'
import SpinnerIcon from './SpinnerIcon.vue'

export default {
  components: {
    SpinnerIcon,
    AdjustmentsVerticalIcon, TableCellsIcon, ChevronLeftIcon, ChevronRightIcon,
    ArrowPathIcon, PlusIcon, CheckIcon, PencilIcon, TrashIcon, XMarkIcon,
    ArrowLeftIcon, PhotoIcon, CalendarDaysIcon, UserIcon, DocumentTextIcon,
    ArrowTopRightOnSquareIcon, ArrowDownOnSquareIcon, ClipboardDocumentIcon
  },
  props: {
    type: {
      type: String,
      default: 'button'
    },
    color: {
      type: String,
      default: 'gray'
    },
    title: {
      type: String,
      default: 'Title'
    },
    loading: {
      type: Boolean,
      default: false
    },
    disabled: {
      type: Boolean,
      default: false
    },
    icon: {
      type: String,
      default: () => null
    },
    iconSize: {
      type: String,
      default: 'sm'
    },
    addClass: {
      type: String,
      default: () => null
    }
  },
  computed: {
    className () {
      let dataClass = `
        group
        relative
        flex
        justify-center
        ${this.iconSize === 'sm' ? 'pt-2 pb-2' : ''}
        ${this.iconSize === 'md' ? 'pt-3 pb-3' : ''}
        ${this.iconSize === 'lg' ? 'pt-4 pb-4' : ''}
        ${(!this.icon) ? 'pl-4' : 'pl-12'}
        pr-4
        rounded-md
        shadow-sm
        ${this.iconSize === 'sm' ? 'text-sm' : ''}
        ${this.iconSize === 'md' ? 'text-base' : ''}
        ${this.iconSize === 'lg' ? 'text-lg' : ''}
        leading-4
        font-medium
        focus:outline-none
        focus:ring-2
        focus:ring-offset-2
      `
      if (this.color === 'gray') {
        dataClass += `
          border border-gray-300
          dark:border-gray-700
          hover:bg-gray-50
          dark:hover:bg-gray-700
          focus:ring-indigo-500
        `
        if (this.loading || this.disabled) {
          dataClass += `
            text-gray-500
            cursor-not-allowed
          `
        } else {
          dataClass += `
            text-gray-700
            dark:text-gray-300
          `
        }
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
      } else {
        dataClass += `
          text-white
          border border-transparent
          focus:ring-${this.color}-500
        `
        if (this.loading || this.disabled) {
          dataClass += `
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
