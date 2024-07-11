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
    case 'ver-material':
        $response = $materiales->obtenerUnMaterial($_POST["idMaterial"]);
        echo json_encode($response, JSON_FORCE_OBJECT);
        break;
    case 'actualizar-material':
        $response = $materiales->actualizarMaterial($_POST["idMateriales"],$_POST["editarNombre"],$_POST["editarMarca"],$_POST["editarPrecio"]);
        echo json_encode($response);
        break;
}