<?php
use Controllers\Inventario\Materiales;
require_once '../../Controllers/Inventario/Materiales.php';
$materiales = new Materiales;
switch ($_POST['accion']) {
    case 'agregar-materiales':
        $response = $materiales->agregarMateriales($_POST);
        echo json_encode($response);
    break;
    case 'ver-materiales':
        $response = $materiales->obtenerMateriales();
        echo json_encode($response);
    break;
    case 'eliminar-materiales':
        $response = $materiales->eliminarMateriales($_POST["idMateriales"]);
        echo json_encode($response);
        break;
}