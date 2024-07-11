<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
</head>
<body>
<table border="1">
    <thead>
        <tr>
                <th>N° Pedido</th>
                <th>Fecha Entrega</th>
                <th>Cliente</th>
                <th>Material</th>
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
                foreach ($pedido['materiales'] as $pk=>$p) {
                    $precio += $p['precio'];
                    $cantidad += $p['cantidad'];
                    $subtotal += $p['subtotal'];
                    echo "<tr>
                    <td>".$pedido['nroPedido']."</td>
                    <td>".$pedido['fecha']."</td>
                    <td>".$pedido['cliente']."</td>
                    <td>".$p['nombre']."</td>
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
