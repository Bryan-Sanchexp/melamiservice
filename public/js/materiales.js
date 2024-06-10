function loadPage() {
    let helper = new Helper();
    console.log(helper)
    const configTablaMateriales = {
        ...helper.configuracionDataTable,
        "ajax": {
            "url": helper.urlMateriales,
            "method" : "POST",
            "data": function ( d ) {
                d.accion = 'ver-materiales';
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
                data: 'marca'
            },
            {
                data: 'precio'
            },
            {
                data: 'stock'
            },
            
            {
                data: 'id',
                render : function(data){
                    return `<div class="d-flex justify-content-center" style="gap:5px;"><button class="btn btn-sm btn-outline-info p-1" data-materiales="${data}">
                        <small>
                        <i class="fas fa-pencil-alt"></i>
                        Editar
                        </small>
                    </button>
                    <button class="btn btn-sm btn-outline-danger p-1" data-materiales="${data}">
                        <small>    
                        <i class="fas fa-trash-alt"></i>
                            Eliminar
                        </small>
                    </button></div>`
                }
            }
        ]
    }
    const datatableMateriales = $('#misMateriales').DataTable(configTablaMateriales);
    const tablaMisMateriales = document.querySelector("#misMateriales");
    const modalEditarMateriales = document.querySelector("#materialesModal");
    const modalMateriales = new bootstrap.Modal(modalEditarMateriales);
    tablaMisMateriales.querySelector("tbody").addEventListener("click",async function(event){
        if(event.target.classList.contains("btn-outline-info")){
            modalMateriales.show();
        }
        //
        if(event.target.classList.contains("btn-outline-danger")){
            const idMateriales = event.target.dataset.materiales;
            try {
                const alertaSweet = await helper.sweetAlertConfirm(null,"¿Deseas eliminar este material?");
                if(alertaSweet.isConfirmed){
                    let datos = new FormData();
                    datos.append("accion","eliminar-materiales");
                    datos.append("idMateriales",idMateriales);
                    const response = await helper.peticionHttp(helper.urlMateriales,"POST",datos);
                    if(response.success){
                        datatableMateriales.ajax.reload();
                    }
                    helper.alertaToast(response.success ? "success" : "error", response.success ? response.success : "Error al eliminar el material");
                }
            } catch (error) {
                helper.alertaToast("error","Error al eliminar el material");
                console.error(error);
            }
        }
    });

    const btnModalMateriales= document.querySelector("#btnModalMateriales");
    const frmMateriales = document.querySelector("#frmMateriales ");
    btnModalMateriales.onclick = e => document.querySelector("#btnSubmitFrmMateriales").click();
    frmMateriales.addEventListener("submit",async function(e){
        e.preventDefault();
        // return Swal.fire({
        //     icon: 'error',
        //     text: 'El nombre del material no debe estar vacía'
        // });
        let datos = new FormData(this);
        datos.append("accion","agregar-materiales");
        try {
            const response = await helper.peticionHttp(helper.urlMateriales,"POST",datos);
            if(response.success){
                modalMateriales.hide();
                datatableMateriales.ajax.reload();
                helper.sweetAlert("success",null,response.success);
                this.reset();
            }else if(response.error){
                helper.sweetAlert("error",null,response.error);
            }
        } catch (error) {
            console.error(error);
            helper.sweetAlert("error",null,"Error al agregar el material");
        }
    })
    
}
window.addEventListener("DOMContentLoaded",loadPage);