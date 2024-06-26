<div class="modal fade" id="editarMmaterialesModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Material</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-3 needs-validation" id="frmMateriales">
                    <div class="col-12">
                        <label for="validationCustom01" class="form-label">Nombre</label>
                        <input type="text" name="nombre" class="form-control" id="validationCustom01">
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="validationCustom05" class="form-label">Marca</label>
                        <input type="text" name="marca" class="form-control" id="validationCustom05" required>
                        <div class="invalid-feedback">
                            Looks good!.
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="validationCustom03" class="form-label">Precio</label>
                        <input type="text" name="precio" class="form-control" id="validationCustom03" required>
                        <div class="invalid-feedback">
                            Please provide a valid price.
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="validationCustom03" class="form-label">Stock</label>
                        <input type="text" name="stock" class="form-control" id="validationCustom03">
                        <div class="invalid-feedback">
                            Please provide a valid number.
                        </div>
                    </div>
                    
                    
                    <div class="col-12">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="invalidCheck">
                            <label class="form-check-label" for="invalidCheck">
                                Estoy de acurdo con las condiciones
                            </label>
                            <div class="invalid-feedback">
                                You must agree before submitting.
                            </div>
                        </div>
                    </div>
                    <input type="submit" id="btnSubmitFrmMateriales" hidden>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="btnModalMateriales">Agregar</button>
            </div>
        </div>
    </div>
</div>