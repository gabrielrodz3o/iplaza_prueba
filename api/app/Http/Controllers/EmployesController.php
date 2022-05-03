<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
//use App\Models\employes;
use Illuminate\Http\Request;
use SebastianBergmann\Environment\Console;

class EmployesController extends Controller
{

    public function getEmployes()
    {
        $query = 'SELECT EMPLOYES.ID,
     NOMBRE,
     ESTADO,
     PUBLIC.MARITAL_STATUS.DESCRIPTION AS MARITAL_STATUS_DESCRIPTION,
     FECHA_CREACION,
     SEXO,
     PUBLIC.SEX.DESCRIPTION AS SEX_DESCRIPTION,
     SALARIO::NUMERIC(12,2)
 FROM PUBLIC.EMPLOYES
 JOIN PUBLIC.SEX ON SEX.ID =PUBLIC.EMPLOYES.SEXO
 JOIN PUBLIC.MARITAL_STATUS ON PUBLIC.MARITAL_STATUS.ID=PUBLIC.EMPLOYES.ESTADO ORDER BY EMPLOYES.ID ASC';
        return DB::select(DB::raw($query));
    }

    public function postEmployes(Request $request)
    {
        $users =   DB::select(

            "INSERT INTO PUBLIC.EMPLOYES(ID,
            NOMBRE,
            ESTADO,
            FECHA_CREACION,
            SEXO,
            SALARIO)
        VALUES (default, ?, ?, default, ?, ?);",
            [$request->nombre, $request->estado, $request->sexo, $request->salario]
        );


        return "ok";
    }
    public function putEmployes(Request $request)
    {
        $users =   DB::select(

            "UPDATE PUBLIC.EMPLOYES
            SET
                NOMBRE = ?,
                ESTADO = ?,
                SEXO = ?,
                SALARIO = ?
            WHERE ID=?",
            [$request->nombre, $request->estado, $request->sexo, $request->salario,$request->id]
        );


        return "ok";
    }
    public function deleteEmployes(Request $request)
    {
        $users =   DB::select(

            "DELETE FROM PUBLIC.EMPLOYES
            WHERE ID=?;",
            [$request->id]
        );


        return "ok";
    }
}
