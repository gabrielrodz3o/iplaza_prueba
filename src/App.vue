<template>
  <v-app id="inspire">
    <!-- BARRA SUPERIOR -->
    <AppBar v-if="logueado==true" />
    <v-main>
      <v-slide-y-transition mode="out-in">
        <router-view />
      </v-slide-y-transition>
    </v-main>
  </v-app>
</template>

<script>
import AppBar from "./components/AppBar.vue";
export default {
  name: "App",
  data() {
    return {
      drawer: null,
    };
  },
  components: {
    AppBar,
  },

  created() {
    this.$store.dispatch("autoLogin");
  },
  computed: {
    //VERIFICAR SI EL USUARIO ESTA LOGUEADO
    logueado() {
       if( localStorage.getItem("user")>0){
          return true
       }
       else{
            return false
       }
      //return localStorage.getItem("user");
    },
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
