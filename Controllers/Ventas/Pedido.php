<?php

namespace Controllers\Ventas;

require_once $_SERVER['DOCUMENT_ROOT'] . '/Models/UsuarioModel.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/Models/PedidoModel.php';

use Models\Usuario as UsuarioModel;
use Models\Pedido as PedidoModel;

class Pedido
{
    public function indexPedidos()
    {
        $usuarioModel = new UsuarioModel();
        $data = $usuarioModel->obtenerDatosAutenticado();
        if (empty($data)) {
            header("location: /login");
            die();
        }
        if (!in_array($data['rol'], [$usuarioModel->rolBodega])) {
            header("location: /intranet/inicio");
            die();
        }


        require_once("views/Ventas/misPedidos.php");
    }

    public function obtenerPedidos()
    {
        $pedidoModel = new PedidoModel();
        return ['data' => $pedidoModel->mostrar()];
    }

    public function agregarPedido(array $datos)
    {
        $pedidoModel = new PedidoModel();
        
        $pedidoModel->setCliente($datos['cliente']);
        $pedidoModel->setCiudad($datos['ciudad']);
        $pedidoModel->setDireccion($datos['direccion']);
        $pedidoModel->setTelefono($datos['telefono']);
        $pedidoModel->setCorreo($datos['correo']);
        $pedidoModel->setFecha($datos['fecha']);

        return $pedidoModel->agregar();
    }

    public function eliminarPedido(int $id)
    {
        $pedidoModel = new PedidoModel();
        $pedidoModel->setId($id);
        return $pedidoModel->eliminar();
    }
}

?>