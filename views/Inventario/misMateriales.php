<!DOCTYPE html>
<html lang="es">

<head>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/Views/helpers/headerDashboard.php"); ?>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/Views/helpers/headerDatatable.php"); ?>
    <script src="<?php echo URL . '/Public/js/materiales.js' ?>"></script>
    <title>Materiales</title>
</head>

<body>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/Views/helpers/dashboardMateriales.php") ?>
    <main class="contenido-pagina">
        <h3 class="text-center titulo-principal-modulo mb-4">Categoría de Materiales</h3>
        <div class="bg-white p-3 mb-5">
            <div class="text-end">
                <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#materialesModal">
                    <i class="fa-solid fa-plus"></i>
                    Agregar Materiales
                </button>
            </div>
        </div>
        <div class="contenido-tabla bg-white p-3">
            <div class="py-3">
                <h4 class="titulo-principal-modulo"><i class="fa-solid fa-caret-right"></i> Lista de Materiales</h4>
            </div>
            <table class="table table-sm table-bordered" id="misMateriales">
                <thead class="text-center">
                    <tr>
                        <th>N°</th>
                        <th>Nombre Materiales</th>
                        <th>Nombre Marca</th>
                        <th>Nombre Precio</th>
                        <th>Nombre Stock</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </main>
    <?php require_once 'modales/mMateriales.php'; ?>
</body>

</html>