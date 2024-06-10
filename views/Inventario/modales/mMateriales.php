<div class="modal fade" id="materialesModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Materiales</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-3 needs-validation" id="frmMateriales">
                    <div class="col-12">
                        <label for="idNombreMateriales" class="form-label">Materiales</label>
                        <input type="text" name="nombre_materiales" class="form-control" id="idNombreMateriales">
                        <div class="valid-feedback">
                            Looks good!
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