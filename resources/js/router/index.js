import {createRouter, createWebHistory} from 'vue-router'

import TailwindTrigger from '../pages/tailwind-trigger.vue'

import NotFound from '../pages/not-found.vue'

const Index = () => import('../pages/index.vue')
const Srj = () => import('../pages/skj.vue')
const SrjTambah = () => import('../pages/skj-tambah.vue')
const SrjEdit = () => import('../pages/skj-edit.vue')
const Triage = () => import('../pages/triage.vue')
const Resep = () => import('../pages/resep.vue')
const Laboratorium = () => import('../pages/laboratorium.vue')
const Tindakan = () => import('../pages/skj-tindakan.vue')
const TambahTindakan = () => import('../pages/tindakan-tambah.vue')
const EditTindakan = () => import('../pages/tindakan-edit.vue')
const Log = () => import('../pages/log.vue')

const RbacMenu = () => import('../pages/rbac/menu.vue')
const RbacRole = () => import('../pages/rbac/role.vue')
const RbacPermission = () => import('../pages/rbac/permission.vue')
const RbacUserRole = () => import('../pages/rbac/userrole.vue')
const RbacRolePermission = () => import('../pages/rbac/rolepermission.vue')

const routes = [
  { path: '/', name: 'index', component: Index },
  { path: '/spa', name: 'index', component: Index },
  { path: '/spa/skj', name: 'skj', component: Srj },
  { path: '/spa/skj/tambah', name: 'skj-tambah', component: SrjTambah },
  { path: '/spa/skj/edit/:id', name: 'skj-edit', component: SrjEdit },
  { path: '/spa/home', name: 'index', component: Index },
  { path: '/spa/triage', name: 'triage', component: Triage },
  { path: '/spa/resep', name: 'resep', component: Resep },
  { path: '/spa/laboratorium', name: 'laboratorium', component: Laboratorium },
  { path: '/spa/tindakan', name: 'tindakan', component: Tindakan },
  { path: '/spa/tindakan/tambah', name: 'tindakan-tambah', component: TambahTindakan },
  { path: '/spa/tindakan/edit/:id', name: 'tindakan-edit', component: EditTindakan },

  { path: '/spa/log', name: 'log', component: Log },

  { path: '/rbac/menu', name: 'rbac-menu', component: RbacMenu },
  { path: '/rbac/permission', name: 'rbac-permission', component: RbacPermission },
  { path: '/rbac/role', name: 'rbac-role', component: RbacRole },
  { path: '/rbac/userrole', name: 'rbac-userrole', component: RbacUserRole },
  { path: '/rbac/rolepermission', name: 'rbac-rolepermission', component: RbacRolePermission },

  { path: '/spa/tailwind-trigger', name: 'tailwind-trigger', component: TailwindTrigger },
  { path: '/:pathMatch(.*)*', name: 'not-found', component: NotFound },
]

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes
})

export default router;