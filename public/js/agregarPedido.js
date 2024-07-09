function loadPage(){
    let helper = new Helper();
    let materiales = [];
    const tablaProducto = document.querySelector("#llenarProducto");
    $('#cbProductos').select2({
        theme: 'bootstrap',
        width: '100%',
        placeholder: 'Seleccione un material'
    }).on("select2:select",function(e){
        const valor = $(this).val();
        const index = materiales.findIndex(p => p.id == valor);
        if(index < 0){
            let datos = new FormData();
            datos.append("idMaterial",valor);
            datos.append("accion",'ver-material');
            fetch(helper.urlMateriales,{
                method: "POST",
                body : datos
            }).then(response => response.json())
            .then(data => {
                if(data){
                    helper.alertaToast("success","Material agregado correctamente");
                    if(!materiales.length){
                        tablaProducto.innerHTML = "";
                    }
                    materiales.push({
                        id : data[0].id,
                        nombre : data[0].nombre,
                        precio: parseFloat(data[0].precio),
                        cantidad : 1,
                        sub_total : parseFloat(data[0].precio)
                    });
                    let tr = document.createElement("tr");
                    tr.dataset.producto = "producto_" + data[0].id;
                    tr.innerHTML = `
                    <td>${materiales.length}</td>
                    <td>${data[0].nombre}</td>
                    <td><input style="max-width:70px;" type="number" class="form-control form-control-sm m-auto" data-producto="${data[0].id}" value="1"  min="1" max="${data[0].stock}"></td>
                    <td>${helper.resetearMoneda(data[0].precio)}</td>
                    <td class="subtotal">${helper.resetearMoneda(data[0].precio)}</td>
                    <td><button type="button" data-producto="${data[0].id}" class="btn btn-sm btn-danger" title="Eliminar producto"><i class="fas fa-trash-alt"></i></button></td>
                    `
                    tablaProducto.append(tr);
                    tr.querySelector("input").addEventListener("change",cambiarCantidad);
                }
                calcularCostos();
            }).catch(error => {
                console.log(error);
                alert("Error al seleccionar un material");
            });
        }else{
            materiales[index].cantidad++;
            materiales[index].sub_total = materiales[index].cantidad * materiales[index].precio;
            const tr = tablaProducto.querySelector(`[data-producto="producto_${materiales[index].id}"]`);
            tr.querySelector("input").value = materiales[index].cantidad;
            tr.querySelector(".subtotal").textContent = helper.resetearMoneda(materiales[index].sub_total);
            helper.alertaToast("success","Producto incrementado correctamente");
            calcularCostos();
        }
    })
    function cambiarCantidad(e) {

        const cantidad = isNaN(e.target.value) ? 1 : parseInt(e.target.value);
        const index = materiales.findIndex(p => p.id == e.target.dataset.producto);
        if(index >= 0){
            materiales[index].cantidad = cantidad;
            materiales[index].sub_total = materiales[index].cantidad * materiales[index].precio;
            const tr = tablaProducto.querySelector(`[data-producto="producto_${materiales[index].id}"]`);
            tr.querySelector("input").value = materiales[index].cantidad;
            tr.querySelector(".subtotal").textContent = helper.resetearMoneda(materiales[index].sub_total);
            e.target.value = cantidad;
            calcularCostos();
        }
    }
    function calcularCostos() {
        let total = 0;
        materiales.forEach(p => {
            total += p.sub_total
        });
        document.querySelector("#txtSubtotal").textContent = helper.resetearMoneda(total);
        document.querySelector("#txtIgv").textContent = helper.resetearMoneda(0.18 * total);
        document.querySelector("#txtTotal").textContent = helper.resetearMoneda(total+0.18 * total);
        document.querySelector("#cantidadFinal").textContent = helper.resetearMoneda(total+0.18 * total);
    }

    tablaProducto.onclick = function(e){
        if(e.target.classList.contains("btn-danger")){
            materiales = materiales.filter( p => p.id != e.target.dataset.producto)
            e.target.parentElement.parentElement.remove();
            if(!materiales.length){
                $('#cbProductos').val("")
                tablaProducto.innerHTML = `
                <tr>
                    <td colspan="6" class="text-center">Vacío</td>
                </tr>
                `;
            }
            calcularCostos();
        }
    }


    document.querySelector("#btnSiguientePrimero").onclick = e => document.querySelector("#formFrimero").click();
    document.querySelector("#btnSiguienteSegundo").onclick = e => document.querySelector("#formSegudo").click();
    const boxFormulario1 = document.querySelector("#boxFormularioOcul1");
    const boxFormulario2 = document.querySelector("#boxFormularioOcul2");
    const boxFormulario3 = document.querySelector("#boxFormularioOcul3");
    const primerFormulario = document.querySelector("#primerFormulario");
    const segundoFormulario = document.querySelector("#segundoFormulario");

    const boxPasos = document.querySelectorAll(".paso"); 

    primerFormulario.addEventListener("submit",function(e){
        e.preventDefault();

        boxFormulario1.hidden = true;
        boxFormulario2.hidden = false;
        boxPasos[0].querySelector(".regla").style.width = "102px";
        boxPasos[1].style.backgroundColor = "var(--color-principal)";
        boxPasos[1].style.color = "#fff";
    });
    segundoFormulario.addEventListener("submit",function(e){
        let formData = new FormData(primerFormulario);
        e.preventDefault();
        if(!materiales.length){
            return helper.alertaToast("error","Por favor agregue al menos un material");
        }
        document.querySelector("#txtCopiaCliente").textContent = formData.get("cliente")
        document.querySelector("#txtCopiaDireccion").textContent = formData.get("direccion")
        document.querySelector("#txtCopiaCelular").textContent = formData.get("telefono")

        boxFormulario2.hidden = true;
        boxFormulario3.hidden = false;
        boxPasos[1].querySelector(".regla").style.width = "102px";
        boxPasos[2].style.backgroundColor = "var(--color-principal)";
        boxPasos[2].style.color = "#fff";

    });
    document.querySelector("#btnAtrasSegundo").onclick = e => {
        boxFormulario1.hidden = false;
        boxFormulario2.hidden = true;
        boxPasos[0].querySelector(".regla").style.width = "0";
        boxPasos[1].style.backgroundColor = "";
        boxPasos[1].style.color = "";
    }
    document.querySelector("#btnAtrasTercero").onclick = e => {
        boxFormulario2.hidden = false;
        boxFormulario3.hidden = true;
        boxPasos[1].querySelector(".regla").style.width = "0";
        boxPasos[2].style.backgroundColor = "";
        boxPasos[2].style.color = "";
    }
    document.querySelector("#btnSiguienteFinalizar").addEventListener("click", function (e) {
        e.preventDefault();
        let formData = new FormData(primerFormulario);
        formData.append("detalle",JSON.stringify(materiales));
        formData.append('accion','agregar-pedido');
        fetch(helper.urlPedidos,{
            method: "POST",
            body : formData
        }).then(response => response.json())
        .then(data => {
            
            if(data.error){
                return helper.alertaToast("error",data.error);
            }
            if(data.success){
                Swal.fire({
                    icon: 'success',
                    text: data.success
                }).then(result => {
                    window.location.reload();
                });
            }
        }).catch(error => {
            console.error(error);
            alert("Error al registrar pedido - js");
        });
    });
    document.querySelector("#btnCancelarTodo").onclick = async e => {
        try {
            const alertaSweet = await helper.sweetAlertConfirm(null,"¿Deseas cancelar este Pedido que todos los datos ingresados se perderan","Aceptar");
            if(alertaSweet.isConfirmed){
                window.location.reload();
            }
        } catch (error) {
            console.error(error);
            helper.alertaToast("error","Error al cancelar el pedido");
        }
    }
}
window.addEventListener("DOMContentLoaded",loadPage);