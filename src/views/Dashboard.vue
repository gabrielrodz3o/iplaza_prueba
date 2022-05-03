<template>
<v-container>


  <v-row justify="center">
    <v-col cols="12" md="12">
      <v-row justify="center">
        <h1>Bienvenidos</h1>
      </v-row>

      <v-row justify="center">
        <v-col cols="12" md="3" sm="6">
          <v-hover v-slot="{ hover }">
            <v-card
              @click="$router.push({ name: 'Employes' })"
              class="mx-auto"
              width="200"
              height="150"
              flat
            >
              <v-row justify="center">
                <v-icon outlined :size="hover ? 85 : 70" color="red "
                  >mdi-account</v-icon
                >
              </v-row>

              <v-row justify="center">
                <span
                  :class="
                    hover
                      ? 'text-h8 font-weight-bold'
                      : 'text-h8 font-weight-light'
                  "
                >
                  Empleados
                </span>
              </v-row>
            </v-card>
          </v-hover>
        </v-col>
        <v-col cols="12" md="3" sm="6">
          <v-hover v-slot="{ hover }">
            <v-card
              @click="$router.push({ name: 'User' })"
              flat
              class="mx-auto"
              width="200"
              height="150"
            >
              <v-row justify="center">
                <v-icon :size="hover ? 85 : 70" color="orange"
                  >mdi-account</v-icon
                >
              </v-row>

              <v-row justify="center">
                <span
                  :class="
                    hover
                      ? 'text-h8 font-weight-bold'
                      : 'text-h8 font-weight-light'
                  "
                >
                  Usuarios
                </span>
              </v-row>
            </v-card>
          </v-hover>
        </v-col>
      </v-row>
    </v-col>
  </v-row>
  </v-container>
</template>
