# Template RS

## Setup

1. Composer Install, Npm Install
2. Env ambil dari .env.example,
3. Di Env, ganti kredensial db sub sistem dan db utama.
4. Di Env, ganti sso id
```
CLIENT_SSO_ID=""
CLIENT_SSO_URL=""  
CLIENT_SSO_CALLBACK=""
CLIENT_SSO_SECRET=""  
CLIENT_SSO_SERVER="https://ssobmd.b1nus.com"
```
5. Menu RBAC silahkan akses ke link `/rbac/menu`
6. Ganti title tag pada `/resources/views/spa/app.blade.php`
7. Template ini mode tanpa auth supaya bisa langsung dicoba. Kalau mau isi auth, di `route/web.php` uncomment bagian `middleware(['auth'])`
8. Karena tanpa auth, user login dimanipulasi, setting di `UserController.php`
9. Database Utama => `database/db_utama.sql`
10. Database Sub sistem => `database/db_subsistem.sql`


## Laravel Vue JS Tailwind CSS
1. Jalankan php artisan serve, lalu npm run dev, kemudian buka `localhost:8000`
2. File Vue JS ada di folder `/resources/js`
3. Component (table button dll) ada di folder `/resources/js/component`

https://laravel.com/
https://vuejs.org/
https://tailwindcss.com/

## Contoh Form
1. Triage: Dipakai di UGD
2. E-Resep, Lab, Tindakan: Contoh Menggunakan Iframe

## Deployment
1. Setiap mau push (kalau ada perubahan di vue js) build project terlebih dahulu `npm run build`

## Components

### Tombol

Tombol dengan icon

```javascript
<BtnWithIcon
    icon="CheckIcon"
    color="green"
    title="Layani Pasien"
    icon-size="sm"
    @handleClick="layaniPasien(row)"
>
    Layani
</BtnWithIcon>
```

Tombol hanya icon

```javascript
<BtnIcon
    color="red"
    icon="TrashIcon"
    title="Hapus"
    @handleClick="deleteMarker(i)"
/>
```

### Tabel

Tabel sudah berisi fitur search, pagination, dan sort cukup panggil seperti ini

```javascript
<TableComp :columns="columns" :items="items" />
```

Columns adalah kolom tabel, items adalah data tabel

### Tabel Ajax

```javascript
<template>
  <TableComp
    :columns="columns"
    :items="items"
    :loading="tableLoading"
    mode="ajax"
    :ajax-filter="tableFilter"
    :ajax-meta="tableMeta"
    @setFilter="setFilter"
    @fetchData="loadPendudukData"
    @handleCheckbox="handleCheckbox"
  >
    <template #table-action>
      <div class="flex">
        <BtnWithIcon
          title="Tambah penduduk"
          icon="HeroiconsPlusIcon"
          icon-size="md"
          add-class="flex-1 sm:flex-none"
          @handleClick="tambah"
        >
          Tambah Penduduk
        </BtnWithIcon>
        <BtnIcon
          type="button"
          title="Refresh"
          color="gray"
          icon="HeroiconsRefreshIcon"
          icon-size="md"
          add-class="ml-2"
          @handleClick="loadPendudukData"
        />
      </div>
    </template>
    <template #checkbox_action>
      <BtnIcon
        v-if="tableDataChecked.length > 0"
        :title="'Hapus ' + tableDataChecked.length + '  penduduk'"
        color="red"
        add-class="ml-2"
        icon="HeroiconsTrashIcon"
        icon-size="md"
        :loading="hapusMultiLoading"
        @handleClick="hapusChecked"
      />
    </template>
    <template #checkbox="{ row }">
      <input
        v-model="tableDataChecked"
        :value="row.id_penduduk"
        :name="'cbPenduduk'"
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
    </template>
    <template #foto="{ row }">
      <span class="inline-block h-8 w-8 rounded-full overflow-hidden bg-gray-100">
        <img
          v-if="row.user && row.user.foto"
          :src="$axios.defaults.baseURL + '/api/file/' + row.user.foto"
          :alt="row.nama_lengkap"
        >
        <img
          v-else
          src="~assets/img/empty/avatar-1.png"
          alt=""
        >
      </span>
    </template>
    <template #nik="{ row }">
      <span class="text-gray-500 font-medium text-sm whitespace-nowrap">{{ row.nik }}</span>
    </template>
    <template #no_kk="{ row }">
      <span class="text-gray-500 font-medium text-sm whitespace-nowrap">{{ row.no_kk }}</span>
    </template>
    <template #tanggal_lahir="{ row }">
      {{ row.tempat_lahir }}, {{ $dateFormat(row.tanggal_lahir, 'd m Y') }}
    </template>
    <template #alamat="{ row }">
      {{ row.alamat }}, {{ row.nama_desa }}, {{ row.nama_kecamatan }}, {{ row.nama_kabkot }}
    </template>
    <template #akun="{ row }">
      <TheBadge
        v-if="row.user"
        color="green"
      >
        Ada
      </TheBadge>
      <TheBadge
        v-else
        color="red"
      >
        Tidak
      </TheBadge>
    </template>
    <template #aksi="{ row }">
      <div class="flex">
        <BtnIcon
          title="Edit"
          color="indigo"
          icon="HeroiconsPencilIcon"
          add-class="m-1"
          @handleClick="edit(row)"
        />
        <BtnIcon
          title="Hapus"
          color="red"
          icon="HeroiconsTrashIcon"
          add-class="m-1"
          @handleClick="hapus(row)"
        />
      </div>
    </template>
  </TableComp>
</template>

<script>
export default {
  data () {
    return {
      columns: [
        { label: '-', field: 'checkbox' },
        { label: 'Foto', field: 'foto' },
        { label: 'NIK', field: 'nik' },
        { label: 'Nomor KK', field: 'no_kk', sortable: true },
        { label: 'Nama Penduduk', field: 'nama_lengkap', sortable: true },
        { label: 'Tempat Tanggal Lahir', field: 'tanggal_lahir', sortable: true },
        { label: 'Alamat', field: 'alamat', sortable: true },
        { label: 'Akun Login', field: 'akun' },
        { label: 'Aksi', field: 'aksi' }
      ],
      items: [],
      tableDataChecked: [],
      tableLoading: true,
      doLoading: true,
      tableFilter: {
        sortKey: 'id_penduduk',
        sortOrder: 'desc',
        curPage: 1,
        perPage: 10,
        search: ''
      },
      tableMeta: {
        from: 1,
        to: 1,
        numPage: 1,
        total: 1
      }
    }
  }
}
</script>
```


## Update 09-12-2022
`APP_DEBUG` `.env` set false, tambahin bot telegram untuk cek error
`/app/Exceptions/Handler.php`
