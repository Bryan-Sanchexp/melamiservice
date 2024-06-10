<?php
use Controllers\Ventas\Pedido;
require_once '../../Controllers/Ventas/Pedido.php';
$pedido = new Pedido;
switch ($_POST['accion']) {
    case 'agregar-pedido':
        $response = $pedido->agregarPedido($_POST);
        echo json_encode($response);
    break;
    case 'ver-pedidos':
        $response = $pedido->obtenerPedidos();
        echo json_encode($response);
    break;
    case 'eliminar-pedido':
        $response = $pedido->eliminarPedido($_POST["idPedido"]);
        echo json_encode($response);
        break;
}