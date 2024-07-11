<?php

namespace Controllers\Ventas;

require_once $_SERVER['DOCUMENT_ROOT'] . '/Models/MaterialesModel.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/Models/UsuarioModel.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/Models/PedidoModel.php';
require $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';

use Models\Usuario as UsuarioModel;
use Models\Pedido as PedidoModel;
use Models\Materiales as MaterialesModel;
use Dompdf\Dompdf;

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
        if (!in_array($data['rol'], [$usuarioModel->rolColaboradores])) {
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
        if (!in_array($data['rol'], [$usuarioModel->rolColaboradores])) {
            header("location: /intranet/inicio");
            die();
        }

        $materialesModel = new MaterialesModel();
        $listaMateriales = $materialesModel->mostrar();

        require_once("views/Ventas/agregarPedido.php");
    }

    public function obtenerPedidos(string $fechaInicio,string $fechaFin)
    {
        $pedidoModel = new PedidoModel();
        return ['data' => $pedidoModel->mostrar($fechaInicio,$fechaFin)];
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

    public function reportePedido(){
        $pedidoModel = new PedidoModel();

        $fechaInicio = $_POST['fechaInicio'];
        $fechaFin = $_POST['fechaFin'];

        $pedidos = $pedidoModel->mostrar($fechaInicio,$fechaFin);

        foreach ($pedidos as $k=>$pedido) {
            $pedidoModel->setId($pedido['id']);
            $pedidos[$k]['materiales'] = $pedidoModel->mostrarDetallePedido();
        }
        
        if($_POST['accion'] == "pdf"){
            ob_start();
            include_once $_SERVER['DOCUMENT_ROOT'] . '/Views/Ventas/reportes/detallePedidoPDF.php';
            $html = ob_get_clean();
            $dompdf = new Dompdf();
            $dompdf->loadHtml($html);
            $dompdf->setPaper('A4', 'landscape');
            $dompdf->render();
            $dompdf->stream("reporte_pedidos.pdf",array("Attachment" => false));
        }else{
            header("Content-Type: application/xls"); 
            header('Content-Type: text/html; charset=utf-8');
            header("Content-Disposition: attachment; filename=reporte_de_pedidos_" .date('Y:m:d:m:s').".xls");
            header("Pragma: no-cache"); 
            header("Expires: 0");
            ob_start();
            include_once $_SERVER['DOCUMENT_ROOT'] . '/Views/Ventas/reportes/detallePedidoExcel.php';
            echo ob_get_clean();
        }
    }
    

    

    

}

