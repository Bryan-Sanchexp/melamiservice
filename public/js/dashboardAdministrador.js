function loadPage() {
    let helper = new Helper();
    let ctxVentasProductos = document.getElementById("productosVendidos");
    let ctxComparacionVentas = document.getElementById("compraracionVentas");
    let listaColores = [ 
        'rgba(255, 99, 132)',
        'rgba(255, 159, 64)',
        'rgba(255, 205, 86)',
        'rgba(75, 192, 192)',
        'rgba(54, 162, 235)',
        'rgba(153, 102, 255)',
        'rgba(201, 203, 207)'
    ];
    let listaBordes = [
        'rgb(255, 99, 132)',
        'rgb(255, 159, 64)',
        'rgb(255, 205, 86)',
        'rgb(75, 192, 192)',
        'rgb(54, 162, 235)',
        'rgb(153, 102, 255)',
        'rgb(201, 203, 207)'
    ];
    let datosVentas = {
        labels: ['Sin Procesar','Procesando','Procesado'],
        datasets: [{
            label : 'Productos',
            barPercentage: 0.5,
            data: [12, 19, 3, 5, 2],
            backgroundColor: listaColores,
            borderColor: listaBordes,
            borderWidth: 1
        }]
    };
    let myChartVentas = new Chart(ctxVentasProductos.getContext('2d'), {
        type: 'bar',
        data: datosVentas,
        options: {
            responsive:true,
            plugins : {
                legend : {
                    labels : {
                        generateLabels : function(e){
                            return [
                               
                            ]
                        }
                    },
                    position : 'right',
                    title : {text: 'Leyenda'}
                }
            }
        }
    });
    let myChartComparacionVentas = new Chart(ctxComparacionVentas.getContext('2d'), {
        type:'line',
        data : {
            labels : ['Abril','Mayo','Junio','Julio'],
            datasets: [
                {
                    label : 'Año 2023',
                    data: [300, 50, 100,60,80],
                    backgroundColor : listaColores[0],
                    borderColor : listaColores[0]
                },
                {
                    label : 'Año 2024',
                    data: [100, 20, 80,150,200],
                    backgroundColor : listaColores[1],
                    borderColor : listaColores[1]
                }
            ],
        }
    })
    const tablaRanking = document.querySelector("#tablaRankin");
    let txtFechaInicio = document.querySelector("#txtFechaInicio");
    let txtFechaFin = document.querySelector("#txtFechaFin");
    async function cargarDashboard(){
        if(!txtFechaInicio.value || !txtFechaFin.value){
            return helper.alertaToast("error","EstableZca los parametros de fecha correctas");
        }
        let datos = new FormData();
        datos.append("fInicio",txtFechaInicio.value);
        datos.append("fFin",txtFechaFin.value);
        datos.append("acciones",'solicitar-datos');
        try {
            const response = await fetch(helper.urlDashboardAdministrador,{
                method:"POST",
                body : datos
            }).then(result => result.json());
            console.log(response)
            //LLENADO DE DATOS PARA EL GRAFICO LINEAL
            myChartComparacionVentas.data.labels = response.ventasRealizadas.year1.map(mes => mes.nombreMes);
            myChartComparacionVentas.data.datasets[1].data = response.ventasRealizadas.year1.map(mes => mes.montoVendido);
            myChartComparacionVentas.data.datasets[0].data = response.ventasRealizadas.year2.map(mes => mes.montoVendido);
            myChartComparacionVentas.update();
            //LLENADO DE DATOS PARA EL GRAFICO DE BARRAS
            myChartVentas.data.labels = response.pedidosPorEstado.map(estado => estado.estado);
            myChartVentas.data.datasets[0].data = response.pedidosPorEstado.map(estado => estado.cantidad);
            // myChartVentas.options.plugins.legend.labels;
            myChartVentas.options = {
                responsive:true,
                plugins : {
                    legend : {
                        labels : {
                            generateLabels : function(e){
                                let datos = [];
                                response.pedidosPorEstado.forEach((estado,key) => {
                                    datos.push({
                                        text : estado.estado,
                                        fillStyle: listaColores[key],
                                        strokeStyle: listaBordes[key]
                                    })
                                });
                                return datos;
                            }
                        },
                        position : 'right',
                        title : {text: 'Leyenda'}
                    }
                }
            }
            myChartVentas.update();
            
         
            let template = "";
            response.rankingMateriales.forEach((material,key) => {
                template +=`<tr>
                <td>${key + 1}</td>
                <td>${material.material}</td>
                <td>${material.cantidad}</td>
                </tr>`
            });
            tablaRanking.innerHTML = !template ? `<tr><td colspan="100%" class="text-center">No se encontraron registros</td></tr>` : template; 
        } catch (error) {
            console.error(error);
        }
    }
    cargarDashboard();
    for (const filtro of document.querySelectorAll(".filtro-aplicar")) {
        console.log("filtro")
        filtro.addEventListener("change",cargarDashboard);
    }
    document.querySelector("#btnImprimirPdf").onclick = function(e){
        window.print();
    }
}
window.addEventListener("DOMContentLoaded",loadPage);