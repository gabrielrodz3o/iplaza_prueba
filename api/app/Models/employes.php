<?php

namespace App\Models;

use Dflydev\DotAccessData\Data;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class employes extends Model
{
    // use HasFactory;
    // protected $table ='employes';
    public function get(){
        $employes = new employes();
        $data = $employes->all();
        var_dump($data);
    }

}
