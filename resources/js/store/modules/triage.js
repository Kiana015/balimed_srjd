import errorHandlingAxios from "../../utils/errorHandlingAxios"

const ActionType = {
  SET_LOADING_SHOW_TRIAGE: 'SET_LOADING_SHOW_TRIAGE',
  SET_TRIAGE_SHOW: 'SET_TRIAGE_SHOW',
  SET_LOADING_SIMPAN_TRIAGE: 'SET_LOADING_SIMPAN_TRIAGE',
  SET_WIDGET_TRIAGE: 'SET_WIDGET_TRIAGE',
  SET_LOADING_WIDGET_TRIAGE: 'SET_LOADING_WIDGET_TRIAGE'
}

const state = {
  loadingShow: false,
  triageShow: {},
  loadingSimpan: false,
  loadingWidget: true,
  widget: {
    yesNo: [],
    yesNoReverse: [],
    kedatangan: [],
    jenisAlergi: [
      { nama: 'Obat', kode: '1', model: 'alergi_obat_id'},
      { nama: 'Makanan', kode: '2', model: 'alergi_makanan_id'},
      { nama: 'Udara', kode: '3', model: 'alergi_udara_id'},
      { nama: 'Debu', kode: '4', model: 'alergi_debu_id'},
      { nama: 'Lainnya', kode: '5', model: 'alergi_lainnya_id'},
    ],
    doaTraumaObstetri: [],
    statusPsikologi: [],
    nyeri: [],
    nyeriDurasi: [],
    resikoJatuh: [],
    jalanNafas: [],
    pernafasan: [],
    sirkulasi: [],
    kesadaran: [],
    kesimpulanTriage: [],
    gcs: []
  }
}

const mutations = {
	[ActionType.SET_LOADING_SHOW_TRIAGE](state, data) {
		state.loadingShow = data
	},
	[ActionType.SET_TRIAGE_SHOW](state, data) {
		state.triageShow = data
	},
	[ActionType.SET_LOADING_SIMPAN_TRIAGE](state, data) {
		state.loadingSimpan = data
	},
	[ActionType.SET_WIDGET_TRIAGE](state, data) {
		state.widget = data
	},
	[ActionType.SET_LOADING_WIDGET_TRIAGE](state, data) {
		state.loadingWidget = data
	},
}

const actions = {
  async asyncShowTriageByLayananId ({ commit, getters }, id) {
    commit(ActionType.SET_LOADING_SHOW_TRIAGE, true)
    try {
      const res = await axios.get(`/api/triage/show-by-layanan-id/${id}`)
      if (res.data.status) {
        commit(ActionType.SET_TRIAGE_SHOW, res.data.data || {})
      } else {
        alert(res.data.message)
      }
    } catch (error) {
      const { statusCode, message } = errorHandlingAxios(error)
      if (statusCode === 404) {
        // tidak isi alert
        commit(ActionType.SET_TRIAGE_SHOW, {})
        commit(ActionType.SET_LOADING_SHOW_TRIAGE, false)
        return false
      }
      alert(`${message} [${statusCode}]`)
    }
    commit(ActionType.SET_LOADING_SHOW_TRIAGE, false)
  },
  async asyncStoreTriage({ commit, getters }, data) {
    commit(ActionType.SET_LOADING_SIMPAN_TRIAGE, true)
    try {
      const res = await axios.post('/api/triage', data)
      if (res.data.status) {
        // nothing
      } else {
        alert(res.data.message)
      }
    } catch (error) {
      const { statusCode, message } = errorHandlingAxios(error)
      alert(`${message} [${statusCode}]`)
    }
    commit(ActionType.SET_LOADING_SIMPAN_TRIAGE, false)
  },
  async asyncUpdateTriage({ commit, getters }, data) {
    commit(ActionType.SET_LOADING_SIMPAN_TRIAGE, true)
    try {
      const res = await axios.post(`/api/triage/${data.id}`, data.form)
      if (res.data.status) {
        // nothing
      } else {
        alert(res.data.message)
      }
    } catch (error) {
      const { statusCode, message } = errorHandlingAxios(error)
      alert(`${message} [${statusCode}]`)
    }
    commit(ActionType.SET_LOADING_SIMPAN_TRIAGE, false)
  },
  async asyncFetchWidgetTriage ({ commit, getters }, params) {
    commit(ActionType.SET_LOADING_WIDGET_TRIAGE, true)
    const widget = { ...getters.getWidgetTriage }
    const widgetVar = [
      { slug: 'ya-tidak', key: 'yesNo' },
      { slug: 'kedatangan-ugd', key: 'kedatangan' },
      { slug: 'doa-trauma-obstetri', key: 'doaTraumaObstetri' },
      { slug: 'status-psikologi', key: 'statusPsikologi' },
      { slug: 'nyeri-nilai', key: 'nyeri' },
      { slug: 'waktu-nyeri', key: 'nyeriDurasi' },
      { slug: 'resiko-jatuh', key: 'resikoJatuh' },
      { slug: 'jalan-nafas', key: 'jalanNafas' },
      { slug: 'pernafasan', key: 'pernafasan' },
      { slug: 'sirkulasi', key: 'sirkulasi' },
      { slug: 'kesadaran', key: 'kesadaran' },
      { slug: 'kesimpulan-triage', key: 'kesimpulanTriage' },
    ]
    const widgetJalanNafasModel = ['jn_obstruksi', 'jn_parsial_obstruksi', 'jn_paten']
    const widgetPernafasanModel = ['pn_henti_nafas', 'pn_distres_berat', 'pn_nafas_berat', 'pn_distres_ringan', 'pn_nafas_normal']
    const widgetSirkulasiModel = ['sk_henti_jantung', 'sk_gangguan_hmd', 'sk_pendarahan_tt', 'sk_gangguan_hmd_rs', 'sk_nadi_kuat', 'sk_frek_nadi_normal', 'sk_td_normal']
    
    const slugWidget = widgetVar.map(e => e.slug).join(',')
    const res = await axios.get(`/api/master/get-multi/${slugWidget}`)

    if (res.data.status) {
      widgetVar.forEach((e, i) => {
        widget[e.key] = res.data.data[e.slug]
      })
      widget.yesNoReverse = res.data.data['ya-tidak']
      widget.jalanNafas.forEach((f, j) => {
        widget.jalanNafas[j].model = widgetJalanNafasModel[j]
      })
      widget.pernafasan.forEach((f, j) => {
        widget.pernafasan[j].model = widgetPernafasanModel[j]
      })
      widget.sirkulasi.forEach((f, j) => {
        widget.sirkulasi[j].model = widgetSirkulasiModel[j]
      })
      commit(ActionType.SET_WIDGET_TRIAGE, widget)
    } else {
      alert(res.data.message)
    }
    commit(ActionType.SET_LOADING_WIDGET_TRIAGE, false)
  },
}

const getters = {
  getWidgetTriage: (state) => state.widget
}

export default {
  state,
  mutations,
  actions,
  getters
}