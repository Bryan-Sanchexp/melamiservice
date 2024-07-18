<?php
namespace Controllers\Administrador;

require_once $_SERVER['DOCUMENT_ROOT'] . '/Models/PedidoModel.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/Models/MaterialesModel.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/Models/UsuarioModel.php';


use Models\Pedido as PedidoModel;
use Models\Materiales as MaterialesModel;
use Models\Usuario as UsuarioModel;

class Dashboard {

    public function obtenerPedidosPorEstado(string $fechaInicio,string $fechaFin)
    {
        
        $pedidoModel = new PedidoModel();
        return $pedidoModel->mostrarPedidosPorEstado($fechaInicio,$fechaFin);
    }

    public function obtenerPedidosPorAnio(string $fechaInicio,string $fechaFin)
    {
        
        $pedidoModel = new PedidoModel();
        return $pedidoModel->mostrarPedidosPorAnio($fechaInicio,$fechaFin);
    }

    public function obtenerRankingMateriales(string $fechaInicio,string $fechaFin){
        
        $materialesModel = new MaterialesModel();
        return $materialesModel->rankingMateriales($fechaInicio,$fechaFin);
    }
    
}

?>