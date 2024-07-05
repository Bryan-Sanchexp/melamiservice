<?php
use Controllers\Administrador\Colaboradores;
require_once '../../Controllers/Administrador/Colaboradores.php';
$cColaboradores = new Colaboradores;
switch ($_POST['accion']) {
    case 'agregar-colaboradores':
        $response = $cColaboradores->agregarColaboradores($_POST);
        echo json_encode($response);
    break;
    case 'ver-colaboradores':
        $response = $cColaboradores->obtenerColaboradores();
        echo json_encode($response);
    break;
}
