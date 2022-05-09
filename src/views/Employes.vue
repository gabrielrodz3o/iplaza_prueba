<template>
  <v-container fluid>
    <v-layout align-start>
      <v-flex>
        <v-snackbar v-model="snackbar" :timeout="timeout">
          {{ text }}

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
        <!-- TABLA EMPLEADOS -->
        <v-data-table
          :headers="headers"
          :items="employes"
          :search="search"
          class="elevation-1"
        >
          <template v-slot:top>
            <v-toolbar flat>
              <v-toolbar-title>Empleados</v-toolbar-title>
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
              <!-- DIALOG EDITAR -->
              <v-dialog v-model="dialog" max-width="60%">
                <template v-slot:activator="{ on, attrs }">
                  <v-btn
                    color="success"
                    dark
                    class="mb-2"
                    v-bind="attrs"
                    @click="clearEmployes"
                    v-on="on"
                  >
                    Nuevo Empleado
                  </v-btn>
                </template>
                <v-card>
                  <v-card-title>
                    <span class="flex text-center headline">{{
                      formTitle
                    }}</span>
                  </v-card-title>

                  <v-card-text>
                    <v-container fluid>
                      <v-row>
                        <v-col cols="12" sm="6" md="3">
                          <v-text-field
                            v-model="newEmployes.nombre"
                            label="Nombre"
                          ></v-text-field>
                        </v-col>
                        <v-col cols="12" sm="6" md="3">
                          <v-autocomplete
                            :items="itemsMaritalStatus"
                            v-model="newEmployes.estado"
                            label="Estado"
                            required
                          ></v-autocomplete>
                        </v-col>
                        <v-col cols="12" md="3">
                          <v-autocomplete
                            :items="itemSex"
                            v-model="newEmployes.sexo"
                            label="Sexo"
                            required
                          ></v-autocomplete>
                        </v-col>
                        <v-col cols="12" sm="6" md="3">
                          <v-text-field
                            v-model="newEmployes.salario"
                            label="Salario"
                          ></v-text-field>
                        </v-col>

                         <v-col cols="12" sm="6" md="3">
                          <v-text-field
                            v-model="newEmployes.department"
                            label="Departamento"
                          ></v-text-field>
                        </v-col>


                        
                      </v-row>
                    </v-container>
                  </v-card-text>

                  <v-card-actions>
                    <v-spacer></v-spacer>

                    <v-btn color="success" text @click="save"> Guardar </v-btn>
                    <v-btn color="red darken-1" text @click="close">
                      Cancelar
                    </v-btn>
                    <v-spacer></v-spacer>
                  </v-card-actions>
                </v-card>
              </v-dialog>
              <!-- DIALOG ELIMINAR -->
              <v-dialog v-model="dialogDelete" max-width="550px">
                <v-card>
                  <v-card-title class="headline"
                    >Seguro que desea eliminar este empleado?</v-card-title
                  >
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="success" text @click="deleteItemConfirm"
                      >Confirmar</v-btn
                    >
                    <v-btn color="red darken-1" text @click="closeDelete"
                      >Cancelar</v-btn
                    >
                    <v-spacer></v-spacer>
                  </v-card-actions>
                </v-card>
              </v-dialog>
            </v-toolbar>
          </template>
          <template v-slot:[`item.actions`]="{ item }">
            <v-icon large color="accent" class="mr-2" @click="editItem(item)">
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
    snackbar: false,
    text: "",
    timeout: 3000,
    dialogDelete: false,
    headers: [
      {
        text: "Codigo",
        align: "start",
        value: "id",
      },
      { text: "Nombre", value: "nombre" },
      { text: "Estado", value: "marital_status_description" },
      { text: "Fecha Creacion", value: "fecha_creacion" },
      { text: "Sexo", value: "sex_description" },
      { text: "Salario", value: "salario" },
      {text:"Departamento",value:"department"},

      { text: "Actions", value: "actions", sortable: false },
    ],

    search: "",
    employes: [],
    itemsMaritalStatus: [],
    itemSex: [],

    newEmployes: [],
    editedIndex: -1,
    editedItem: {
      description: "",
    },
  }),
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Nuevo empleado" : "Editar empleado";
    },
  },
  methods: {
    async initialize() {
      const requestOptions = {
        method: "GET",
        headers: cabecera,
      };
      //get employes
      const responseEmployes = await fetch(api + "employes", requestOptions);
      const dataEmployes = await responseEmployes.json();
      this.employes = dataEmployes;

      //get estado
      const responseEstado = await fetch(
        api + "marital_status",
        requestOptions
      );
      const dataEstado = await responseEstado.json();

      for (var item of dataEstado) {
        this.itemsMaritalStatus.push({
          value: item.id,
          text: item.description,
        });
      }

      //get sex
      const responseSex = await fetch(api + "sex", requestOptions);
      const dataSex = await responseSex.json();
      for (var item2 of dataSex) {
        this.itemSex.push({
          value: item2.id,
          text: item2.description,
        });
      }
    },
    clearEmployes() {},
    editItem(item) {
      this.editedIndex = this.employes.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.newEmployes = this.employes[this.editedIndex];

      this.dialog = true;
    },

    deleteItem(item) {
      this.editedIndex = this.employes.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },

    async deleteItemConfirm() {
      let id_var = this.employes[this.editedIndex].id;
      //alert(id);
      const requestOptions = {
        method: "DELETE",
        headers: cabecera,
      };
      const response = await fetch(api + "employes/" + id_var, requestOptions);
    
      if (response.status == 200) {
           this.snackbar = true;
          this.text = "Empleado eliminado con exito!";
          this.initialize();
          this.dialogDelete = false;
      } else {
            this.snackbar = true;
          this.text = "Empleado actualizado con exito!";
     
      }
    },

    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    async save() {
      // var datos = this.editedItem;

      if (this.editedIndex > -1) {
        //Modificar
        const requestOptions = {
          method: "PUT",
          headers: cabecera,
          body: JSON.stringify({
               id: this.newEmployes.id,
            nombre: this.newEmployes.nombre,
            estado: this.newEmployes.estado,
            sexo: this.newEmployes.sexo,
            salario: this.newEmployes.salario,
            department: this.newEmployes.department
          }),
        };
        const response = await fetch(api + "employes", requestOptions);

        if (response.status == 200) {
          this.snackbar = true;
          this.text = "Empleado actualizado con exito!";
          this.initialize();
          this.dialog = false;
        } else {
          this.snackbar = true;
          this.text = "Error!";

          this.dialog = false;
        }
      } else {
        //Crear nuevo
        const requestOptions2 = {
          method: "POST",
          headers: cabecera,
          body: JSON.stringify({
            nombre: this.newEmployes.nombre,
            estado: this.newEmployes.estado,
            sexo: this.newEmployes.sexo,
            salario: this.newEmployes.salario,
            department: this.newEmployes.department
          }),
        };
        const response = await fetch(api + "employes", requestOptions2);

        if (response.status == 200) {
          this.snackbar = true;
          this.text = "Empleado creado con exito!";
          this.initialize();
          this.dialog = false;
        } else {
          this.snackbar = true;
          this.text = "Error!";

          this.dialog = false;
        }
      }

      this.close();
    },
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
};
</script>
