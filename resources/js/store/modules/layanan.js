import errorHandlingAxios from "../../utils/errorHandlingAxios"

const ActionType = {
  SET_LOADING_SIMPAN_LAYANAN: 'SET_LOADING_SIMPAN_LAYANAN',
  SET_LOADING_SHOW_LAYANAN: 'SET_LOADING_SHOW_LAYANAN',
  SET_LAYANAN_SHOW: 'SET_LAYANAN_SHOW',
}

const state = {
  loadingShow: false,
  layananShow: {},
  loadingSimpan: false
}

const mutations = {
	[ActionType.SET_LOADING_SHOW_LAYANAN](state, data) {
		state.loadingShow = data
	},
	[ActionType.SET_LAYANAN_SHOW](state, data) {
		state.layananShow = data
	},
	[ActionType.SET_LOADING_SIMPAN_LAYANAN](state, data) {
		state.loadingSimpan = data
	}
}

const actions = {
  async asyncShowLayanan ({ commit, getters }, id) {
    commit(ActionType.SET_LOADING_SHOW_LAYANAN, true)
    try {
      const res = await await axios.get(`/api/layanan/${id}`)
      if (res.data.status) {
        commit(ActionType.SET_LAYANAN_SHOW, res.data.data || {})
      } else {
        alert(res.data.message)
      }
    } catch (error) {
      const { statusCode, message } = errorHandlingAxios(error)
      if (statusCode === 404) {
        // tidak isi alert
        commit(ActionType.SET_LAYANAN_SHOW, {})
        commit(ActionType.SET_LOADING_SHOW_LAYANAN, false)
        return false
      }
      alert(`${message} [${statusCode}]`)
      
    }
    commit(ActionType.SET_LOADING_SHOW_LAYANAN, false)
  },
  async asyncUpdateLayanan ({ commit, getters }, data) {
    commit(ActionType.SET_LOADING_SIMPAN_LAYANAN, true)
    try {
      const res = await await axios.post(`/api/layanan/${data.id}`, data.form)
      if (res.data.status) {
        // nothing
      } else {
        alert(res.data.message)
      }
    } catch (error) {
      const { statusCode, message } = errorHandlingAxios(error)
      alert(`${message} [${statusCode}]`)
    }
    commit(ActionType.SET_LOADING_SIMPAN_LAYANAN, false)
  },
}

const getters = {
}

export default {
  state,
  mutations,
  actions,
  getters
}