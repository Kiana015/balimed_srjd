<template>
  <div>
    <div class="py-3 sm:flex items-center justify-between px-4 ">
      <div class="flex">
        <div v-if="showSearch" class="my-1 flex flex-1 rounded-md">
          <span
            class="
              inline-flex
              items-center
              px-3
              rounded-l-md
              border border-r-0 border-gray-300
              dark:border-gray-700
              bg-gray-50
              dark:bg-gray-800
              text-gray-500
              dark:text-gray-300
              text-sm
            "
          >
            <MagnifyingGlassIcon class="w-5 h-5" />
          </span>
          <form v-if="showSearch" action="" method="" class="w-full" @submit="setSearch">
            <input
              id="search"
              v-model="filter.search"
              type="text"
              class="
              text-sm
                px-4 py-2
                focus:ring-indigo-500 focus:border-indigo-500
                w-full
                flex-1
                block
                rounded-none rounded-r-md
                border
                border-gray-300
                dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300
              "
              placeholder="Search"
            >
          </form>
        </div>
        <div class="my-1 relative">
          <div>
            <BtnIcon
              v-if="!hidePagination && showPerPageButton"
              type="button"
              title="Tampilkan Per Halaman"
              color="gray"
              icon="AdjustmentsVerticalIcon"
              icon-size="md"
              add-class="ml-2"
              @handleClick="showPerPageMenu = !showPerPageMenu"
            />
          </div>
          <div
            class="
              absolute
              z-40
              right-0
              mt-2
              w-48
              rounded-md
              shadow-lg
              py-1
              bg-white
              dark:bg-gray-800
              ring-1 ring-black ring-opacity-5
              focus:outline-none
            "
            :class="showPerPageMenu ? '' : 'hidden'"
          >
            <button
              v-for="i in [5, 10, 20, 50, 100, 1000]"
              :key="'per-' + i"
              type="button"
              class="
                block
                bg-white
                dark:bg-gray-800
                w-full
                text-left
                px-4
                py-2
                text-sm text-gray-700
                dark:text-gray-300
              "
              @click="setPerPage(i)"
            >
              Tampilkan tiap {{ i }} data
            </button>
          </div>
        </div>
        <div v-if="showToggleView" class="mt-1">
          <BtnIcon
            type="button"
            title="Mode View"
            color="gray"
            icon="TableCellsIcon"
            icon-size="md"
            add-class="ml-2"
            @handleClick="setViewMode"
          />
        </div>
        <div class="mt-1">
          <slot name="checkbox_action" />
        </div>
      </div>
      <div class="mt-1 sm:mt-0">
        <slot name="table-action" />
      </div>
    </div>
    <!-- slot alert -->
    <div>
      <slot name="table-alert" />
    </div>

    <!-- end slot alert -->
    <div
      v-if="!loading"
      class="overflow-x-auto overflow-hidden
      border-b border-t border-gray-200 dark:border-gray-700
      "
    >
      <table class="table-sm">
        <thead class="thead">
          <tr>
            <th
              v-for="c in columns"
              :key="c.field"
              scope="col"
              class="th"
              :class="c.sortable ? 'relative cursor-pointer' : ''"
              @click="setSort(c)"
            >
              <input
                v-if="c.field === 'checkbox'"
                v-model="checkbox"
                :value="1"
                type="checkbox"
                class="
                    focus:ring-indigo-500
                    h-4
                    w-4
                    text-indigo-600
                    border-gray-300
                    rounded
                    cursor-pointer
                  "
              >
              <!-- <span v-else>{{ c.label }}</span> -->
              <span v-else>
                <slot :name="`th-${c.field}`">
                  {{ c.label }}
                </slot>
              </span>
              <span v-if="c.sortable" class="absolute right-0">
                <ArrowLongUpIcon
                  v-if="
                    filter.sortKey === c.field && filter.sortOrder === 'asc'
                  "
                  class="w-5 h-5 dark:text-gray-200"
                />
                <ArrowLongUpIcon
                  v-else-if="
                    filter.sortKey === c.struct && filter.sortOrder === 'asc'
                  "
                  class="w-5 h-5 dark:text-gray-200"
                />
                <ArrowLongDownIcon
                  v-else-if="
                    filter.sortKey === c.field && filter.sortOrder === 'desc'
                  "
                  class="w-5 h-5 dark:text-gray-200"
                />
                <ArrowLongDownIcon
                  v-else-if="
                    filter.sortKey === c.struct && filter.sortOrder === 'desc'
                  "
                  class="w-5 h-5 dark:text-gray-200"
                />
                <ChevronUpDownIcon class="w-5 h-5" v-else />
              </span>
            </th>
          </tr>
        </thead>
        <tbody
          v-if="tableData.length > 0"
          class="tbody"
        >
          <tr v-for="(d, i) in tableData" :key="'row-' + i">
            <td
              v-for="(c, j) in columns"
              :key="'rd-' + j"
              class="td"
            >
              <slot :name="c.field" :row="d" :index="i" :nomor="i + meta.from">
                {{ d[c.field] }}
              </slot>
            </td>
          </tr>
        </tbody>
        <tbody v-else class="tbody">
          <tr>
            <td :colspan="columns.length" class="text-center px-6 py-4 dark:text-gray-300">
              Tidak ada data
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div
      v-if="!loading && !hidePagination"
      class="py-3 flex items-center justify-between px-4"
    >
      <div class="flex-1 flex justify-between sm:hidden">
        <BtnWithIcon
          color="light"
          add-class="inline-flex"
          @handleClick="setPage(filter.curPage - 1 > 0 ? filter.curPage - 1 : 1)"
        >
          Sebelum
        </BtnWithIcon>
        <BtnWithIcon
          color="light"
          add-class="inline-flex ml-3"
          @handleClick="
            setPage(
              filter.curPage + 1 > meta.numPage
                ? meta.numPage
                : filter.curPage + 1
            )
          "
        >
          Selanjutnya
        </BtnWithIcon>
      </div>
      <div v-if="!hidePagination" class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
        <div>
          <p class="text-sm text-gray-700 dark:text-gray-300">
            Menampilkan
            {{ " " }}
            <span class="font-medium">{{ meta.from }}</span>
            {{ " " }}
            sampai
            {{ " " }}
            <span class="font-medium">{{ meta.to }}</span>
            {{ " " }}
            dari
            {{ " " }}
            <span class="font-medium">{{ meta.total }}</span>
            {{ " " }}
            data
          </p>
        </div>
        <div>
          <nav
            class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px"
            aria-label="Pagination"
          >
            <BtnIcon
              color="light"
              icon="ChevronLeftIcon"
              add-class="rounded-none rounded-l-md"
              @handleClick="setPage(filter.curPage - 1 > 0 ? filter.curPage - 1 : 1)"
            />
            <div v-if="meta.numPage <= 5">
              <button
                v-for="i in meta.numPage"
                :key="'pg-' + i"
                type="button"
                class="
                  relative
                  inline-flex
                  items-center
                  px-4
                  py-2
                  border
                  text-sm
                  font-medium
                "
                :class="
                  i === filter.curPage
                    ? 'z-10 bg-indigo-50 dark:bg-gray-900 border-indigo-500 dark:border-gray-700 text-indigo-600 dark:text-gray-300'
                    : 'bg-white dark:bg-gray-800 border-gray-300 dark:border-gray-700 text-gray-500 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-700'
                "
                @click="setPage(i)"
              >
                {{ i }}
              </button>
            </div>
            <div v-else>
              <button
                v-for="i in firstPage"
                :key="'pg-' + i"
                type="button"
                class="
                  relative
                  inline-flex
                  items-center
                  px-4
                  py-2
                  border
                  text-sm
                  font-medium
                "
                :class="
                  i === filter.curPage
                    ? 'z-10 bg-indigo-50 dark:bg-gray-900 border-indigo-500 dark:border-gray-700 text-indigo-600 dark:text-gray-300'
                    : 'bg-white dark:bg-gray-800 border-gray-300 dark:border-gray-700 text-gray-500 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-700'
                "
                @click="setPage(i)"
              >
                {{ i }}
              </button>
              <span
                v-if="curPage.length !== 0"
                class="
                  relative
                  inline-flex
                  items-center
                  px-4
                  py-2
                  border border-gray-300
                  dark:border-gray-700
                  bg-white
                  dark:bg-gray-800
                  text-sm
                  font-medium
                  text-gray-700
                  dark:text-gray-300
                "
              >
                ...
              </span>
              <button
                v-for="i in curPage"
                :key="'pg-' + i"
                type="button"
                class="
                  relative
                  inline-flex
                  items-center
                  px-4
                  py-2
                  border
                  text-sm
                  font-medium
                "
                :class="
                  i === filter.curPage
                    ? 'z-10 bg-indigo-50 dark:bg-gray-900 border-indigo-500 dark:border-gray-700 text-indigo-600 dark:text-gray-300'
                    : 'bg-white dark:bg-gray-800 border-gray-300 dark:border-gray-700 text-gray-500 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-700'
                "
                @click="setPage(i)"
              >
                {{ i }}
              </button>
              <span
                class="
                  relative
                  inline-flex
                  items-center
                  px-4
                  py-2
                  border border-gray-300
                  dark:border-gray-700
                  bg-white
                  dark:bg-gray-800
                  text-sm
                  font-medium
                  text-gray-700
                  dark:text-gray-300
                "
              >
                ...
              </span>
              <button
                v-for="i in lastPage"
                :key="'pg-' + i"
                type="button"
                class="
                  relative
                  inline-flex
                  items-center
                  px-4
                  py-2
                  border
                  text-sm
                  font-medium
                "
                :class="
                  i === filter.curPage
                    ? 'z-10 bg-indigo-50 dark:bg-gray-900 border-indigo-500 dark:border-gray-700 text-indigo-600 dark:text-gray-300'
                    : 'bg-white dark:bg-gray-800 border-gray-300 dark:border-gray-700 text-gray-500 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-700'
                "
                @click="setPage(i)"
              >
                {{ i }}
              </button>
            </div>
            <BtnIcon
              color="light"
              icon="ChevronRightIcon"
              add-class="rounded-none rounded-r-md"
              @handleClick="
                setPage(
                  filter.curPage + 1 > meta.numPage
                    ? meta.numPage
                    : filter.curPage + 1
                )
              "
            />
          </nav>
        </div>
      </div>
    </div>
    <div
      v-if="loading"
      class="overflow-x-auto overflow-hidden sm:rounded-lg shadow border-b border-gray-200 dark:border-gray-700"
    >
      <table
        class="table"
      >
        <thead class="thead">
          <tr>
            <th
              v-for="c in columns"
              :key="c.field"
              scope="col"
              class="th"
              :class="c.sortable ? 'relative cursor-pointer' : ''"
              @click="setSort(c)"
            >
              {{ c.label }}
              <span v-if="c.sortable" class="absolute right-0">
                <ArrowLongDownIcon
                  v-if="
                    filter.sortKey === c.field && filter.sortOrder === 'asc'
                  "
                  class="w-5 h-5"
                />
                <ArrowLongUpIcon
                  v-else-if="
                    filter.sortKey === c.field && filter.sortOrder === 'desc'
                  "
                  class="w-5 h-5"
                />
                <ChevronUpDownIcon class="w-5 h-5" v-else />
              </span>
            </th>
          </tr>
        </thead>
        <tbody class="tbody">
          <tr>
            <td :colspan="columns.length" class="td text-center">
              <div class="spinner-container">
                <div class="spinner" />
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import BtnIcon from './BtnIcon.vue'
import BtnWithIcon from './BtnWithIcon.vue'
import { MagnifyingGlassIcon, ArrowLongUpIcon, ArrowLongDownIcon, ChevronUpDownIcon } from '@heroicons/vue/24/outline'

export default {
  components: {
    BtnIcon, BtnWithIcon,
    MagnifyingGlassIcon, ArrowLongUpIcon, ArrowLongDownIcon, ChevronUpDownIcon
  },
  props: {
    columns: {
      type: Array,
      default: () => null
    },
    items: {
      type: Array,
      default: () => null
    },
    loading: {
      type: Boolean,
      default: () => null
    },
    mode: {
      type: String, // ajax atau frontend
      default: 'frontend'
    },
    ajaxFilter: {
      type: Object,
      default: () => null // kalau ajax, filter nya dari parent
    },
    ajaxMeta: {
      type: Object,
      default: () => null // kalau ajax, ambil meta dari backend
    },
    showToggleView: {
      type: Boolean,
      default: false
    },
    cardGrid: {
      type: Number,
      default: 1
    },
    defaultPerPage: {
      type: Number,
      default: () => null
    },
    hidePagination: {
      type: Boolean,
      default: () => null
    },
    showSearch: {
      type: Boolean,
      default: true
    },
    showPerPageButton: {
      type: Boolean,
      default: true
    }
  },
  data () {
    return {
      filter: {
        sortKey: '',
        sortOrder: '',
        curPage: 1,
        perPage: 10,
        search: ''
      },
      tableData: [],
      meta: {
        from: 1,
        to: 0,
        numPage: 0,
        total: 0
      },
      showPerPageMenu: false,
      checkbox: []
    }
  },
  computed: {
    firstPage () {
      let tfp = [1, 2] // kalau cur page != 2
      if (this.filter.curPage === 2) {
        tfp = [1, 2, 3]
      }
      return tfp
    },
    curPage () {
      let tcp = []
      if (this.filter.curPage === 3) {
        tcp = [3, 4, 5]
      } else if (this.filter.curPage >= 4 && this.filter.curPage <= this.meta.numPage - 3) {
        tcp = [this.filter.curPage - 1, this.filter.curPage, this.filter.curPage + 1]
      } else if (this.filter.curPage === this.meta.numPage - 2) {
        tcp = [this.filter.curPage - 1, this.filter.curPage]
      }
      return tcp
    },
    lastPage () {
      let lcp = [this.meta.numPage - 1, this.meta.numPage]
      if (this.filter.curPage === this.meta.numPage - 1) {
        lcp = [this.filter.curPage - 1, this.filter.curPage, this.filter.curPage + 1]
      }
      return lcp
    }
  },
  watch: {
    items (newVal, oldVal) {
      this.loadTableData()
    },
    'filter.search' (newVal) {
      if (this.mode === 'frontend') {
        this.filter.curPage = 1
        this.checkbox = []
        this.loadTableData()
      }
    },
    'ajaxFilter.sortKey' (newVal) {
      this.filter.sortKey = newVal
    },
    'ajaxFilter.sortOrder' (newVal) {
      this.filter.sortOrder = newVal
    },
    'ajaxFilter.curPage' (newVal) {
      this.filter.curPage = newVal
    },
    'ajaxFilter.perPage' (newVal) {
      this.filter.perPage = newVal
    },
    'ajaxFilter.search' (newVal) {
      this.filter.search = newVal
    },
    'ajaxMeta.from' (newVal) {
      this.meta.from = newVal
    },
    'ajaxMeta.to' (newVal) {
      this.meta.to = newVal
    },
    'ajaxMeta.numPage' (newVal) {
      this.meta.numPage = newVal
    },
    'ajaxMeta.total' (newVal) {
      this.meta.total = newVal
    },
    checkbox (newVal) {
      this.$emit('handleCheckbox', (newVal.length === 1))
    }
  },
  mounted () {
    if (this.defaultPerPage) {
      this.filter.perPage = this.defaultPerPage
    }
    if (this.items.length > 0) {
      this.loadTableData()
    }
    if (this.mode === 'ajax' && this.ajaxFilter) {
      this.filter = {...this.ajaxFilter}
    }
  },
  methods: {
    loadTableData () {
      if (this.mode === 'frontend') {
        let dataFiltered = []
        this.items.forEach((e) => {
          dataFiltered.push(e)
        })

        // Search
        if (this.filter.search && this.items.length > 0) {
          const columnKey = Object.keys(this.items[0])
          const dataSearched = []
          dataFiltered.forEach((f) => {
            // loop data filtered
            let isPushed = false
            columnKey.forEach((e) => {
              if (!isPushed) {
                // loop kolom, jika ada di search di kolom itu, push, tapi jika row itu belum di push saja
                const val = f[e] + ''
                if (val.toLowerCase().includes(this.filter.search)) {
                  dataSearched.push(f)
                  isPushed = true
                }
              }
            })
          })

          dataFiltered = dataSearched
        }

        // Sort
        if (this.filter.sortKey && this.filter.sortOrder) {
          const compare = ({ key }) => {
            return (a, b) => {
              let result = 0
              let akey = null
              let bkey = null

              // check jika ada . (child object dipakai sort)
              if (!key.includes('.')) {
                akey = a[key]
                bkey = b[key]
              } else {
                const arrKey = key.split('.')
                let tempA = a
                let tempB = b
                for (let i = 0; i < arrKey.length; i++) {
                  const keyName = arrKey[i]
                  tempA = tempA[keyName]
                  tempB = tempB[keyName]
                }
                akey = tempA
                bkey = tempB
              }
              if (akey > bkey) {
                result = 1
              }
              if (akey < bkey) {
                result = -1
              }
              if (this.filter.sortOrder === 'desc') {
                return result * -1
              } else if (this.filter.sortOrder === 'asc') {
                return result
              }
            }
          }
          dataFiltered = dataFiltered.sort(compare({ key: this.filter.sortKey }))
        }

        // Perpage
        let numPage = parseInt(this.items.length / this.filter.perPage) + 1
        if (this.items.length % this.filter.perPage === 0) {
          numPage = numPage - 1
        }
        const from = (this.filter.curPage - 1) * this.filter.perPage
        const to = (from + this.filter.perPage > this.items.length) ? this.items.length : from + this.filter.perPage
        dataFiltered = dataFiltered.splice(from, this.filter.perPage)

        // Set meta
        this.meta.from = from + 1
        this.meta.to = to
        this.meta.numPage = numPage
        this.meta.total = this.items.length
        this.tableData = dataFiltered
      } else if (this.mode === 'ajax') {
        this.tableData = this.items
      }
    },
    setSort (c) {
      if (c.sortable && this.items.length > 0) {
        // check apakah sortKey ada di data? kalau tidak, pakai struct columns
        const dataKey = Object.keys(this.items[0])
        const key = (dataKey.includes(c.field)) ? c.field : c.struct
        this.filter.sortKey = key
        this.filter.sortOrder = (this.filter.sortOrder) ? (this.filter.sortOrder === 'desc') ? 'asc' : 'desc' : 'asc'
        if (this.mode === 'frontend') {
          this.loadTableData()
        } else if (this.mode === 'ajax') {
          this.$emit('setFilter', this.filter)
        }
      }
    },
    setPage (i) {
      if (this.filter.curPage === i) {
        return false
      }
      if (i < 1 || i > this.meta.numPage) {
        return false
      }

      this.filter.curPage = i
      // this.checkbox = []
      if (this.mode === 'frontend') {
        this.loadTableData()
      } else if (this.mode === 'ajax') {
        if (!this.filter.sortKey) {
          this.filter.sortKey = 'created_at'
        }
        if (!this.filter.sortOrder) {
          this.filter.sortOrder = 'desc'
        }
        this.$emit('setFilter', this.filter)
      }
    },
    setSearch (e) {
      e.preventDefault()
      if (this.mode === 'ajax') {
        this.filter.curPage = 1
        this.checkbox = []
        if (!this.filter.sortKey) {
          this.filter.sortKey = 'created_at'
        }
        if (!this.filter.sortOrder) {
          this.filter.sortOrder = 'desc'
        }
        this.$emit('setFilter', this.filter)
      }
    },
    setPerPage (val) {
      this.showPerPageMenu = false
      this.filter.perPage = val
      this.checkbox = []
      if (!this.filter.sortKey) {
        this.filter.sortKey = 'created_at'
      }
      if (!this.filter.sortOrder) {
        this.filter.sortOrder = 'desc'
      }
      if (this.mode === 'frontend') {
        this.loadTableData()
      } else if (this.mode === 'ajax') {
        this.$emit('setFilter', this.filter)
      }
    }
  }
}
</script>

<style scoped>
  /* #search {
    padding-top: 10px;
    padding-bottom: 10px
  }
  @media screen and (max-width: 640px) {
    #search {
      padding-top: 8px;
      padding-bottom: 8px;
    }
  } */
</style>
