import main from './modules/main'
import auth from './modules/auth'
import log from './modules/log'
import setupUnit from './modules/setup-unit'
import layanan from './modules/layanan'
import triage from './modules/triage'

const state = {
  state: {},
  mutations: {},
  action: {},
  modules: {
    main,
    auth,
    log,
    setupUnit,
    layanan,
    triage
  }
}
export default state