<template>
  <div>
    <!-- page title section -->
    <div>
      <BtnWithIcon
        title="Kembali"
        icon="ArrowLeftIcon"
        color="light"
        @handleClick="$router.push({ path: '/spa/home', query: { menu: groupMenuId } })"
      >
        Kembali
      </BtnWithIcon>
      <h2
        class="text-2xl my-4 font-bold text-brand-500 dark:text-gray-300"
      >
        {{ setting.title }}
      </h2>
      <p class="text-gray-500">
        {{ setting.desc }}
      </p>
    </div>

    <!-- filter section (jika ada slot) -->
    <slot name="filter" />

    <!-- content -->
    <div
      class="
        mt-8
        bg-white
        dark:bg-gray-900
        border
        border-gray-200
        dark:border-gray-800
        rounded-lg
      "
    >
      <TableComp :columns="columns" :items="items" :loading="tableLoading">
        <template #table-action>
          <div class="flex">
            <BtnWithIcon
              v-if="hakAkses.includes('tambah')"
              title="Tambah"
              icon="PlusIcon"
              icon-size="md"
              add-class="flex-1 sm:flex-none"
              @handleClick="tambah"
            >
              Tambah
            </BtnWithIcon>
            <BtnIcon
              type="button"
              title="Refresh"
              color="gray"
              icon="ArrowPathIcon"
              icon-size="md"
              add-class="ml-2"
              @handleClick="loadData"
            />
          </div>
        </template>

        <!-- 
          Slot Dinamis
          Jika component memerlukan custom slot, berikan prop nama kolomnya
          Jangan aksi dijadikan slot, nanti hilang template bawahnya
        -->
        <template
          v-for="s in tableSlot"
          :key="s"
          #[s]="{ row }"
        >
          <slot :name="'table_col_' + s" :row="row" />
        </template>

        <template #aksi="{ row }">
          <div class="flex">
            <BtnIcon
              v-if="hakAkses.includes('edit')"
              type="button"
              title="Edit"
              color="brand"
              icon="PencilIcon"
              icon-size="sm"
              add-class="ml-2"
              @handleClick="edit(row)"
            />
            <BtnIcon
              v-if="hakAkses.includes('hapus')"
              type="button"
              title="Edit"
              color="red"
              icon="TrashIcon"
              icon-size="sm"
              add-class="ml-2"
              @handleClick="hapus(row)"
            />
          </div>
        </template>
      </TableComp>
    </div>

    <!-- modal -->
    <ModalComp
      :showing="modal"
      :show-close="true"
      @close="closeModal"
    >
      <div class="bg-white dark:bg-gray-900 shadow rounded-lg">
        <div class="px-4 py-5 sm:px-6">
          <h3 class="text-lg leading-6 dark:text-gray-300 font-medium">
            {{
              aksi === "tambah" ? "Tambah" : aksi === "edit" ? "Edit" : ""
            }}
            {{ setting.name }}
          </h3>
          <p class="mt-1 max-w-2xl text-sm text-gray-500">
            {{ setting.desc }}
          </p>
        </div>
        <div class="border-t border-gray-200 dark:border-gray-800">
          <form action="#" method="POST" @submit="onSubmit">
            <div class="shadow sm:rounded-md">
              <template
                v-for="(f, i) in dataForm"
                :key="i"
              >
                <div class="p-4">
                  <label
                    :for="`form-${f.slug}`"
                    class="block text-sm font-medium text-gray-700 dark:text-gray-300"
                  >
                    {{ f.label }}
                  </label>
                  <!-- input text -->
                  <input
                    v-if="f.type === 'text'"
                    :id="`form-${f.slug}`"
                    v-model="form[f.model]"
                    type="text"
                    class="t-form mt-2"
                    required
                    minlength="1"
                    maxlength="255"
                  >
                  <!-- input type v-select -->
                  <v-select
                    v-if="f.type === 'v-select'"
                    :id="`form-${f.slug}`"
                    v-model="form[f.model]"
                    :options="f.vSelectOptions"
                    :label="f.vSelectLabel"
                    :clearable="false"
                    :loading="f.vSelectLoading"
                  />
                </div>
              </template>
              <!-- submit -->
              <div class="px-4 py-3 text-right sm:px-6">
                <BtnWithIcon
                  type="submit"
                  title="Simpan"
                  color="brand"
                  :loading="submitLoading"
                  icon="CheckIcon"
                  add-class="inline-flex w-full sm:w-auto"
                >
                  Simpan
                </BtnWithIcon>
            </div>
            </div>
          </form>
        </div>
      </div>
    </ModalComp>

    <!-- modal hapus -->
    <ModalComp
      :showing="modalHapus"
      :show-close="true"
      @close="closeModal"
    >
      <div class="bg-white dark:bg-gray-900 px-4 pt-5 pb-4 sm:p-6 sm:pb-4 rounded-lg">
        <div class="sm:flex sm:items-start">
          <div
            class="
              mx-auto
              flex-shrink-0 flex
              items-center
              justify-center
              h-12
              w-12
              rounded-full
              bg-red-100
              dark:bg-red-900
              sm:mx-0 sm:h-10 sm:w-10
            "
          >
            <ExclamationTriangleIcon class="text-red-600 dark:text-red-300 h-5 w-5" />
          </div>
          <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
            <h3 class="text-lg leading-6 font-medium text-gray-900 dark:text-gray-300">
              Hapus Data
            </h3>
            <div class="mt-2">
              <p class="text-sm text-gray-500">
                Yakin ingin menghapus {{ setting.name.toLowerCase() }} {{ show.nama || '' }}? Data yang sudah
                dihapus tidak dapat dikembalikan
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
        <form action="" method="DELETE" @submit="onSubmit">
          <BtnWithIcon
            type="submit"
            title="Hapus"
            color="red"
            icon="CheckIcon"
            :loading="submitLoading"
            add-class=" inline-flex w-full sm:w-auto "
          >
            Ya, Hapus
          </BtnWithIcon>
        </form>
        <BtnWithIcon
          type="button"
          title="Batal"
          color="gray"
          icon="XMarkIcon"
          add-class=" inline-flex w-full sm:w-auto mr-2 mt-2 sm:mt-0"
          @handleClick="closeModal"
        >
          Batal
        </BtnWithIcon>
      </div>
    </ModalComp>
  </div>
</template>

<script>
import ModalComp from './../global/ModalComp.vue'
import TableComp from './../global/TableComp.vue'
import BtnWithIcon from './../global/BtnWithIcon.vue'
import BtnIcon from './../global/BtnIcon.vue'
import { ArrowLeftIcon, ExclamationTriangleIcon } from '@heroicons/vue/24/outline'
import 'vue-select/dist/vue-select.css'

export default {
  components: {
    ModalComp,
    TableComp, BtnWithIcon, BtnIcon,
    ArrowLeftIcon, ExclamationTriangleIcon
  },
  props: {
    columns: {
      type: Array,
      default: [
        { label: 'ID', field: 'id', sortable: true},
        { label: 'Nama', field: 'nama' },
        { label: 'Kode', field: 'kode' },
        { label: 'Aksi', field: 'aksi' }
      ]
    },
    setting: {
      type: Object,
      default: {
        name: '',
        title: 'Master Data',
        desc: 'Master Data'
      }
    },
    groupMenuId: {
      type: String,
      default: ''
    },
    dataForm: {
      type: Array,
      default: [
        {
          type: 'text',
          label: 'Nama',
          model: 'nama',
          slug: 'nama'
        },
        {
          type: 'text',
          label: 'Kode',
          model: 'kode',
          slug: 'kode'
        }
      ]
    },
    hakAkses: {
      type: Array,
      default: [
        'lihat',
        'tambah',
        'edit',
        'hapus'
      ]
    },
    tableSlot: {
      type: Array,
      default: []
    }
  },
  data () {
    return {
      items: [],
      tableLoading: false,

      // operasi
      modal: false,
      modalHapus: false,
      aksi: 'tambah',
      submitLoading: false,

      // form
      // form: {
      //   nama: '',
      //   kode: ''
      // },
      form: {},
      // data show
      show: {},

      // filter
      filter: {}
    }
  },
  mounted () {
    this.loadData()

    // set form
    this.dataForm.forEach((e) => {
      this.form[e.model] = ''

      if ('onChange' in e) {
        this.$watch('form.' + e.model, function (val, oldVal) {
          this.$emit('formOnChange', {
            func: e.onChange,
            params: {
              value: val,
              show: this.show
            }
          })
        })
      }
    })

    // watch

  },
  methods: {
    loadData () {
      this.tableLoading = true
      this.$emit('setLoading', true)

      let dispatch = this.$store.dispatch(`fetch${this.setting.name.replace(/ /g, '')}`)
      if (this.filter) {
        dispatch = this.$store.dispatch(`fetch${this.setting.name.replace(/ /g, '')}`, this.filter)
      }
      dispatch.then((res) => {
        this.tableLoading = false
        this.$emit('setLoading', false)
        if (res.data.status) {
          this.items = res.data.data
        } else {
          alert(res.data.message)
        }
      })
        .catch(() => {
          this.tableLoading = false
          this.$emit('setLoading', false)
          alert('error')
        })
    },
    resetForm () {
      Object.keys(this.form).forEach((e) => {
        this.form[e] = ''
      })
      this.show = {}
    },
    onSubmit (e) {
      e.preventDefault()
      const dispatch = `${this.aksi === 'tambah' ? 'add' : this.aksi === 'edit' ? 'update' : 'delete'}${this.setting.name.replace(/ /g, '')}`

      let formData = null
      if (['tambah', 'edit'].includes(this.aksi)) {
        formData = new FormData()
        this.dataForm.forEach((f) => {
          if (!('notSend' in f)) {
            if (['text', 'number'].includes(f.type)) {
              formData.append(f.model, this.form[f.model])
            } else if (f.type === 'v-select') {
              f.vSelectValue.forEach((g) => {
                formData.append(g.as, this.form[f.model][g.key])
              })
            }
          }
        })
      }

      if (this.aksi === 'edit') {
        formData.append('_method', 'PUT')
        formData = {
          id: this.show.id,
          form: formData
        }
      } else if (this.aksi === 'hapus') {
        formData = this.show.id
      }

      this.submitLoading = true
      this.$store.dispatch(dispatch, formData).then((res) => {
        this.submitLoading = false
        if (res.data.status) {
          this.closeModal()
          this.loadData()
        } else {
          alert(res.data.message)
        }
      })
        .catch(() => {
          this.submitLoading = false
          alert('error')
        })

      this.closeModal()
    },
    tambah () {
      this.resetForm()
      this.aksi = 'tambah'
      this.modal = true
    },
    edit (row) {
      this.aksi = 'edit'
      this.show = row
      this.dataForm.forEach((f) => {
        if (['text', 'number'].includes(f.type)) {
          this.form[f.model] = row[f.model]
        } else if (f.type === 'v-select') {
          const pk = f.vSelectValue.find((g) => g.type === 'pk')
          this.form[f.model] = f.vSelectOptions.find((g) => parseInt(g[pk.key]) === parseInt(row[f.model]) )
        }
      })
      
      this.modal = true
    },
    hapus (row) {
      this.aksi = 'hapus'
      this.show = row
      this.modalHapus = true
    },
    closeModal () {
      this.resetForm()
      this.aksi = 'tambah'
      this.modal = false
      this.modalHapus = false
    },
    manuallySetForm (data) {
      this.form[data.key] = data.value
    },
    setFilterAndLoadData (data) {
      this.filter = data
      this.loadData()
    }
  }
}
</script>