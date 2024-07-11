<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte detalle de pedidos</title>
</head>
<body>
    <style>
        @page {
            margin: 90px 25px;
        }
        header {
            position: fixed;
            top: -85px;
            left: 0px;
            right: 0px;
            height: 50px;
        }
        body{
            font-family: 'Courier New', Courier, monospace;
        }
        .text-center{
            text-align: center;
        }
        table{
            margin-left: auto;
            margin-right: auto;
            padding-top: 2%;
            border-collapse: collapse;
        }
        table td,
        table th{
            padding: 4px;
        }
        .titulo{
            text-align: center;
            display: block;
            font-size: 20px;
            font-weight: bold;
        }
    </style>
    <header>
        <img src="data:image/png;base64,<?php echo base64_encode(file_get_contents($_SERVER['DOCUMENT_ROOT'] . '/Public/img/logo.png'));?>" alt="Imagen de logo" width="150px">
        <span class="text-center titulo">Detalle de pedidos desde <?php echo date('d/m/Y',strtotime($fechaInicio)) .' hasta '. date('d/m/Y',strtotime($fechaFin)) ?></span>
    </header>
    <table border="1">
        <thead>
            <tr>
                <th>N° Pedido</th>
                <th>Fecha Entrega</th>
                <th style="width: 200px;">Cliente</th>
                <th style="width: 200px;">Material</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody>
            <?php
                $precio = 0;
                $cantidad = 0;
                $subtotal = 0;
                foreach ($pedidos as $k=>$pedido) {
                    echo "<tr>
                        <td rowspan='".count($pedido['materiales'])."'>".$pedido['nroPedido']."</td>
                        <td rowspan='".count($pedido['materiales'])."'>".$pedido['fecha']."</td>
                        <td rowspan='".count($pedido['materiales'])."'>".$pedido['cliente']."</td>";

                    foreach ($pedido['materiales'] as $pk=>$p) {
                        if($pk != 0){
                            echo "<tr>";
                        }
                        $precio += $p['precio'];
                        $cantidad += $p['cantidad'];
                        $subtotal += $p['subtotal'];
                        echo "<td>".$p['nombre']."</td>
                        <td>S/".$p['precio']."</td>
                        <td class='text-center'>".$p['cantidad']."</td>
                        <td>S/".$p['subtotal']."</td></tr>
                        ";
                    }
                }
            ?>
        </tbody>
        <tfoot>
            <tr>
                <th colspan="4">Total</th>
                <th>S/<?php echo number_format($precio,2) ?></th>
                <th><?php echo $cantidad?></th>
                <th>S/<?php echo number_format($subtotal,2) ?></th>
            </tr>
        </tfoot>
    </table>
</body>
</html>