<?php

namespace Controllers\Ventas;

require_once $_SERVER['DOCUMENT_ROOT'] . '/Models/MaterialesModel.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/Models/UsuarioModel.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/Models/PedidoModel.php';

use Models\Usuario as UsuarioModel;
use Models\Pedido as PedidoModel;
use Models\Materiales as MaterialesModel;

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

    public function indexAgregarPedido()
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

        $materialesModel = new MaterialesModel();
        $listaMateriales = $materialesModel->mostrar();

        require_once("views/Ventas/agregarPedido.php");
    }

    public function obtenerPedidos()
    {
        $pedidoModel = new PedidoModel();
        return ['data' => $pedidoModel->mostrar()];
    }

    public function agregar(array $datos)
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

    public function agregarPedido(array $datos)
    {

        $pedidoModel = new PedidoModel();

        $detallePedido = json_decode($datos['detalle'],true);
        $subtotal = 0;

        foreach ($detallePedido as $dv) {
            $subtotal += floatval($dv['sub_total']);
        }
        
        $igv = floatval(0.18 * $subtotal);
        $total = floatval($subtotal + $igv);

        $pedidoModel->setCliente($datos['cliente']);
        $pedidoModel->setCiudad($datos['ciudad']);
        $pedidoModel->setDireccion($datos['direccion']);
        $pedidoModel->setTelefono($datos['telefono']);
        $pedidoModel->setCorreo($datos['correo']);
        $pedidoModel->setFecha($datos['fecha']);
        $pedidoModel->setSubtotal($subtotal);
        $pedidoModel->setTotal($total);
        $pedidoModel->setIgv($igv);
        $pedidoModel->setEstado("Pedido recibido");
        $pedidoModel->setDetallePedido(json_encode($detallePedido));
        $resultado = $pedidoModel->agregar();
        error_log('Valor de $resultado: ' . print_r($pedidoModel, true));
        return $resultado ? ['success' => 'Pedido generado con éxito']:['error' => 'Error al agregar pedido - controller'] ;
    }

    public function eliminarPedido(int $id)
    {
        $pedidoModel = new PedidoModel();
        $pedidoModel->setId($id);
        return $pedidoModel->eliminar();
    }

}

