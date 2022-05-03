import Router from "vue-router";
import Vue from "vue";
import Login from "../views/Login.vue";
import Dashboard from "../views/Dashboard.vue";
import Employes from "../views/Employes.vue";
import User from "../views/User.vue";
Vue.use(Router);
const routes = [
  {
    path: "/dashboard",
    name: "Dashboard",
    component: Dashboard,
    meta: {
      ACESS: true,
    },
  },
  {
    path: "/employes",
    name: "Employes",
    component: Employes,
    meta: {
      ACESS: true,
    },
  },
  {
    path: "/users",
    name: "User",
    component: User,
    meta: {
      ACESS: true,
    },
  },
  {
    path: "/login",
    name: "Login",
    component: Login,
    meta: {
      libre: true,
    },
  },
];
const router = new Router({
  base: process.env.BASE_URL,
  routes,
});
router.beforeEach((to, from, next) => {
  if (to.matched.some((record) => record.meta.libre)) {
    next();
  } else if (localStorage.getItem("user") > 0) {
    if (to.matched.some((record) => record.meta.ACESS)) {
      next();
    }
  } else {
    next({
      name: "Login",
    });
  }
});

export default router;
