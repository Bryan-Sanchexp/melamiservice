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
    
}
