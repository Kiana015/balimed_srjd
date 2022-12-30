<template>
  <div>
    <form
      v-if="!loadingWidget"
      @submit="onSubmit"
    >
      <!-- header form -->
      <div
        class="
          rounded-t-lg p-4 text-white font-medium bg-brand-600
          cursor-pointer flex
        "
        role="button"
        @click="toggleTab(1)"
      >
        <h3 class="flex-1">Triage</h3>
        
        <ChevronUpIcon
          :class="`
            ${tabOpen.includes(1) ? '' : 'rotate-180 transform'}
            h-5 w-5 text-white transition-all
          `"
        />
      </div>

      <!-- body form -->
      <div
        :class="`
          relative
          rounded-b-lg
          bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-800
          ${tabOpen.includes(1) ? 'p-8' : 'p-0 opacity-0 h-0 overflow-hidden'}
          ${loadingSimpan ? 'animate-pulse' : ''}
        `"
      >
        <!-- kedatangan -->
        <FormHeaderToggle
          data-text="Kedatangan"
          :tab-id="11"
          :tab-open="tabOpen"
          @toggleTab="toggleTab"
        />
        <div
          :class="`
            ${tabOpen.includes(11) ? '' : 'opacity-0 h-0 overflow-hidden'}
          `"
        >
          <div class="form-row">
            <div class="font-medium p-2">
              Kedatangan
            </div>
            <div class="sm:col-span-3 p-2">
              <template
                v-for="f in widget.kedatangan"
                :key="f.id"
              >
                <label class="block cursor-pointer mr-4 mb-1">
                  <input
                    type="radio"
                    class="t-form-radio mr-2"
                    name="kedatangan"
                    v-model="formLayanan.jenis_kedatangan"
                    :value="f.kode"
                    :disabled="disabledForm"
                  />
                  <span>{{ f.nama }}</span>
                </label>
              </template>
            </div>
          </div>
          
          <!-- asal rujukan -->
          <div class="form-row">
            <div class="font-medium p-2">
              Asal Rujukan
            </div>
            <div class="sm:col-span-3 p-2">
              <textarea
                class="t-form"
                v-model="formLayanan.nama_dokter_perujuk"
                :disabled="disabledForm"
                placeholder="Asal rujukan"
              >
              </textarea>
            </div>
          </div>
          
          <!-- tanggal -->
          <div class="form-row">
            <div class="font-medium p-2">
              Tanggal dan Jam Kedatangan
            </div>
            <div class="p-2">
              <input
                type="date"
                class="t-form"
                :disabled="disabledForm"
                v-model="form.tanggal_datang"
              />
            </div>
            <div class="p-2">
              <input
                type="time"
                class="t-form"
                :disabled="disabledForm"
                v-model="form.jam_datang"
              />
            </div>
          </div>
        </div>

        <!-- riwayat -->
        <FormHeaderToggle
          data-text="Riwayat"
          :tab-id="12"
          :tab-open="tabOpen"
          @toggleTab="toggleTab"
        />
        <div
          :class="`
            ${tabOpen.includes(12) ? '' : 'opacity-0 h-0 overflow-hidden'}
          `"
        >
          <!-- keluhan utama -->
          <div class="form-row">
            <div class="font-medium p-2">
              Keluhan Utama
            </div>
            <div class="sm:col-span-3 p-2">
              <textarea
                class="t-form"
                v-model="form.keluhan_utama"
                :disabled="disabledForm"
                placeholder="Keluhan Utama"
              >
              </textarea>
            </div>
          </div>
          <!-- riwayat -->
          <div class="form-row">
            <div class="font-medium p-2">
              Riwayat Penyakit Dahulu
            </div>
            <div class="sm:col-span-3 p-2">
              <textarea
                class="t-form"
                v-model="form.riwayat_penyakit_dahulu"
                :disabled="disabledForm"
                placeholder="Riwayat Penyakit Dahulu"
              >
              </textarea>
            </div>
          </div>
          <!-- riwayat alertgi -->
          <div class="form-row">
            <div class="font-medium p-2">
              Riwayat Alergi
            </div>
            <div class="sm:col-span-3 p-2">
              <div class="mb-2">
                <template
                  v-for="f in widget.yesNoReverse"
                  :key="f.id"
                >
                  <label class="cursor-pointer mr-4">
                    <input
                      type="radio"
                      class="t-form-radio mr-2"
                      name="alergi_id"
                      v-model="form.alergi_id"
                      :value="f.kode"
                      :disabled="disabledForm"
                    />
                    <span>{{ f.status }}</span>
                  </label>
                </template>
              </div>
              <div v-if="form.alergi_id === 1" class="mb-2">
                <template
                  v-for="f in widget.jenisAlergi"
                  :key="f.id"
                >
                  <label class="cursor-pointer mr-4">
                    <input
                      type="checkbox"
                      class="t-form-radio mr-2"
                      name="alergi_id"
                      v-model="form[f.model]"
                      :value="1"
                      :disabled="disabledForm"
                    />
                    <span>{{ f.nama }}</span>
                  </label>
                </template>
              </div>
              <textarea
                v-if="form.alergi_id === 1"
                class="t-form"
                v-model="form.alergi_des"
                placeholder="Jelaskan"
                :disabled="disabledForm"
              >
              </textarea>
            </div>
          </div>
        </div>

        <!-- tanda tanda vital -->
        <FormHeaderToggle
          data-text="Tanda - Tanda Vital"
          :tab-id="13"
          :tab-open="tabOpen"
          @toggleTab="toggleTab"
        />
        <div
          :class="`
            ${tabOpen.includes(13) ? '' : 'opacity-0 h-0 overflow-hidden'}
          `"
        >
          <!-- tanda tanda vital -->
          <div class="form-row">
            <div class="font-medium p-2">
              Tanda - tanda vital
            </div>
            <div class="sm:col-span-3 p-2 sm:grid sm:grid-cols-4 gap-4">
              <label>
                <span class="font-medium">TD</span>
                <div class="relative my-2">
                  <div class="grid grid-cols-3 t-form p-0">
                    <input type="number" 
                    placeholder="Sistole" 
                    class="hide-arrows border-0 border-b border-transparent focus:ring-0 focus:border-b text-sm" 
                    v-model="form.tv_td_sistol" step=".01" required
                    :disabled="disabledForm" />
                    <input type="number" 
                    placeholder="Diastole" 
                    class="hide-arrows border-0 border-b border-transparent focus:ring-0 focus:border-b text-sm" 
                    v-model="form.tv_td_diastol" step=".01" required
                    :disabled="disabledForm" />
                  </div>
                  
                  <span class="block font-medium text-gray-400 mt-2 ml-2 absolute top-0 right-1 bg-white dark:bg-gray-800 px-2">
                    mm/hg
                  </span>
                </div>
              </label>

              <!-- dll -->
              <template
                v-for="f in [
                  { name: 'tv_rr', satuan: 'x/mnt', text: 'RR' },
                  { name: 'tv_nadi', satuan: 'x/mnt', text: 'Nadi' },
                  { name: 'tv_suhu', satuan: '°C', text: 'Suhu' },
                ]"
                :key="f.name"
              >
                <label>
                  <span class="font-medium">{{ f.text }}</span>
                  <div class="relative my-2">
                    <input type="number" class="t-form" v-model="form[f.name]" step=".01" required :disabled="disabledForm" />
                    <span class="block font-medium text-gray-400 mt-2 ml-2 absolute top-0 right-1 bg-white dark:bg-gray-800 px-2">
                      {{ f.satuan }}
                    </span>
                  </div>
                </label>
              </template>
            </div>
          </div>
          
          <!-- status psikologi -->
          <div class="form-row">
            <div class="font-medium p-2">
              Status Psikologi
            </div>
            <div class="sm:col-span-3 p-2 sm:flex">
              <template
                v-for="f in widget.statusPsikologi"
                :key="f.id"
              >
                <label class="block cursor-pointer mr-4 mb-1">
                  <input
                    type="radio"
                    class="t-form-radio mr-2"
                    name="statusPsikologi"
                    v-model="form.status_psi_nilai"
                    :value="f.kode"
                    :disabled="disabledForm"
                  />
                  <span>{{ f.nama }}</span>
                </label>
              </template>
            </div>
          </div>
          
          <!-- nyeri -->
          <div class="form-row">
            <div class="font-medium p-2">
              Penilaian Nyeri
            </div>
            <div class="sm:col-span-3 p-2 sm:flex">
              <template
                v-for="f in widget.nyeri"
                :key="f.id"
              >
                <label class="block cursor-pointer mr-4 mb-1">
                  <input
                    type="radio"
                    class="t-form-radio mr-2"
                    name="nyeri"
                    v-model="form.nyeri_nilai"
                    :value="f.kode"
                    :disabled="disabledForm"
                  />
                  <span>{{ f.nama }}</span>
                </label>
              </template>
            </div>
          </div>
          
          <!-- lokasi nyeri -->
          <div class="form-row">
            <div class="font-medium p-2">
              Lokasi Nyeri
            </div>
            <div class="sm:col-span-3 p-2">
              <input
                type="text"
                class="t-form mb-1"
                placeholder="Lokasi"
                v-model="form.nyeri_lokasi"
              />
            </div>
          </div>
          <!-- durasi nyeri -->
          <div class="form-row">
            <div class="font-medium p-2">
              Durasi Nyeri
            </div>
            <div class="sm:col-span-3 p-2 sm:flex">
              <template
                v-for="f in widget.nyeriDurasi"
                :key="f.id"
              >
                <label class="block cursor-pointer mr-4 mb-1">
                  <input
                    type="radio"
                    class="t-form-radio mr-2"
                    name="nyeri_durasi"
                    v-model="form.nyeri_durasi"
                    :value="f.kode"
                    :disabled="disabledForm"
                  />
                  <span>{{ f.nama }}</span>
                </label>
              </template>
            </div>
          </div>
          
          <!-- resiko jatuh -->
          <div class="form-row">
            <div class="font-medium p-2">
              Resiko Jatuh
            </div>
            <div class="p-2">
              <template
                v-for="f in widget.resikoJatuh"
                :key="f.id"
              >
                <label class="block cursor-pointer mr-4 mb-1">
                  <input
                    type="radio"
                    class="t-form-radio mr-2"
                    name="resiko_jatuh"
                    v-model="form.resiko_jatuh"
                    :value="f.kode"
                    :disabled="disabledForm"
                  />
                  <span>{{ f.nama }}</span>
                </label>
              </template>
            </div>
          </div>
        </div>
        
        
        <!-- pemeriksaan -->
        <FormHeaderToggle
          data-text="Pemeriksaan"
          :tab-id="14"
          :tab-open="tabOpen"
          @toggleTab="toggleTab"
        />
        <div
          :class="`
            ${tabOpen.includes(14) ? '' : 'opacity-0 h-0 overflow-hidden'}
          `"
        >
          <div class="overflow-x-auto">
            <div style="min-width: 768px">
              <table class="table-border-sm col-align-top">
                <thead>
                  <tr>
                    <th class="w-20">Pemeriksaan</th>
                    <th
                      :class="`
                        w-52
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[2].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <template
                        v-for="f in widget.kesimpulanTriage.slice(2, 3)"
                        :key="f.id"
                      >
                        <button
                          type="button"
                          class="w-full"
                          @click="form.kesimpulan_triage = f.kode"
                        >
                          <CheckIcon v-if="form.kesimpulan_triage === f.kode" class="w-5 h-5 inline-block text-green-600" />
                          {{ f.nama }}
                        </button>
                      </template>
                    </th>
                    <th
                      :class="`
                        w-52
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[1].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <template
                        v-for="f in widget.kesimpulanTriage.slice(1, 2)"
                        :key="f.id"
                      >
                        <button
                          type="button"
                          class="w-full"
                          @click="form.kesimpulan_triage = f.kode"
                        >
                          <CheckIcon v-if="form.kesimpulan_triage === f.kode" class="w-5 h-5 inline-block text-green-600" />
                          {{ f.nama }}
                        </button>
                      </template>
                    </th>
                    <th
                      :class="`
                        w-52
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[0].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <template
                        v-for="f in widget.kesimpulanTriage.slice(0, 1)"
                        :key="f.id"
                      >
                        <button
                          type="button"
                          class="w-full"
                          @click="form.kesimpulan_triage = f.kode"
                        >
                          <CheckIcon v-if="form.kesimpulan_triage === f.kode" class="w-5 h-5 inline-block text-green-600" />
                          {{ f.nama }}
                        </button>
                      </template>
                    </th>
                    <th
                      :class="`
                        w-52
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[3].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <template
                        v-for="f in widget.kesimpulanTriage.slice(3, 4)"
                        :key="f.id"
                      >
                        <button
                          type="button"
                          class="w-full"
                          @click="form.kesimpulan_triage = f.kode"
                        >
                          <CheckIcon v-if="form.kesimpulan_triage === f.kode" class="w-5 h-5 inline-block text-green-600" />
                          {{ f.nama }}
                        </button>
                      </template>
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      Jalan Napas
                    </td>
                    <td
                      :class="`
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[2].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <template
                        v-for="f in widget.jalanNafas.slice(0, 2)"
                        :key="f.id"
                      >
                        <label class="block cursor-pointer mr-4 mb-1">
                          <input
                            type="checkbox"
                            class="t-form-radio mr-2"
                            :name="`jalanNafas${f.id}`"
                            v-model="form[f.model]"
                            :value="1"
                            :disabled="disabledForm"
                          />
                          <span>{{ f.nama }}</span>
                        </label>
                      </template>
                    </td>
                    <td
                      :class="`
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[1].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <template
                        v-for="f in widget.jalanNafas.slice(2)"
                        :key="f.id"
                      >
                        <label class="block cursor-pointer mr-4 mb-1">
                          <input
                            type="checkbox"
                            class="t-form-radio mr-2"
                            :name="`jalanNafas${f.id}`"
                            v-model="form[f.model]"
                            :value="1"
                            :disabled="disabledForm"
                          />
                          <span>{{ f.nama }}</span>
                        </label>
                      </template>
                    </td>
                    <td
                      :class="`
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[0].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <template
                        v-for="f in widget.jalanNafas.slice(2)"
                        :key="f.id"
                      >
                        <label class="block cursor-pointer mr-4 mb-1">
                          <input
                            type="checkbox"
                            class="t-form-radio mr-2"
                            :name="`jalanNafas${f.id}`"
                            v-model="form[f.model]"
                            :value="1"
                            :disabled="disabledForm"
                          />
                          <span>{{ f.nama }}</span>
                        </label>
                      </template>
                    </td>
                    <!-- hitam satu kotak -->
                    <td
                      rowspan="4"
                      :class="`
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[3].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <label class="block cursor-pointer mr-4 mb-1">
                        <input
                          type="checkbox"
                          class="t-form-radio mr-2"
                          name="doa_tanda_hidup_minus"
                          v-model="form.doa_tanda_hidup_minus"
                          :value="1"
                          :disabled="disabledForm"
                        />
                        <span>Tanda kehidupan (-)</span>
                      </label>
                      <label class="block cursor-pointer mr-4 mb-1">
                        <input
                          type="checkbox"
                          class="t-form-radio mr-2"
                          name="doa_tidak_ada_denyut"
                          v-model="form.doa_tidak_ada_denyut"
                          :value="1"
                          :disabled="disabledForm"
                        />
                        <span>Tidak ada denyut nadi</span>
                      </label>
                      <label class="block cursor-pointer mr-4 mb-1">
                        <input
                          type="checkbox"
                          class="t-form-radio mr-2"
                          name="doa_rc_minmin"
                          v-model="form.doa_rc_minmin"
                          :value="1"
                          :disabled="disabledForm"
                        />
                        <span>RC (-/-)</span>
                      </label>
                      <label class="block cursor-pointer mr-4 mb-1">
                        <input
                          type="checkbox"
                          class="t-form-radio mr-2"
                          name="doa_ekg_flat"
                          v-model="form.doa_ekg_flat"
                          :value="1"
                          :disabled="disabledForm"
                        />
                        <span>EKG FLat</span>
                      </label>
                      <span class="text-gray-600 text-xs">Jam Doa</span>
                      <input
                        type="time"
                        v-model="form.doa_waktu"
                        class="t-form"
                        placeholder="Jam Doa"
                        :disabled="disabledForm"
                      />
                      <template
                        v-for="f in widget.doaTraumaObstetri"
                        :key="f.id"
                      >
                        <label class="block cursor-pointer mr-4 mb-1">
                          <input
                            type="radio"
                            class="t-form-radio mr-2"
                            name="doa_trauma_obsetri"
                            v-model="form.doa_trauma_obsetri"
                            :value="f.kode"
                            :disabled="disabledForm"
                          />
                          <span>{{ f.nama }}</span>
                        </label>
                      </template>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Pernafasan
                    </td>
                    <td
                      :class="`
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[2].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <template
                        v-for="f in widget.pernafasan.slice(0, 2)"
                        :key="f.id"
                      >
                        <label class="block cursor-pointer mr-4 mb-1">
                          <input
                            type="checkbox"
                            class="t-form-radio mr-2"
                            :name="`pernafasan${f.id}`"
                            v-model="form[f.model]"
                            :value="1"
                            :disabled="disabledForm"
                          />
                          <span>{{ f.nama }}</span>
                        </label>
                      </template>
                    </td>
                    <td
                      :class="`
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[1].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <template
                        v-for="f in widget.pernafasan.slice(2, 3)"
                        :key="f.id"
                      >
                        <label class="block cursor-pointer mr-4 mb-1">
                          <input
                            type="checkbox"
                            class="t-form-radio mr-2"
                            :name="`pernafasan${f.id}`"
                            v-model="form[f.model]"
                            :value="1"
                            :disabled="disabledForm"
                          />
                          <span>{{ f.nama }}</span>
                        </label>
                      </template>
                    </td>
                    <td
                      :class="`
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[0].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <template
                        v-for="f in widget.pernafasan.slice(3, 4)"
                        :key="f.id"
                      >
                        <label class="block cursor-pointer mr-4 mb-1">
                          <input
                            type="checkbox"
                            class="t-form-radio mr-2"
                            :name="`pernafasan${f.id}`"
                            v-model="form[f.model]"
                            :value="1"
                            :disabled="disabledForm"
                          />
                          <span>{{ f.nama }}</span>
                        </label>
                      </template>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Sirkulasi
                    </td>
                    <td
                      :class="`
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[2].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <template
                        v-for="f in widget.sirkulasi.slice(0, 3)"
                        :key="f.id"
                      >
                        <label class="block cursor-pointer mr-4 mb-1">
                          <input
                            type="checkbox"
                            class="t-form-radio mr-2"
                            :name="`pernafasan${f.id}`"
                            v-model="form[f.model]"
                            :value="1"
                            :disabled="disabledForm"
                          />
                          <span>{{ f.nama }}</span>
                        </label>
                      </template>
                    </td>
                    <td
                      :class="`
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[1].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <template
                        v-for="f in widget.sirkulasi.slice(3, 4)"
                        :key="f.id"
                      >
                        <label class="block cursor-pointer mr-4 mb-1">
                          <input
                            type="checkbox"
                            class="t-form-radio mr-2"
                            :name="`pernafasan${f.id}`"
                            v-model="form[f.model]"
                            :value="1"
                            :disabled="disabledForm"
                          />
                          <span>{{ f.nama }}</span>
                        </label>
                      </template>
                    </td>
                    <td
                      :class="`
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[0].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <template
                        v-for="f in widget.sirkulasi.slice(4)"
                        :key="f.id"
                      >
                        <label class="block cursor-pointer mr-4 mb-1">
                          <input
                            type="checkbox"
                            class="t-form-radio mr-2"
                            :name="`pernafasan${f.id}`"
                            v-model="form[f.model]"
                            :value="1"
                            :disabled="disabledForm"
                          />
                          <span>{{ f.nama }}</span>
                        </label>
                      </template>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <span class="block mb-1">Kesadaran</span>
                      <input
                        type="number"
                        class="t-form mb-1"
                        v-model="form.gcs_e"
                        placeholder="E"
                      />
                      <input
                        type="number"
                        class="t-form mb-1"
                        v-model="form.gcs_v"
                        placeholder="V"
                      />
                      <input
                        type="number"
                        class="t-form mb-1"
                        v-model="form.gcs_m"
                        placeholder="M"
                      />
                    </td>
                    <td
                      :class="`
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[2].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <template
                        v-for="f in widget.kesadaran.slice(0, 1)"
                        :key="f.id"
                      >
                        <label class="block cursor-pointer mr-4 mb-1">
                          <input
                            type="radio"
                            class="t-form-radio mr-2"
                            name="kesadaran"
                            v-model="form.ksd_gcs"
                            :value="f.kode"
                            :disabled="disabledForm"
                          />
                          <span>{{ f.nama }}</span>
                        </label>
                      </template>
                    </td>
                    <td
                      :class="`
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[1].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <template
                        v-for="f in widget.kesadaran.slice(1, 2)"
                        :key="f.id"
                      >
                        <label class="block cursor-pointer mr-4 mb-1">
                          <input
                            type="radio"
                            class="t-form-radio mr-2"
                            name="kesadaran"
                            v-model="form.ksd_gcs"
                            :value="f.kode"
                            :disabled="disabledForm"
                          />
                          <span>{{ f.nama }}</span>
                        </label>
                      </template>
                    </td>
                    <td
                      :class="`
                        ${form.kesimpulan_triage === widget.kesimpulanTriage[0].kode ? colorKesimpulanTriageSelected : ''}
                      `"
                    >
                      <template
                        v-for="f in widget.kesadaran.slice(2, 3)"
                        :key="f.id"
                      >
                        <label class="block cursor-pointer mr-4 mb-1">
                          <input
                            type="radio"
                            class="t-form-radio mr-2"
                            name="kesadaran"
                            v-model="form.ksd_gcs"
                            :value="f.kode"
                            :disabled="disabledForm"
                          />
                          <span>{{ f.nama }}</span>
                        </label>
                      </template>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <!-- keterangan -->
          <div class="form-row">
            <div class="font-medium p-2">
              Keterangan
            </div>
            <div class="sm:col-span-3 p-2">
              <textarea
                class="t-form"
                v-model="form.keterangan"
                :disabled="disabledForm"
                placeholder="Keterangan"
              >
              </textarea>
            </div>
          </div>
          <!-- kesimpulan -->
          <div class="form-row">
            <div class="font-medium p-2">
              Kesimpulan Triage
            </div>
            <div class="sm:col-span-3 p-2 sm:flex">
              <template
                v-for="f in widget.kesimpulanTriage"
                :key="f.id"
              >
                <label class="block cursor-pointer mr-4 mb-1">
                  <input
                    type="radio"
                    class="t-form-radio mr-2"
                    name="kesimpulan_triage"
                    v-model="form.kesimpulan_triage"
                    :value="f.kode"
                    :disabled="disabledForm"
                  />
                  <span>{{ f.nama }}</span>
                </label>
              </template>
            </div>
          </div>
        </div>
      </div>

      <button
        v-if="!noActionBtn"
        type="submit"
        title="Simpan"
        :class="`
          fixed
          z-10
          bottom-4
          right-4
          py-4
          rounded-full
          px-8
          ${loadingSimpan ? 'bg-green-400 cursor-not-allowed' : 'bg-green-600 hover:bg-green-400'}
          text-white
          shadow-md
        `"
        :disabled="disabledForm"
      >
        <SpinnerIcon
          v-if="loadingSimpan"
          variant="text-white"
          add-class=" inline "
        />
        <ClipboardDocumentCheckIcon v-else class="w-6 h-6 inline mr-2" />
        <span>Simpan Triage</span>
      </button>
    </form>
    <div v-if="loadingWidget" class="spinner-container">
      <div class="spinner" />
    </div>
    <!-- <div class="mt-8">
      <json-viewer :value="form" />
    </div>
    <div class="mt-8">
      <json-viewer :value="formLayanan" />
    </div> -->
  </div>
</template>

<script>
import { ClipboardDocumentCheckIcon, ChevronUpIcon, CheckIcon } from '@heroicons/vue/20/solid'
import FormHeaderToggle from './FormHeaderToggle.vue'
import SpinnerIcon from '@/components/global/SpinnerIcon.vue'

export default {
  components: {
    ClipboardDocumentCheckIcon,
    ChevronUpIcon,
    CheckIcon,
    FormHeaderToggle,
    SpinnerIcon
  },
  props: {
    pasien: {
      type: Object,
      default: {}
    },
    disabledForm: {
      type: Boolean,
      default: false
    },
    noActionBtn: {
      type: Boolean,
      default: false
    }
  },
  data () {
    return {
      tabOpen: [1, 11, 12, 13, 14],
      /**
       * Form
       */
      form: {
        tanggal_datang: '',
        jam_datang: '',
        keluhan_utama: '',
        riwayat_penyakit_dahulu: '',
        alergi_id: '',
        alergi_obat_id: '',
        alergi_makanan_id: '',
        alergi_udara_id: '',
        alergi_debu_id: '',
        alergi_des: '',
        doa_tanda_hidup_minus: '',
        doa_tidak_ada_denyut: '',
        doa_rc_minmin: '',
        doa_ekg_flat: '',
        doa_waktu: '',
        doa_trauma_obsetri: '',
        tv_td_sistol: '',
        tv_td_diastol: '',
        tv_rr: '',
        tv_nadi: '',
        tv_suhu: '',
        status_psi_nilai: '',
        nyeri_nilai: '',
        nyeri_lokasi: '',
        nyeri_durasi: '',
        resiko_jatuh: '',
        jalan_nafas: '',
        pernafasan: '',
        sirkulasi: '',
        kesadaran: '',
        gcs_e: '',
        gcs_v: '',
        gcs_m: '',
        keterangan: '',
        kesimpulan_triage: '',
        perawat_id: '',
        dokter_id: '',
        jn_obstruksi: '',
        jn_parsial_obstruksi: '',
        jn_paten: '',
        pn_henti_nafas: '',
        pn_distres_berat: '',
        pn_nafas_berat: '',
        pn_distres_ringan: '',
        pn_nafas_normal: '',
        sk_henti_jantung: '',
        sk_gangguan_hmd: '',
        sk_pendarahan_tt: '',
        sk_gangguan_hmd_rs: '',
        sk_nadi_kuat: '',
        sk_frek_nadi_normal: '',
        sk_td_normal: '',
        ksd_gcs: ''
      },
      formLayanan: {
        jenis_kedatangan: '',
        nama_dokter_perujuk: ''
      },

      /**
       * setting form
       */
      formCb: [
        'alergi_obat_id',
        'alergi_makanan_id',
        'alergi_udara_id',
        'alergi_debu_id',
        'doa_tanda_hidup_minus',
        'doa_tidak_ada_denyut',
        'doa_rc_minmin',
        'doa_ekg_flat',
        'jn_obstruksi',
        'jn_parsial_obstruksi',
        'jn_paten',
        'pn_henti_nafas',
        'pn_distres_berat',
        'pn_nafas_berat',
        'pn_distres_ringan',
        'pn_nafas_normal',
        'sk_henti_jantung',
        'sk_gangguan_hmd',
        'sk_pendarahan_tt',
        'sk_gangguan_hmd_rs',
        'sk_nadi_kuat',
        'sk_frek_nadi_normal',
        'sk_td_normal'
      ],
      colorKesimpulanTriageSelected: 'bg-gray-100'
    }
  },
  computed: {
    widget () {
      return this.$store.state.triage.widget
    },
    layananShow () {
      return this.$store.state.layanan.layananShow
    },
    /**
     * Jika belum loading widget, form tidak muncul.
     * alurnya, widget slalu harus ada sebelum show data
     */
    loadingWidget () {
      return this.$store.state.triage.loadingWidget
    },
    triageShow () {
      return this.$store.state.triage.triageShow
    },
    loadingSimpan () {
      return this.loadingSimpanTriage || 
      this.loadingShowTriage ||
      this.loadingSimpanLayanan || 
      this.loadingShowLayanan
    },
    loadingSimpanTriage () {
      return this.$store.state.triage.loadingSimpan
    },
    loadingShowTriage () {
      return this.$store.state.triage.loadingShow
    },
    loadingSimpanLayanan () {
      return this.$store.state.layanan.loadingSimpan
    },
    loadingShowLayanan () {
      return this.$store.state.layanan.loadingShow
    }
  },
  mounted () {
    this.initData()
  },
  methods: {
    async initData() {
      if (this.widget.yesNo.length === 0) {
        await this.loadWidget()
      }
      this.showData()
    },
    /**
     * dipanggil di parent, ketika ganti pasienAktif
     */
    showData () {
      this.showLayanan()
      this.showTriage()
    },
    async showLayanan () {
      await this.$store.dispatch('asyncShowLayanan', this.pasien.id)
      // set form
      this.formLayanan.jenis_kedatangan = this.layananShow.jenis_kedatangan
      this.formLayanan.nama_dokter_perujuk = this.layananShow.nama_dokter_perujuk
    },
    async showTriage () {
      await this.$store.dispatch('asyncShowTriageByLayananId', this.pasien.id)
      if (!('id' in this.triageShow)) {
        // jika belum ada data
        return false
      }
      // set form
      // form cb
      this.formCb.forEach((e) => {
        this.form[e] = this.triageShow[e] == 1
      })
      // form biasa
      Object.keys(this.form)
      .filter(e => !this.formCb.includes(e))
      .forEach((e) => {
        this.form[e] = this.triageShow[e] || ''
      })
    },
    async onSubmit (e) {
      e.preventDefault()
      /**
       * Simpan ke triage dan layanan (jenis_kedatangan, nama dokter perujuk)
       */
      const formData = new FormData()
      // form checkbox
      this.formCb.forEach((e) => {
        formData.append(e, this.form[e] ? 1 : 0)
      })
      // form biasa
      Object.keys(this.form)
      .filter(e => !this.formCb.includes(e))
      .forEach((e) => {
        formData.append(e, this.form[e] || '')
      })
      if (!('id' in this.triageShow)) {
        // jika tambah, masukkan layanan id, no_rm, nomor_registrasi
        formData.append('layanan_id', this.pasien.id)
        formData.append('no_rm', this.pasien.no_rm)
        formData.append('nomor_registrasi', this.pasien.nomor_registrasi)
      }
      
      let dispatch = 'asyncStoreTriage'
      let data = formData
      if ('id' in this.triageShow) {
        // update
        dispatch = 'asyncUpdateTriage'
        formData.append('_method', 'PUT')
        data = {
          id: this.triageShow.id,
          form: formData
        }
      }
      this.$store.dispatch(dispatch, data)

      /**
       * Update layanan
       */
      const formDataL = new FormData()
      formDataL.append('jenis_kedatangan', this.formLayanan.jenis_kedatangan)
      formDataL.append('nama_dokter_perujuk', this.formLayanan.nama_dokter_perujuk)
      formDataL.append('_method', 'PUT')
      await this.$store.dispatch('asyncUpdateLayanan', {
        id: this.pasien.id,
        form: formDataL
      })

      this.showData()
    },
    async loadWidget () {
      await this.$store.dispatch('asyncFetchWidgetTriage')
    },
    toggleTab (id) {
      const tabOpen = [...this.tabOpen]
      if (this.tabOpen.includes(id)) {
        tabOpen.splice(tabOpen.findIndex(e => e === id), 1)
      } else {
        tabOpen.push(id)
      }
      this.tabOpen = tabOpen
    }
  }
}
</script>