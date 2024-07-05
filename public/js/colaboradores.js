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
                render : function(data){
                    return `<div class="d-flex justify-content-center" style="gap:5px;">
                    <button class="btn btn-sm btn-outline-info p-1" data-colaboradores="${data}">
                        <small>
                        <i class="fas fa-pencil-alt"></i>
                        Editar
                        </small>
                    </button>
                    <button class="btn btn-sm btn-outline-danger p-1" data-colaboradores="${data}">
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
    const modalBodega = document.querySelector("#bodegaModal");
    const modalBoxBodega = new bootstrap.Modal(modalBodega);
    const tablaMisBodegas = document.querySelector("#misBodegas tbody");
    tablaMisBodegas.addEventListener("click",function(event){
        if(event.target.classList.contains("btn-outline-info")){
            modalBoxBodega.show();
        }
    });
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