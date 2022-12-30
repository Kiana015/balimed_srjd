<template>
  <div class="overflow-x-auto">
    <div class="border-b border-gray-200 dark:border-gray-700 whitespace-nowrap">
      <div
        class="-mb-px flex px-4 space-x-8"
        aria-orientation="horizontal"
        role="tablist"
      >
        <button
          v-for="(e, i) in tabMenu"
          :key="e.id"
          class="
            flex-1
            whitespace-nowrap
            py-4
            px-1
            border-b
            text-base
            font-medium
          "
          :class="
            e.title === active
              ? 'text-brand-600 border-brand-600'
              : 'text-gray-900 dark:text-gray-300 dark:border-gray-700'
          "
          type="button"
          :tabindex="i"
          :aria-selected="e.title === active"
          @click="$emit('setActive', e.title)"
        >
          {{ e.title }}
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    menu: {
      type: Array,
      default: () => null
    },
    active: {
      type: String,
      default: () => null
    }
  },
  computed: {
    tabMenu () {
      const tabMenu = []
      this.menu.forEach((e, i) => {
        tabMenu.push({
          id: i,
          title: e,
          key: e.replace(/ /g, '_').toLocaleLowerCase()
        })
      })
      return tabMenu
    }
  }
}
</script>
