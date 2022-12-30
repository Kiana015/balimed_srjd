<template>
  <h4
    :class="`
      text-brand-500
      font-bold
      py-4
      cursor-pointer
      flex
      ${tabOpen.includes(tabId) ? '' : 'border-b'}
    `"
    role="button"
    @click="$emit('toggleTab', tabId)"
  >
    <span class="flex-1">
      {{ dataText }}
    </span>
    <ChevronUpIcon
      :class="`
        ${tabOpen.includes(tabId) ? '' : 'rotate-180 transform'}
        h-5 w-5 text-brand-500 transition-all
      `"
    />
  </h4>
</template>

<script>
import { ChevronUpIcon } from '@heroicons/vue/20/solid'

export default {
  components: {
    ChevronUpIcon
  },
  props: {
    tabId: {
      type: Number,
      default: 0
    },
    tabOpen: {
      type: Array,
      default: []
    },
    dataText: {
      type: String,
      default: ''
    }
  }
}
</script>