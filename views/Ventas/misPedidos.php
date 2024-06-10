<!DOCTYPE html>
<html lang="es">

<head>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/views/helpers/headerDashboard.php"); ?>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/views/helpers/headerDatatable.php"); ?>
    <script src="<?php echo URL . '/public/js/pedidos.js' ?>"></script>
    <title>Pedidos</title>
</head>

<body>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/Views/helpers/dashboardVentas.php") ?>
    <main class="contenido-pagina">
        <h3 class="text-center titulo-principal-modulo mb-4">Pedidos</h3>
        <div class="mb-3 text-end">
            <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#bodegaModal">
                <i class="fa-solid fa-plus"></i>
                Agregar Pedido
            </button>
        </div>
        <div class="contenido-tabla bg-white p-3">
            <div class="py-3">
                <h4 class="titulo-principal-modulo"><i class="fa-solid fa-caret-right"></i> Lista de pedidos</h4>
            </div>
            <table class="table table-sm table-bordered" id="misBodegas">
                <thead class="text-center">
                    <tr>
                        <th>ID</th>
                        <th>Cliente</th>
                        <th>Ciudad</th>
                        <th>Direccion</th>
                        <th>Telefono</th>
                        <th>Correo</th>
                        <th>Fecha de entrega</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </main>
    <?php require_once 'modales/mPedido.php'; ?>

</body>

</html>
