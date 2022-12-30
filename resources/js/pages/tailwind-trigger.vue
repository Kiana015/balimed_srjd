<template>
  <div>
    <!-- 
      Taruh disini class tailwind yang gak kerender
      Ngasal Aja

      -->
    <div class="sm:grid sm:grid-cols-5 sm:gap-4"><div class="bg-white dark:bg-gray-800 border border-gray-200 shadow-sm rounded-lg overflow-hidden"><span class="block text-center p-4 text-2xl font-bold bg-yellow-100 text-yellow-900">24</span><span class="block text-center font-bold p-2">Total Pasien</span></div><div class="bg-white dark:bg-gray-800 border border-gray-200 shadow-sm rounded-lg overflow-hidden"><span class="block text-center p-4 text-2xl font-bold bg-green-100 text-green-900">5.3</span><span class="block text-center font-bold p-2">Waktu Layanan</span></div><div class="bg-white dark:bg-gray-800 border border-gray-200 shadow-sm rounded-lg overflow-hidden"><span class="block text-center p-4 text-2xl font-bold bg-orange-100 text-orange-900">12</span><span class="block text-center font-bold p-2">Umum</span></div><div class="bg-white dark:bg-gray-800 border border-gray-200 shadow-sm rounded-lg overflow-hidden"><span class="block text-center p-4 text-2xl font-bold bg-slate-100 text-slate-900">9</span><span class="block text-center font-bold p-2">BPJS</span></div><div class="bg-white dark:bg-gray-800 border border-gray-200 shadow-sm rounded-lg overflow-hidden"><span class="block text-center p-4 text-2xl font-bold bg-purple-100 text-purple-900">3</span><span class="block text-center font-bold p-2">Kerja Sama</span></div></div>
    
    <button type="submit" title="Hapus" class="group
        relative
        flex
        justify-center
        pt-2
        pb-2
        pl-12
        pr-4
        rounded-md
        shadow-sm
        text-sm
        leading-4
        font-medium
        focus:outline-none
        focus:ring-2
        focus:ring-offset-2
      
          text-white
          border border-transparent
          focus:ring-orange-500
        
            bg-orange-500
            hover:bg-orange-500
            cursor-not-allowed
            inline-flex w-full sm:w-auto" disabled=""><span class="absolute left-0 inset-y-0 flex items-center pl-3"><svg class="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"><circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle><path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path></svg></span> Ya, Selesai </button>

    <!-- stat pasien -->
    <div class="sm:grid sm:grid-cols-5 sm:gap-4"><div class="border
        border-gray-200
        dark:border-gray-700
        shadow-sm
        rounded-lg
        overflow-hidden
        bg-yellow-600
        dark:bg-yellow-900
        p-4
        h-24
        mb-2
        sm:mb-0
        relative"><div class="absolute z-10"><span class="block
            text-2xl
            font-bold
            text-yellow-100">3</span><span class="block
            text-base
            text-yellow-100">Total Antrian</span></div><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true" class="absolute w-20 h-20 right-0 bottom-0 text-yellow-700"><path stroke-linecap="round" stroke-linejoin="round" d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z"></path></svg></div><div class="border
        border-gray-200
        dark:border-gray-700
        shadow-sm
        rounded-lg
        overflow-hidden
        bg-orange-600
        dark:bg-orange-900
        p-4
        h-24
        mb-2
        sm:mb-0
        relative"><div class="absolute z-10"><span class="block
            text-2xl
            font-bold
            text-orange-100">2</span><span class="block
            text-base
            text-orange-100">Pasien Umum</span></div><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true" class="absolute w-20 h-20 right-0 bottom-0 text-orange-700"><path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 002.625.372 9.337 9.337 0 004.121-.952 4.125 4.125 0 00-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 018.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0111.964-3.07M12 6.375a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zm8.25 2.25a2.625 2.625 0 11-5.25 0 2.625 2.625 0 015.25 0z"></path></svg></div><div class="border
        border-gray-200
        dark:border-gray-700
        shadow-sm
        rounded-lg
        overflow-hidden
        bg-slate-600
        dark:bg-slate-900
        p-4
        h-24
        mb-2
        sm:mb-0
        relative"><div class="absolute z-10"><span class="block
            text-2xl
            font-bold
            text-slate-100">1</span><span class="block
            text-base
            text-slate-100">Pasien BPJS</span></div><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true" class="absolute w-20 h-20 right-0 bottom-0 text-slate-700"><path stroke-linecap="round" stroke-linejoin="round" d="M8.25 21v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21m0 0h4.5V3.545M12.75 21h7.5V10.75M2.25 21h1.5m18 0h-18M2.25 9l4.5-1.636M18.75 3l-1.5.545m0 6.205l3 1m1.5.5l-1.5-.5M6.75 7.364V3h-3v18m3-13.636l10.5-3.819"></path></svg></div><div class="border
        border-gray-200
        dark:border-gray-700
        shadow-sm
        rounded-lg
        overflow-hidden
        bg-purple-600
        dark:bg-purple-900
        p-4
        h-24
        mb-2
        sm:mb-0
        relative"><div class="absolute z-10"><span class="block
            text-2xl
            font-bold
            text-purple-100">0</span><span class="block
            text-base
            text-purple-100">Kerja Sama</span></div><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true" class="absolute w-20 h-20 right-0 bottom-0 text-purple-700"><path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 002.625.372 9.337 9.337 0 004.121-.952 4.125 4.125 0 00-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 018.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0111.964-3.07M12 6.375a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zm8.25 2.25a2.625 2.625 0 11-5.25 0 2.625 2.625 0 015.25 0z"></path></svg></div><div class="border
        border-gray-200
        dark:border-gray-700
        shadow-sm
        rounded-lg
        overflow-hidden
        bg-green-600
        dark:bg-green-900
        p-4
        h-24
        mb-2
        sm:mb-0
        relative"><div class="absolute z-10"><span class="block
            text-2xl
            font-bold
            text-green-100">55.13</span><span class="block
            text-base
            text-green-100">Waktu Layanan</span></div><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true" class="absolute w-20 h-20 right-0 bottom-0 text-green-700"><path stroke-linecap="round" stroke-linejoin="round" d="M12 6v6h4.5m4.5 0a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg></div></div>


    <div
      class="
        group
        relative
        flex
        justify-center
        pt-2
        pb-2
        pl-12
        pr-4
        rounded-md
        shadow-sm
        text-sm
        leading-4
        font-medium
        focus:outline-none focus:ring-2 focus:ring-offset-2
        text-white
        border border-transparent
        focus:ring-green-500
        bg-green-600
        hover:bg-green-700
        null
      "
    ></div>
<span class="px-2
        inline-flex
        text-xs
        leading-5
        bg-green-100
        dark:bg-green-800
        text-green-800
        dark:text-green-100
        rounded-full
        whitespace-nowrap
        null"> Pasien Dilayani </span>
    <button
      type="button"
      title="Title"
      class="
        group
        relative
        flex
        justify-center
        pt-2
        pb-2
        pl-12
        pr-4
        rounded-md
        shadow-sm
        text-sm
        leading-4
        font-medium
        focus:outline-none focus:ring-2 focus:ring-offset-2
        text-white
        border border-transparent
        focus:ring-indigo-500
        bg-indigo-600
        hover:bg-indigo-700
        inline-flex
        w-full
        sm:w-auto
      "
    >
      <span class="absolute left-0 inset-y-0 flex items-center pl-3"></span>
      Simpan
    </button>
    <button
      type="submit"
      title="Title"
      class="
        group
        relative
        flex
        justify-center
        pt-2
        pb-2
        pl-12
        pr-4
        rounded-md
        shadow-sm
        text-sm
        leading-4
        font-medium
        focus:outline-none focus:ring-2 focus:ring-offset-2
        text-white
        border border-transparent
        focus:ring-indigo-500
        bg-indigo-500
        hover:bg-indigo-500
        cursor-not-allowed
        inline-flex
        w-full
        sm:w-auto
      "
      disabled=""
    >
      <span class="absolute left-0 inset-y-0 flex items-center pl-3"
        ><svg
          class="animate-spin -ml-1 mr-3 h-5 w-5 text-white"
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
        >
          <circle
            class="opacity-25"
            cx="12"
            cy="12"
            r="10"
            stroke="currentColor"
            stroke-width="4"
          ></circle>
          <path
            class="opacity-75"
            fill="currentColor"
            d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
          ></path></svg
      ></span>
      Simpan
    </button>
    <button type="submit" title="Hapus" class="group
        relative
        flex
        justify-center
        pt-2
        pb-2
        pl-4
        pr-4
        rounded-md
        shadow-sm
        text-sm
        leading-4
        font-medium
        focus:outline-none
        focus:ring-2
        focus:ring-offset-2
      
          text-white
          border border-transparent
          focus:ring-red-500
        
            bg-red-500
            hover:bg-red-500
            cursor-not-allowed
            inline-flex w-full sm:w-auto" disabled=""><span class="absolute left-0 inset-y-0 flex items-center pl-3"><svg class="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"><circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle><path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path></svg></span> Ya, Hapus </button>
    <span class="bg-dark-600"></span>
    <span class="px-2
        inline-flex
        text-xs
        leading-5
        bg-indigo-100
        dark:bg-indigo-800
        text-indigo-800
        dark:text-indigo-100
        rounded-full
        whitespace-nowrap
        null">Ya</span>
    <span class="px-2
        inline-flex
        text-xs
        leading-5
        bg-red-100
        dark:bg-red-800
        text-red-800
        dark:text-red-100
        rounded-full
        whitespace-nowrap
        null">Tidak</span>
    <button type="button" title="Edit" class="py-2
        px-2
        text-sm
        font-medium
        rounded-md
        focus:outline-none
        focus:ring-2
        focus:ring-offset-2
      
          text-white
          border border-transparent
          focus:ring-brand-500
        
            bg-brand-600
            hover:bg-brand-700
           ml-2"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true" class="w-5 h-5"><path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L6.832 19.82a4.5 4.5 0 01-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 011.13-1.897L16.863 4.487zm0 0L19.5 7.125"></path></svg></button>
    <button type="button" title="Edit" class="py-2
        px-2
        text-sm
        font-medium
        rounded-md
        focus:outline-none
        focus:ring-2
        focus:ring-offset-2
      
          text-white
          border border-transparent
          focus:ring-red-500
        
            bg-red-600
            hover:bg-red-700
           ml-2"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true" class="w-5 h-5"><path stroke-linecap="round" stroke-linejoin="round" d="M16.023 9.348h4.992v-.001M2.985 19.644v-4.992m0 0h4.992m-4.993 0l3.181 3.183a8.25 8.25 0 0013.803-3.7M4.031 9.865a8.25 8.25 0 0113.803-3.7l3.181 3.182m0-4.991v4.99"></path></svg></button>
  </div>
</template>