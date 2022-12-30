const state = {
  log: []
}

const mutations = {
  ['SET_LOG'](state, data) {
    state.log = data
  }
}

const actions = {
  fetchLog ({ getters }) {
    return axios.get('/api/log')
  },
  addLog ({ getters }, data) {
    return axios.post('/api/log', data)
  },
  updateLog ({ getters }, data) {
    return axios.post(`/api/log/${data.id}`, data.form)
  },
  deleteLog ({ getters }, id) {
    return axios.delete(`/api/log/${id}`)
  }
}
  
const getters = {}

export default {
  state,
  mutations,
  actions,
  getters
}
  