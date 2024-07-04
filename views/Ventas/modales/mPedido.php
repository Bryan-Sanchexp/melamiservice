<div class="modal fade" id="bodegaModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Pedido</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-3 needs-validation" id="frmBodega">
                    <div class="col-12">
                        <label for="validationCustom01" class="form-label">Cliente</label>
                        <input type="text" name="cliente" class="form-control" id="validationCustom01">
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
                        <input type="text" name="telefono" class="form-control" id="validationCustom03">
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
                        <input type="text" name="fecha" class="form-control" id="validationCustom01">
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="invalidCheck">
                            <label class="form-check-label" for="invalidCheck">
                                Estoy de acuerdo con las condiciones
                            </label>
                            <div class="invalid-feedback">
                                You must agree before submitting.
                            </div>
                        </div>
                    </div>
                    <input type="submit" id="btnSubmitFrmBodega" hidden>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="btnModalBodega">Agregar</button>
            </div>
        </div>
    </div>
</div>