<?php

namespace Controllers\Administrador;
require_once $_SERVER['DOCUMENT_ROOT'] . '/Models/ColaboradoresModel.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/Models/UsuarioModel.php';


use Models\Colaboradores as ColaboradoresModel;
use Models\Usuario as UsuarioModel;


class Colaboradores
{
    public function indexColaboradores()
    {
        $usuarioModel = new UsuarioModel();
        $data = $usuarioModel->obtenerDatosAutenticado();
        if (empty($data)) {
            header("location: /login");
            die();
        }
        if (!in_array($data['rol'], [$usuarioModel->rolAdministrador])) {
            header("location: /intranet/inicio");
            die();
        }
        require_once($_SERVER['DOCUMENT_ROOT'] . "/Views/Administrador/colaboradores.php");
    }
    public function obtenerColaboradores()
    {
        $modelColaboradores = new ColaboradoresModel();
        return ['data' => $modelColaboradores->mostrar()];
    }
    public function agregarColaboradores(array $datos)
    {
        $modelUsuario = new UsuarioModel();
        $modelUsuario->setCorreo($datos['correo']);
        $existeCorreo = $modelUsuario->verificarDuplicidadCorreo();
        if(count($existeCorreo)){
            return ['error' => 'El correo ' . $datos['correo'] . ' ya se encuentra registrado, por favor intente con otro correo'];
        }
        $modelColaboradores = new ColaboradoresModel();
        $modelColaboradores->setNombre($datos['nombre']);
        $modelColaboradores->setApellidos($datos['apellidos']);
        $modelColaboradores->setDireccion($datos['direccion']);
        $modelColaboradores->setTelefono($datos['telefono']);
        $modelColaboradores->setCelular($datos['celular']);
        $modelColaboradores->setLocalizacion($datos['localizacion']);
        $modelColaboradores->setDniPropietario($datos['dni_propietario']);
        $modelColaboradores->setRol($datos['rol']);
        $contrasena = "bodegafast2023@";
        $agregarColaboradores = $modelColaboradores->agregar($datos['correo'],password_hash($contrasena,PASSWORD_DEFAULT));
        return $agregarColaboradores ? ['success' => 'Colaborador agregado correctamente ' . ' la contraseña es ' . $contrasena] : ['error' => 'Error al agregar al colaborador'];
    }

    public function eliminarColaborador(int $id)
    {
        $modelColaboradores = new ColaboradoresModel();
        $modelColaboradores->setId($id);
        return $modelColaboradores->eliminar();
    }
}
