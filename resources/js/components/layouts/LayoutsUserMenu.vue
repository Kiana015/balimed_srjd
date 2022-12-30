<template>
  <Menu as="div" class="relative inline-block text-left z-10">
    <div>
      <MenuButton
        class="
          inline-flex
          w-full
          justify-center
          rounded-full
          bg-brand-500
          p-3
          text-white"
      >
        <UserIcon class="w-4 h-4" />
      </MenuButton>
    </div>

    <transition
      enter-active-class="transition duration-100 ease-out"
      enter-from-class="transform scale-95 opacity-0"
      enter-to-class="transform scale-100 opacity-100"
      leave-active-class="transition duration-75 ease-in"
      leave-from-class="transform scale-100 opacity-100"
      leave-to-class="transform scale-95 opacity-0"
    >
      <MenuItems
        class="absolute right-0 mt-2 w-80 origin-top-right divide-y divide-gray-100 dark:divide-gray-600 rounded-md bg-white dark:bg-gray-700 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none"
      >
        <!-- header menu -->
        <div class="relative bg-gray-100 dark:bg-gray-800 p-8 border-t-2 border-brand-500 rounded-t-md flex">
          <div>
            <div
              class="bg-brand-500 text-white w-10 h-10 rounded-full bg-indigo text-2xl text-center"
            >
              <span class="pt-1 block">
                {{ 'name' in user ? user.name.substr(0, 1) : 'X' }}
              </span>
            </div>
          </div>
          <div class="px-4">
            <span class="block text-gray-900 dark:text-white font-medium text-sm">{{ user.name || '' }}</span>
            <span class="text-gray-500 text-xs">{{ user.email || ''}}</span>
          </div>
          <button
            class=""
          >
            <Cog6ToothIcon class="w-5 h-5" />
          </button>
        </div>
        <!-- role active -->
        <div class="p-8">
          <label for="change-role"
          class="block font-medium
          text-xs uppercase
          tracking-widest
          text-gray-500 dark:text-gray-300 mb-2">Role Active</label>
          <v-select
            id="change-role"
            v-model="active_role"
            :options="roles"
            label="role_name"
            :clearable="false"
            class="text-sm"
          />
        </div>
        <!-- menu -->
        <div class="px-1 py-1">
          <MenuItem v-slot="{ active }">
            <button
              type="button"
              :class="[
                active ? 'text-brand-500 dark:text-brand-300' : 'text-gray-900 dark:text-gray-300',
                'group flex w-full items-center rounded-md px-8 py-4 text-xs font-medium',
              ]"
            >
              <Cog6ToothIcon
                :active="active"
                class="mr-2 h-5 w-5 text-brand-500 dark:text-brand-300"
                aria-hidden="true"
              />
              Account Setting
            </button>
          </MenuItem>
        </div>
        <div class="px-1 py-1">
          <MenuItem v-slot="{ active }">
            <a
              href="https://ssobmd.b1nus.com/"
              :class="[
                active ? 'text-brand-500 dark:text-brand-300' : 'text-gray-900 dark:text-gray-300',
                'group flex w-full items-center rounded-md px-8 py-4 text-xs font-medium',
              ]"
            >
              <Squares2X2Icon
                :active="active"
                class="mr-2 h-5 w-5 text-brand-500 dark:text-brand-300"
                aria-hidden="true"
              />
              Dashboard SSO
            </a>
          </MenuItem>
          <MenuItem v-slot="{ active }">
            <a
              href="/logout"
              :class="[
                active ? 'text-brand-500 dark:text-brand-300' : 'text-gray-900 dark:text-gray-300',
                'group flex w-full items-center rounded-md px-8 py-4 text-xs font-medium',
              ]"
            >
              <ArrowRightOnRectangleIcon
                :active="active"
                class="mr-2 h-5 w-5 text-brand-500 dark:text-brand-300"
                aria-hidden="true"
              />
              Sign Out
            </a>
          </MenuItem>
        </div>
      </MenuItems>
    </transition>
    <div v-if="loading" class="fixed z-10 w-full h-screen left-0 top-0" style="background: rgba(255,255,255,.5)">
      <div class="absolute spinner-container" style="top: 40%">
        <div class="spinner" />
      </div>
    </div>
  </Menu>
</template>

<script>
import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue'
import { UserIcon, ChevronDownIcon, ArrowLeftOnRectangleIcon,
Cog6ToothIcon, Squares2X2Icon, ArrowRightOnRectangleIcon } from '@heroicons/vue/24/outline'
import 'vue-select/dist/vue-select.css';

export default {
  components: {
    UserIcon,
    Menu, MenuButton, MenuItems, MenuItem,
    ChevronDownIcon, ArrowLeftOnRectangleIcon,
    Cog6ToothIcon, Squares2X2Icon, ArrowRightOnRectangleIcon
  },
  data () {
    return {
      user: {},
      roles: [],
      active_role: {},
      loading: false
    }
  },
  computed: {
    auth () {
      return this.$store.state.auth.user
    }
  },
  watch: {
    auth () {
      this.loadAuth()
    },
    active_role (newVal, oldVal) {
      if ('role_id' in oldVal) {
        this.changeRole()
      }
    }
  },
  mounted () {
    this.loadAuth()
  },
  methods: {
    loadAuth () {
      const user = this.$store.state.auth.user
      if ('user' in user) {
        this.user = user.user
        this.roles = user.roles
        this.active_role = user.active_role
      }
    },
    changeRole() {
      this.loading = true

      // remove data di localStorage yang terkait role
      localStorage.removeItem('dokterSelected')
      localStorage.removeItem('curPasienId')
      localStorage.removeItem('poliSelected')

      this.$store.dispatch('changeRole', this.active_role.role_id)
      .then(() => {
        this.loading = false
        window.location = ''
      })
        .catch(() => {
          alert('error')
        })
    }
  }
}
</script>