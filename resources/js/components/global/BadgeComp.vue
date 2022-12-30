<template>
  <span
    :class="className"
  >
    <slot />
  </span>
</template>

<script>
export default {
  props: {
    color: {
      type: String,
      default: () => null
    },
    size: {
      type: String,
      default: 'sm' // sm | md | lg
    },
    addClass: {
      type: String,
      default: () => null
    }
  },
  computed: {
    className () {
      return `
        ${this.size === 'sm' ? 'px-2' : this.size === 'md' ? 'px-4 py-1' : 'px-2'}
        inline-flex
        ${this.size === 'sm' ? 'text-xs' : this.size === 'md' ? 'text-md' : this.size === 'lg' ? 'text-lg' : 'text-sm'}
        leading-5
        bg-${this.color}-100
        dark:bg-${this.color}-800
        text-${this.color}-800
        dark:text-${this.color}-100
        rounded-full
        whitespace-nowrap
        ${this.addClass}
      `
    }
  }
}
</script>
