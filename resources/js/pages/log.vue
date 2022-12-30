<template>
  <div class="pt-8" />
  <CrudBasic
    :setting="{
      name: 'Log',
      title: 'Master Data Log',
      desc: 'Master Data Log',
    }"
    :columns="[
      { label: 'ID', field: 'id', sortable: true},
      { label: 'Nama', field: 'nama_user', sortable: true },
      { label: 'Aksi', field: 'aksi', sortable: true },
      { label: 'Tabel', field: 'nama_tabel', sortable: true },
      { label: 'Keterangan', field: 'keterangan', sortable: true },
      { label: 'Tanggal', field: 'created_at', sortable: true }
    ]"
    :table-slot="['aksi', 'created_at']"
    :hak-akses="[
      'lihat',
    ]"
  >
    <template #table_col_aksi="{ row }">
      <span
        :class="`
          px-2 py-1
          font-medium
          text-white
          text-xs
          uppercase
          ${
            row.aksi == 1 ? 'bg-green-500'
            : row.aksi == 2 ? 'bg-brand-500'
            : row.aksi == 3 ? 'bg-orange-500'
            : row.aksi == 4 ? 'bg-red-500'
            : ''
          }
        `"
      >
        {{
          row.aksi == 1 ? 'create'
          : row.aksi == 2 ? 'read'
          : row.aksi == 3 ? 'update'
          : row.aksi == 4 ? 'delete'
          : ''
        }}
      </span>
    </template>
    <template #table_col_created_at="{ row }">
      {{ new Date(row.created_at).toLocaleString('id-ID', { dateStyle: 'long', timeStyle: 'long' }) }}
    </template>
  </CrudBasic>
</template>

<script>
import CrudBasic from './../components/layouts/CrudBasic.vue'

export default {
  components: {
    CrudBasic
  }
}
</script>
