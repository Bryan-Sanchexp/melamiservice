<!DOCTYPE html>
<html lang="es">

<head>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/views/helpers/headerDashboard.php"); ?>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/views/helpers/headerDatatable.php"); ?>
    <script src="<?php echo URL . '/public/js/pedidos.js' ?>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
    <title>Pedidos</title>
</head>

<body>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/Views/helpers/dashboardVentas.php") ?>
    <main class="contenido-pagina">
        <h3 class="text-center titulo-principal-modulo mb-4">Pedidos</h3>

            <div class="contenido-tabla bg-white p-3 mb-4">
            <div class="py-3">
                <h4 class="titulo-principal-modulo"><i class="fa-solid fa-caret-right"></i> Filtros</h4>
            </div>

            <form id="filtros" class="row">
                <div class="col-12 col-md-6 col-lg-3">
                    <label for="txtFechaInicio">Fecha Inicio</label>
                    <input type="date" name="fechaInicio" id="txtFechaInicio" class="form-control form-control-sm" value="<?php echo date("Y-m-d",strtotime(date('Y-m-d')."- 6 months"))?>">
                </div>
                <div class="col-12 col-md-6 col-lg-3">
                    <label for="txtFechaFin">Fecha Fin</label>
                    <input type="date" name="fechaFin" id="txtFechaFin" class="form-control form-control-sm" value="<?php echo date("Y-m-d",strtotime(date('Y-m-d')."+ 4 months"))?>">
                </div>
                <div class="col-12 col-lg-3">
                    <div class="d-flex" style="gap:5px;">
                        <button class="btn btn-sm btn-primary" id="btnAplicarFiltro" type="button" title="Aplicar filtros">
                            <i class="fas fa-filter"></i>
                        </button>
                        <div class="dropdown">
                            <button class="btn btn-sm btn-login-access dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="nombre-usuario">Reportes</span>
                            </button>
                            <ul class="dropdown-menu">
                                <li>
                                    <button type="button" class="dropdown-item text-secondary" id="btnReporteDetalle" data-accion="pdf">
                                        <i class="far fa-file-pdf text-danger"></i>
                                        PDF - Detalle de pedido
                                    </button>
                                </li>
                                <li>
                                    <button type="button" class="dropdown-item text-secondary" id="btnReporteDetalleExcel" data-accion="excel">
                                        <i class="far fa-file-excel text-success"></i>
                                        EXCEL - Detalle de pedido
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </form>
            
        </div>

            
        <div class="contenido-tabla bg-white p-3">
            <div class="py-3">
                <h4 class="titulo-principal-modulo"><i class="fa-solid fa-caret-right"></i> Lista de pedidos</h4>
            </div>
            <table class="table table-sm table-bordered" id="misBodegas">
                <thead class="text-center">
                    <tr>
                        <th>N° Pedido</th>
                        <th>Cliente</th>
                        <th>Ciudad</th>
                        <th>Direccion</th>
                        <th>Telefono</th>
                        <th>Correo</th>
                        <th>Fecha de entrega</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </main>
    <?php require_once 'modales/mPedido.php'; ?>

    <!-- <script type="text/javascript"src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.dataTables.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.print.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script> -->


</body>

</html>
