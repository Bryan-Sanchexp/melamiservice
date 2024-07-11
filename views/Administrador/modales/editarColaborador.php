<div class="modal fade" id="editarColaboradorModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar colaborador</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-3 needs-validation" id="frmColaborador">
                    <div class="col-md-6 col-12">
                        <label for="validationCustom01" class="form-label">Nombre</label>
                        <input type="text" name="editarNombre" class="form-control" id="validationCustom01" required>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>
                    <div class="col-md-6 col-12">
                        <label for="validationCustom02" class="form-label">Apellidos</label>
                        <input type="text" name="editarApellidos" class="form-control" id="validationCustom02" required>
                        <div class="valid-feedback">
                            Looks good!
                        </div>

                    </div>
                    <div class="col-12">
                        <label for="validationCustomUsername" class="form-label">Correo</label>
                        <div class="input-group has-validation">
                            <span class="input-group-text" id="inputGroupPrepend">@</span>
                            <input type="text" name="editarCorreo" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
                            <div class="invalid-feedback">
                                Please choose a username.
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="validationCustom03" class="form-label">Direccion</label>
                        <input type="text" name="editarDireccion" class="form-control" id="validationCustom03" required>
                        <div class="invalid-feedback">
                            Please provide a valid city.
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="validationCustom05" class="form-label">Localización</label>
                        <input type="text" name="editarLocalizacion" class="form-control" id="validationCustom05" required>
                        <div class="invalid-feedback">
                            Please provide a valid zip.
                        </div>
                    </div>
                    <div class="col-6">
                        <label for="validationCustom03" class="form-label">Telefono</label>
                        <input type="text" name="editarTelefono" class="form-control" id="validationCustom03" maxlength="7" required>
                        <div class="invalid-feedback">
                            Please provide a valid city.
                        </div>
                    </div>
                    <div class="col-6">
                        <label for="validationCustom03" class="form-label">Celular</label>
                        <input type="text" name="editarCelular" class="form-control" id="validationCustom03" maxlength="9" required>
                        <div class="invalid-feedback">
                            Please provide a valid city.
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <label for="validationCustom05" class="form-label">ROL</label>
                        <select name="editarRol" class="form-select" id="validationCustom05" required>
                            <option value="">Selecciona un rol</option>
                            <option value="venta">Vendedor</option>
                            <option value="logistica">Logistica</option>
                            
                        </select>
                        <div class="invalid-feedback">
                            Please provide a valid zip.
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
                    <input type="submit" id="btnSubmitFrmColaborador" hidden>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="btnModalEditarColaborador">Agregar</button>
            </div>
        </div>
    </div>
</div>