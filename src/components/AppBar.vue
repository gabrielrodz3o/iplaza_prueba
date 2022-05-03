<template>
  <section>
      <!-- BARA IZQUIERDA MENU -->
    <v-navigation-drawer v-model="drawer"  fixed app>
      <v-list-item>
        <v-list-item-content class="text-center">
          <v-list-item-title class="text-h6"> IPLP </v-list-item-title>
          <v-list-item-subtitle > admin </v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-divider></v-divider>

      <v-list  nav>
          
          <!-- RUTAS EN EL MENU IZQUIERDO -->
        <v-list-item
        
          v-for="item in items"
          :key="item.title"
          :to="{ name: item.link }"
        >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-item @click="salir()">
          <v-list-item-icon>
            <v-icon> mdi-logout </v-icon>
          </v-list-item-icon>

          <v-list-item-title>Cerrar sesión</v-list-item-title>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar flat color="primary" app>
      <v-app-bar-nav-icon @click="drawer = !drawer">
        <v-icon color="white">mdi-menu</v-icon></v-app-bar-nav-icon
      >
     <!-- TOLBAR SUPERIOR -->
      <v-toolbar-title>
        <span style="color: white"> PRUEBA </span>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-col md="2"> </v-col>

      <span style="color: white"> Hola, </span>
      <v-avatar title="Ver perfil" size="45" class="ml-2"> </v-avatar>
    </v-app-bar>
  </section>
</template>
<script>
export default {
  name: "App",
  data() {
    return {
      drawer: null,
      items: [
        { title: "Inicio", icon: "mdi-view-dashboard", link: "Dashboard" },
        { title: "Empleados", icon: "mdi-account", link: "Employes" },
        { title: "Usuarios", icon: "mdi-account", link: "User" },
      ],
    };
  },
    methods: {
    salir() {
      this.$store.dispatch("salir");
    },
  },
};
</script>
