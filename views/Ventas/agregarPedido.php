<!DOCTYPE html>
<html lang="es">

<head>
    <!-- Añadimos los archivos requeridos como css y js agrupados en un php -->
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/Views/helpers/headerDashboard.php"); ?>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/Views/helpers/headerDatatable.php"); ?>
    <script src="./../../Public/js/agregarPedido.js"></script>
    <link rel="stylesheet" href="./../../public/css/agregarProducto.css">
    <title>Agregar pedidos</title>
</head>

<body>
    <!-- Llamamos nuestro dashbord ya creado -->
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/Views/helpers/dashboardVentas.php") ?>
    <main class="contenido-pagina">
        <div class="container">
            <div class="p-4 bg-white m-auto rounded" style="max-width: 700px;">
                <div class="pasos pt-3 pb-4">
                    <div class="paso" id="btnPaso1" style="background-color: var(--color-principal);color:#fff;">
                        <span>1</span>
                        <div class="regla" style="width: 0;"></div>
                    </div>
                    <div class="paso" id="btnPaso2">
                        <span>2</span>
                        <div class="regla" style="width: 0;"></div>
                    </div>
                    <div class="paso" id="btnPaso3">
                        <span>3</span>
                    </div>
                </div>
                <div class="formularios">
                    <div class="formulario" id="boxFormularioOcul1">
                        <div class="pb-3">
                            <h3 class="text-center titulo-principal-modulo">Informacion del pedido</h3>
                        </div>
                        <form id="primerFormulario" class="row mb-3">
                            
                        <div class="col-12">
                        <label for="validationCustom01" class="form-label">Cliente</label>
                        <input type="text" name="cliente" class="form-control" id="validationCustom01" required>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="validationCustom05" class="form-label">Ciudad</label>
                        <input type="text" name="ciudad" class="form-control" id="validationCustom05" required>
                        <div class="invalid-feedback">
                            Please provide a valid city.
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="validationCustom03" class="form-label">Direccion</label>
                        <input type="text" name="direccion" class="form-control" id="validationCustom03" required>
                        <div class="invalid-feedback">
                            Please provide a valid address.
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="validationCustom03" class="form-label">Telefono</label>
                        <input type="text" name="telefono" class="form-control" id="validationCustom03" maxlength="9" required>
                        <div class="invalid-feedback">
                            Please provide a valid telephone.
                        </div>
                    </div>
                    
                    <div class="col-12">
                        <label for="validationCustomUsername" class="form-label">Correo</label>
                        <div class="input-group has-validation">
                            <span class="input-group-text" id="inputGroupPrepend">@</span>
                            <input type="text" name="correo" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
                            <div class="invalid-feedback">
                                Please choose a email.
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="validationCustom01" class="form-label">Fecha de entrega</label>
                        <input type="date" name="fecha" class="form-control" id="validationCustom01" required>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>
                    
                            <input type="submit" id="formFrimero" hidden>
                        </form>
                        <div class="text-center">
                            <button class="btn btn-primary" id="btnSiguientePrimero"><i class="fa-regular fa-hand-point-right"></i> Siguiente</button>
                        </div>
                    </div>

                    <div class="formulario" id="boxFormularioOcul2" hidden>
                        <div style="min-height: 258px;">
                            <div class="pb-3">
                                <h3 class="text-center titulo-principal-modulo">Detalles de pedido</h3>
                            </div>
                            <div class="mb-2">
                                <label for="cbProductos" class="form-label">Materiales</label>
                                <select id="cbProductos">
                                    <option value=""></option>
                                    <!-- Recorremos los clientes para almacenarlos en un option -->
                                    <?php
                                        foreach ($listaMateriales as $material) {
                                            echo "<option value='" . $material['id'] . "'>" . $material['nombre'] . '</option>';
                                        }
                                    ?>
                                </select>
                            </div>
                            <div class="py-2">
                                <h4 class="titulo-principal-modulo"><i class="fa-solid fa-caret-right"></i> Materiales seleccionados</h4>
                            </div>
                            <form id="segundoFormulario" class="row mb-5">
                                <table class="table table-sm table-bordered text-center" style="font-size: 0.8rem;">
                                    <thead>
                                        <tr>
                                            <th>N°</th>
                                            <th>Material</th>
                                            <th>Cantidad</th>
                                            <th>Costo S/</th>
                                            <th>Importe</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody id="llenarProducto">
                                        <tr>
                                            <td colspan="6" class="text-center">Vacio</td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th colspan="4" class="text-end">Subtotal</th>
                                            <th colspan="2" id="txtSubtotal">S/ 0.00</th>
                                        </tr>
                                        <tr>
                                            <th colspan="4" class="text-end">I.G.V</th>
                                            <th colspan="2" id="txtIgv">S/ 0.00</th>
                                        </tr>
                                        <tr>
                                            <th colspan="4" class="text-end">Total</th>
                                            <th colspan="2" id="txtTotal">S/ 0.00</th>
                                        </tr>
                                    </tfoot>
                                </table>
                                <input type="submit" id="formSegudo" hidden>
                            </form>
                        </div>

                        <div class="d-flex justify-content-between">
                            <button class="btn btn-danger" id="btnAtrasSegundo"><i class="fa-regular fa-hand-point-left"></i> Atras</button>
                            <button class="btn btn-primary" id="btnSiguienteSegundo"><i class="fa-regular fa-hand-point-right"></i> Siguiente</button>
                        </div>
                    </div>
                    <div class="formulario" id="boxFormularioOcul3" hidden>
                        <div style="min-height: 258px;">
                            <div class="pb-3">
                                <h3 class="text-center titulo-principal-modulo">Finalizar pedido</h3>
                            </div>
                            <form id="tercerFormulario" class="row mb-5">
                                <div class="mb-2 col-12">
                                    <strong>Cliente: </strong>
                                    <span id="txtCopiaCliente"></span>
                                </div>
                                <div class="mb-2 col-12">
                                    <strong>Dirección: </strong>
                                    <span id="txtCopiaDireccion"></span>
                                </div>
                                <div class="mb-2 col-12 col-lg-6">
                                    <strong>Celular: </strong>
                                    <span id="txtCopiaCelular"></span>
                                </div>
                                <div class="mb-2 col-12">
                                    <b>Total a pagar: </b>
                                    <strong id="cantidadFinal" class="text-danger"></strong>
                                </div>
                            </form>
                        </div>

                        <div class="d-flex justify-content-between">
                            <button class="btn btn-danger" id="btnAtrasTercero"><i class="fa-regular fa-hand-point-left"></i> Atras</button>
                            <button class="btn btn-secondary" id="btnCancelarTodo"><i class="fa-solid fa-xmark"></i> Cancelar</button>
                            <button class="btn btn-primary" id="btnSiguienteFinalizar"><i class="fa-solid fa-floppy-disk"></i> Guardar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>

</html>