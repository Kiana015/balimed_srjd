const state = {
  setupUnit: null
}

const mutations = {
	['SET_SETUP_UNIT'](state, data) {
		state.setupUnit = data
	},
}

const actions = {
  fetchSetupUnit ({ getters }) {
    return axios.get('/api/setup-unit')
  },
}

const getters = {}

export default {
  state,
  mutations,
  actions,
  getters
}