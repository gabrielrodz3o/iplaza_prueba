<template>
<v-container fluid>
  <v-layout align-start>
    <v-flex>
      <v-data-table
        :headers="headers"
        :items="users"
        :search="search"
        class="elevation-1"
      >
        <template v-slot:top>
          <v-toolbar flat>
            <v-toolbar-title>Usuarios</v-toolbar-title>
            <v-divider class="mx-4" inset vertical></v-divider>
            <v-spacer></v-spacer>
            <v-text-field
              class="text-xs-center"
              v-model="search"
              append-icon="mdi-search"
              label="Buscar"
              single-line
              hide-details
            >
            </v-text-field>
            <v-spacer></v-spacer>
            <v-dialog v-model="dialog" max-width="60%">
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="success"
                  dark
                  class="mb-2"
                  v-bind="attrs"
                  
                  v-on="on"
                >
                  Nuevo Usuario
                </v-btn>
              </template>
              <v-card>
                <v-card-title>
                  <span class="flex text-center headline">{{ formTitle }}</span>
                </v-card-title>

                <v-card-text>
                  <v-container fluid>
                
                  </v-container>
                </v-card-text>

                <v-card-actions>
                  <v-spacer></v-spacer>
                     <v-btn   color="success" text >
                    Guardar
                  </v-btn>
                  <v-btn color="red darken-1" text>
                    Cancelar
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
            <v-dialog v-model="dialogDelete" max-width="500px">
              <v-card>
                <v-card-title class="headline"
                  >Seguro que desea eliminar este usuario?</v-card-title
                >
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn   color="success" text 
                    >Confirmar</v-btn
                  >
                  <v-btn color="red darken-1" text
                    >Cancelar</v-btn
                  >
                  <v-spacer></v-spacer>
                </v-card-actions>
              </v-card>
            </v-dialog>
          </v-toolbar>
        </template>
        <template v-slot:[`item.actions`]="{ item }">
          <v-icon
            large
            color="accent"
            class="mr-2"
            @click="editItem(item)"
          >
            mdi-pencil
          </v-icon>
          <v-icon large color="error" @click="deleteItem(item)">
            mdi-delete
          </v-icon>
        </template>
        <template v-slot:no-data>
          <v-btn color="primary" @click="initialize"> Reset </v-btn>
        </template>
      </v-data-table>
    </v-flex>
  </v-layout>
</v-container>
</template>
<script>
const token = localStorage.getItem("token");
const api = "http://localhost:8000/api/";
const cabecera = {
  "Content-Type": "application/json",
  Authorization: "bearer " + token,
};
export default {
    data: () => ({
    dialog: false,
    dialogDelete: false,
    headers: [
      {
        text: "Codigo",
        align: "start",
        value: "id",
      },
      { text: "usuario", value: "username" },
   
  
      { text: "Actions", value: "actions", sortable: false },
    ],

    search: "",
    users: [],
     editedIndex: -1,
    editedItem: {
      description: "",
    },
    }),   computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Nuevo usuario" : "Editar usuario";
    },
  }, methods: {

    async initialize() {
    const requestOptions = {
        method: "GET",
        headers: cabecera,
      };
      //get users
      const response = await fetch(api + "user", requestOptions);
      const data = await response.json();
      console.log(data)
      this.users = data;
    },

    save(){}

  

    
  },
     watch: {
    dialog(val) {
      val || this.close();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    },
  },

  created() {
    this.initialize();
  },
}
</script>