<?php
namespace Controllers\Inventario;

require_once $_SERVER['DOCUMENT_ROOT'] . '/Models/MaterialesModel.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/Models/UsuarioModel.php';


use Models\Materiales as MaterialesModel;
use Models\Usuario as UsuarioModel;

class Materiales {
    // public function indexHome()
    // {
    // //instanciamos el modelo usuario
    // $usuarioModel = new UsuarioModel();
       
    // //obtenemos los datos a traves de sus metodo 
    // $data = $usuarioModel->obtenerDatosAutenticado();
        
    // // mostramos la vista principal
    //   include("views/principal.php");
    //   }
    public function indexMateriales()
    {
        $usuarioModel = new UsuarioModel();
        $data = $usuarioModel->obtenerDatosAutenticado();
        if (empty($data)) {
            header("location: /login");
            die();
        }
        if (!in_array($data['rol'], [$usuarioModel->rolUsuario])) {
            header("location: /intranet/inicio");
            die();
        }
        require_once($_SERVER['DOCUMENT_ROOT'] . "/views/Inventario/misMateriales.php");
    }
    public function obtenerMateriales()
    {
        $materialesModel = new MaterialesModel();
        return ['data' => $materialesModel->mostrar()];
    }

    public function agregarMateriales(array $datos)
    {
        $materialesModel = new MaterialesModel();
        $materialesModel->setNombre($datos['nombre']);
        $materialesModel->setMarca($datos['marca']);
        $materialesModel->setPrecio($datos['precio']);
        $materialesModel->setStock($datos['stock']);
        return $materialesModel->agregar();
    }

    public function eliminarMateriales(int $id)
    {
        $materialesModel = new MaterialesModel();
        $materialesModel->setId($id);
        return $materialesModel->eliminar();
    }

    public function obtenerUnMaterial(int $id){
        $materialesModel = new MaterialesModel();
        $materialesModel->setId($id);
        return $materialesModel->verMaterial();
    }

    public function actualizarMaterial(int $id, string $nombre, string $marca, string $precio){
        $materialesModel = new MaterialesModel();
        $materialesModel->setId($id);
        $materialesModel->setNombre($nombre);
        $materialesModel->setMarca($marca);
        $materialesModel->setPrecio($precio);

        return $materialesModel ->actualizar();
    }

    public function verificarMaterialStock(array $materiales)
    {
        $materialesModel = new MaterialesModel();
        $idMateriales = implode(",",array_column($materiales,"id"));
        $materialesDb = $materialesModel->verificarStock($idMateriales);
        $response = ['success' => 'no hay inconvenientes'];
        foreach ($$materiales as $mt) {
            $material = array_filter($materialesDb,function($v)use($mt){
                return $v['id'] == $mt['id'];
            });
            if(empty($material)){
                $response = ['error' => 'El material ' . $mt['nombre'] . ' no se a encontrado, posiblemente haya sido eliminado'];
                break;
            }
            $kp = key($material);
            if(intval($mt['cantidad']) > intval($materialesDb[$kp]['stock'])){
                $response = ['error' => 'El material ' . $mt['nombre'] . ' no debe superar la cantidad de ' . intval($materialesDb[$kp]['stock']) . ' unidades'];
                break;
            }
        }
        return $response;
    }
    
}
