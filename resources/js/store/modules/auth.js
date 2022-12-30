const state = {
  user: {},
  // role admin bisa pilih menjadi dokter siapa
  dokterAktif: {}
}

const mutations = {
	['SET_USER'](state, data) {
		state.user = data
	},
	['SET_DOKTER_AKTIF'](state, data) {
		state.dokterAktif = data
	}
}

const actions = {
  fetchUser ({ getters }) {
    return axios.get('/api/user')
  },
  fetchUserBooking ({ getters }) {
    return axios.get('https://bookingbmd.b1nus.com/api/user')
  },
  changeRole ({ getters }, id) {
    return axios.get(`/rbac/rbac/changeRoleActive/${id}`)
  }
}

const getters = {}

export default {
  state,
  mutations,
  actions,
  getters
}