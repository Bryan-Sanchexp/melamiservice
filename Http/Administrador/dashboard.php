<?php
use Controllers\Administrador\Dashboard;
require_once '../../Controllers/Administrador/Dashboard.php';
$cDashboard = new Dashboard;
switch ($_POST['acciones']) {
    case 'solicitar-datos':
        $fechaIniAtras = date('Y-m-d',strtotime($_POST['fInicio'] . ' - 1 year'));
        $fechaFinAtras = date('Y-m-d',strtotime($_POST['fFin'] . ' - 1 year'));
        $response = [
            'pedidosPorEstado' => $cDashboard->obtenerPedidosPorEstado($_POST['fInicio'],$_POST['fFin']),
            'rankingMateriales' => $cDashboard->obtenerRankingMateriales($_POST['fInicio'],$_POST['fFin']),
            'ventasRealizadas' => [
                'year1' => $cDashboard->obtenerPedidosPorAnio($_POST['fInicio'],$_POST['fFin']),
                'year2' => $cDashboard->obtenerPedidosPorAnio($fechaIniAtras,$fechaFinAtras)
            ]
        ];
        echo json_encode($response);
    break;
}

?>