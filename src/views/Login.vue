<template>
 
      <v-container fluid fill-height>
         <v-snackbar v-model="snackbar" timeout="3000">
         Usuario o passwor incorrectos

          <template v-slot:action="{ attrs }">
            <v-btn
              color="success"
              text
              v-bind="attrs"
              @click="snackbar = false"
            >
              Close
            </v-btn>
          </template>
        </v-snackbar>
        <v-layout align-center justify-center>
          <v-flex xs12 sm8 md4>
            <v-card class="elevation-12">
              <v-toolbar dark color="primary">
                <v-toolbar-title class="flex text-center">Login </v-toolbar-title>
              </v-toolbar>
              <v-card-text>
                <v-form v-model="loginForm">
                  <v-alert
                    text
                    prominent
                    type="error"
                    icon="mdi-cloud-alert"
                    v-if="wrongUserOrPassword"
                  >
                   Usuario o Password incorrextos
                  </v-alert>

                  <v-text-field
                    prepend-icon="mdi-account"
                    name="Usuario"
                    label="Usuario"
                    type="text"
                    v-model="username"
                  
                  >
                  </v-text-field>

                  <v-text-field
                    id="password"
                    prepend-icon="mdi-lock"
                    name="password"
                    label="Password"
                    :type="type"
                    v-model="password"
                    :rules="passwordRules"
                  >
                    <v-icon
                      @click="
                        type == 'password'
                          ? (type = 'text')
                          : (type = 'password')
                      "
                      slot="append"
                      color="#2b90d9"
                    >
                      {{ type == "password" ? "mdi-eye" : "mdi-eye-off" }}
                    </v-icon>
                  </v-text-field>
                </v-form>
              </v-card-text>
              <v-card-actions >
                <v-spacer>
                <v-btn
                  
                  color="primary"
                  to="/"
                  :disabled="!loginForm "
                  @click="login()"
                  >Iniciar seccion
                  <template v-slot:loader>
                    <span class="custom-loader">
                      <v-icon light>mdi-cached</v-icon>
                    </span>
                  </template></v-btn
                ></v-spacer>
              </v-card-actions>
            </v-card>
          </v-flex>
        </v-layout>
      </v-container>
  
</template>

<script>
// import { mapGetters, mapActions } from "vuex";
const api = "http://localhost:8000/api/";
export default {
  name: "Login",
  data() {
    return {
      loader: null,
      snackbar:false,
      wrongUserOrPassword: false,
      type: "password",
      loginForm: false,
        username: "",
        password: "",
      passwordRules: [
        (value) => !!value || "Required.",
        (value) => (value && value.length >= 5) || "Min 5 ",
      ],
    };
  },
  computed: {

  },
  methods: {
    async login(){

       const requestOptions = {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          username: this.username,
          password: this.password,
        }),
      };

      const response = await fetch(api + "auth", requestOptions);
            if (response.status == 200) {
               const data = await response.json();
          window.localStorage.setItem("token", data.token);
        window.localStorage.setItem("user", '3');
          this.$store.dispatch("guardarToken",data.token);

            }
            else{
              this.snackbar=true

            }
     
    }
 
  },
};
</script>
<style>
.custom-loader {
  animation: loader 1s infinite;
  display: flex;
}
@-moz-keyframes loader {
  from {
    transform: rotate(0);
  }
  to {
    transform: rotate(360deg);
  }
}
@-webkit-keyframes loader {
  from {
    transform: rotate(0);
  }
  to {
    transform: rotate(360deg);
  }
}
@-o-keyframes loader {
  from {
    transform: rotate(0);
  }
  to {
    transform: rotate(360deg);
  }
}
@keyframes loader {
  from {
    transform: rotate(0);
  }
  to {
    transform: rotate(360deg);
  }
}
</style>