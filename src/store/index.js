import Vuex from 'vuex'
import Vue from 'vue'
import router from '../router/router'
Vue.use(Vuex)
export default new Vuex.Store({
    state: {
      token: null,
      user:null
    }
    ,
    mutations: {
      setToken(state,token){
        state.token=token
      
      },
      setUsuario(state,user){
        state.user=user
      }
    },
    actions: {
  
      guardarToken({commit},token){
        commit("setToken", token)
        commit("setUsuario", localStorage.getItem("user"))
        localStorage.setItem("token", token)
        router.push({ name: "Dashboard" });
        location.reload()                   
  
      },
      autoLogin({commit}){
        let token = localStorage.getItem("token")
        if (token){
          commit("setToken", token)
          commit("setUsuario",  localStorage.getItem("user"))
          
        }
        
    
  
      },
      salir({commit}){
        commit("setToken", null)
        commit("setUsuario", null)
             localStorage.clear()
             location.reload()
            router.push('/');

        
  
      }
    },
    modules: {
    }
  })