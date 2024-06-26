function loadPage() {
    let helper = new Helper();
    
    const configTablaProductos = {
        ...helper.configuracionDataTable,
        "ajax": {
            "url": helper.urlPedidos,
            "method" : "POST",
            "data": function ( d ) {
                d.accion = 'ver-pedidos';
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
                data: 'cliente'
            },
            {
                data: 'direccion'
            },
            {
                data: 'ciudad'
            },
            {
                data: 'telefono'
            },
            {
                data: 'correo'
            },
            {
                data: 'fecha'
            },
            
            {
                data: 'id',
                render : function(data){
                    return `
                        <button class="btn btn-sm btn-outline-danger p-1" data-bodega="${data}">
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
    tablaMisBodegas.addEventListener("click", async function(event){
        if(event.target.classList.contains("btn-outline-info")){
            modalBoxBodega.show();
        }
        if(event.target.classList.contains("btn-outline-danger")){
            const idPedido = event.target.dataset.bodega;
            try {
                const alertaSweet = await helper.sweetAlertConfirm(null,"¿Deseas eliminar este pedido?");
                if(alertaSweet.isConfirmed){
                    let datos = new FormData();
                    datos.append("accion","eliminar-pedido");
                    datos.append("idPedido",idPedido);
                    const response = await helper.peticionHttp(helper.urlPedidos,"POST",datos);
                    if(response.success){
                        datatableMisBodegas.ajax.reload();
                    }
                    helper.alertaToast(response.success ? "success" : "error", response.success ? response.success : "Error al eliminar pedido");
                }
            } catch (error) {
                helper.alertaToast("error","Error al eliminar pedido");
                console.error(error);
            }
        }
    });



    const btnModalBodega = document.querySelector("#btnModalBodega");
    const frmBodega = document.querySelector("#frmBodega");
    btnModalBodega.onclick = e => document.querySelector("#btnSubmitFrmBodega").click();
    frmBodega.addEventListener("submit",async function(e){
        e.preventDefault();
       
        let datos = new FormData(this);
       
        datos.append("accion","agregar-pedido");
        try {
            const response = await helper.peticionHttp(helper.urlPedidos,"POST",datos);
            if(response.success){
                modalBoxBodega.hide();
                datatableMisBodegas.ajax.reload();
                helper.sweetAlert("success",null,response.success);
            }else if(response.error){
                helper.sweetAlert("error",null,response.error);
            }
        } catch (error) {
            helper.sweetAlert("error",null,"Error al agregar pedido");
        }
    })
    
}
window.addEventListener("DOMContentLoaded",loadPage);