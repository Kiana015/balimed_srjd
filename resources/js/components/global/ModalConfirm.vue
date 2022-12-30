<template>
  <ModalComp
    :showing="modal"
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
          bg-orange-100
          dark:bg-orange-900
          sm:mx-0 sm:h-10 sm:w-10
          "
        >
          <ExclamationTriangleIcon class="text-orange-600 dark:orange-red-300 h-5 w-5" />
        </div>
        <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
          <h3 class="text-lg leading-6 font-medium text-gray-900 dark:orange-gray-300">
            {{ modalTitle }}
          </h3>
          <div class="mt-2">
            <p class="text-sm text-gray-500">
              <slot />
            </p>
          </div>
        </div>
      </div>
    </div>
    <div class="px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
      <!-- jika onsubmit menggunakan button -->
      <BtnWithIcon
        v-if="onYesWithButton"
        title="Hapus"
        color="orange"
        icon="CheckIcon"
        :loading="loadingOnYes"
        add-class=" inline-flex w-full sm:w-auto "
        @handleClick="handleOnYes"
      >
        {{ txtOnYes }}
      </BtnWithIcon>
      <form
        v-if="!onYesWithButton"
        @submit="handleOnYesOnSubmit"
      >
        <BtnWithIcon
          type="submit"
          title="Hapus"
          color="orange"
          icon="CheckIcon"
          :loading="loadingOnYes"
          add-class=" inline-flex w-full sm:w-auto "
        >
          {{ txtOnYes }}
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
        {{ txtCancel }}
      </BtnWithIcon>
    </div>
  </ModalComp>
</template>

<script>
import ModalComp from '../global/ModalComp.vue'
import BtnWithIcon from '../global/BtnWithIcon.vue'
import { ExclamationTriangleIcon } from '@heroicons/vue/24/outline'

export default {
  components: {
    ModalComp, BtnWithIcon,
    ExclamationTriangleIcon
  },
  props: {
    modal: {
      type: Boolean,
      default: false
    },
    modalTitle: {
      type: String,
      default: 'Konfirmasi'
    },
    /**
     * bisa pakai button saja, atau pakai form
     */
    onYesWithButton: {
      type: Boolean,
      default: false
    },
    loadingOnYes: {
      type: Boolean,
      default: false
    },
    txtOnYes: {
      type: String,
      default: 'Ok'
    },
    txtCancel: {
      type: String,
      default: 'Batal'
    }
  },
  methods: {
    closeModal () {
      this.$emit('closeModal')
    },
    handleOnYes () {
      this.$emit('handleOnYes')
    },
    handleOnYesOnSubmit (e) {
      this.$emit('handleOnYesOnSubmit', e)
    }
  }
}
</script>