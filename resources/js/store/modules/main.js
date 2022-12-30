const state = {
  sidebar: true,
  loadingPilihDokter: true,
  dataSubunit: [],
}

const mutations = {
	['SET_SIDEBAR'](state, data) {
		state.sidebar = data
	},
	['SET_LOADING_PILIH_DOKTER'](state, data) {
		state.loadingPilihDokter = data
	},
	['SET_DATA_SUBUNIT'](state, data) {
		state.dataSubunit = data
	}
}

const actions = {
  
}

const getters = {}

export default {
  state,
  mutations,
  actions,
  getters
}