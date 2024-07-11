function loadPage() {
    let helper = new Helper();
    const configTablaProductos = {
        ...helper.configuracionDataTable,
        "ajax": {
            "url": helper.urlColaboradores,
            "method" : "POST",
            "data": function ( d ) {
                d.accion = 'ver-colaboradores';
            }
        },
        columns: [
            {
                data: 'id',
                render: function(data,type,row, meta){
                    return meta.row + 1;
                }
            },
            {
                data: 'nombre'
            },
            {
                data: 'apellidos'
            },
            {
                data: 'direccion'
            },
            {
                data: 'localizacion'
            },
            {
                data: 'rol'
            },
            {
                data: 'correo'
            },
            
            {
                data: 'telefono'
            },
            {
                data: 'celular'
            },
            
            {
                data: 'id',
                render : function(data,type,row, meta){
                    return `<div class="d-flex justify-content-center" style="gap:5px;">
                    <button class="btn btn-sm btn-outline-info p-1" data-colaboradores="${data}" data-meta="${meta.row}">
                        <small>
                        <i class="fas fa-pencil-alt"></i>
                        Editar
                        </small>
                    </button>
                    <button class="btn btn-sm btn-outline-danger p-1" data-colaboradores="${data}" >
                        <small>    
                        <i class="fas fa-trash-alt"></i>
                            Eliminar
                        </small>
                    </button></div>`
                }
            }
        ]
    }
    const datatableMisBodegas = $('#misBodegas').DataTable(configTablaProductos);

    const modalColaborador = document.querySelector("#editarColaboradorModal");
    const modalBoxEditarColaborador = new bootstrap.Modal(modalColaborador );
    const tablaMisBodegas = document.querySelector("#misBodegas tbody");

    
    tablaMisBodegas.addEventListener("click",async function(event){
        if(event.target.classList.contains("btn-outline-info")){
            datatableRow = datatableMisBodegas.row(event.target.dataset.meta).data()
            modalBoxEditarColaborador.show();

            document.querySelector('input[name="editarNombre"]').value= datatableRow.nombre;
            document.querySelector('input[name="editarApellidos"]').value = datatableRow.apellidos;
            document.querySelector('input[name="editarCorreo"]').value = datatableRow.correo;
            document.querySelector('input[name="editarDireccion"]').value = datatableRow.direccion;
            document.querySelector('input[name="editarLocalizacion"]').value = datatableRow.localizacion;
            document.querySelector('input[name="editarTelefono"]').value = datatableRow.telefono;
            document.querySelector('input[name="editarCelular"]').value = datatableRow.celular;
                
        }
        if(event.target.classList.contains("btn-outline-danger")){
            const idColaborador = event.target.dataset.colaboradores;
            try {
                const alertaSweet = await helper.sweetAlertConfirm(null,"¿Deseas eliminar este colaborador?");
                if(alertaSweet.isConfirmed){
                    let datos = new FormData();
                    datos.append("accion","eliminar-colaborador");
                    datos.append("idColaborador",idColaborador );
                    const response = await helper.peticionHttp(helper.urlColaboradores,"POST",datos);
                    if(response.success){
                        datatableMisBodegas.ajax.reload();
                    }
                    helper.alertaToast(response.success ? "success" : "error", response.success ? response.success : "Error al eliminar pedido");
                }
            } catch (error) {
                helper.alertaToast("error","Error al eliminar colaborador");
                console.error(error);
            }
        }
    });


    const modalBodega = document.querySelector("#bodegaModal");
    const modalBoxBodega = new bootstrap.Modal(modalBodega);
    const btnModalBodega = document.querySelector("#btnModalBodega");
    const frmBodega = document.querySelector("#frmBodega");
    btnModalBodega.onclick = e => document.querySelector("#btnSubmitFrmBodega").click();
    frmBodega.addEventListener("submit",async function(e){
        e.preventDefault();
        // return Swal.fire({
        //     icon: 'error',
        //     text: 'El correo electrónico es invalido'
        // });
        let datos = new FormData(this);
        datos.append("accion","agregar-colaboradores");
        try {
            const response = await helper.peticionHttp(helper.urlColaboradores,"POST",datos);
            if(response.success){
                modalBoxBodega.hide();
                frmBodega.reset();
                datatableMisBodegas.ajax.reload();
                helper.sweetAlert("success",null,response.success);
            }else if(response.error){
                helper.sweetAlert("error",null,response.error);
            }
        } catch (error) {
            helper.sweetAlert("error",null,"Error al agregar al Colaborador");
        }
    })
    
}
window.addEventListener("DOMContentLoaded",loadPage);