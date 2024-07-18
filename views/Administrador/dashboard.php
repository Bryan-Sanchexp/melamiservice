<section class="P-2">
    <div class="row mb-5 filtros-cabecera">
        <h4 class="col-12 col-lg-6 col-xl-7 titulo-principal-modulo">
            <i class="fa-solid fa-caret-right"></i> Parametros de entrada
        </h4>
        <div class="col-6 col-lg-3 col-xl-2">
            <label for="txtFechaInicio">Fecha Inicio</label>
            <input type="date" class="form-control filtro-aplicar" value="<?php echo date("Y-m-d",strtotime(date('Y-m-d')."- 6 months"))?>" id="txtFechaInicio">
        </div>
        <div class="col-6 col-lg-3 col-xl-2">
            <label for="txtFechaFin">Fecha Fin</label>
            <input type="date" id="txtFechaFin" class="form-control filtro-aplicar" value="<?php echo date("Y-m-d",strtotime(date('Y-m-d')."+ 4 months"))?>">
        </div>
        
        <div class="col-6 col-lg-3 col-xl-1">
            
            <button type="button" class="btn btn-sm btn-danger" title="Imprimir" id="btnImprimirPdf"><i class="fas fa-print"></i></button>
        </div>
    </div>
    <div class="row">
        <div class="graficos-informes mb-3 col-12 col-lg-6">
            <div class="border p-2 bg-white">
                <h4 class="text-center titulo-principal-modulo">Pedidos por estado</h4>
                <div class="p-3">
                <canvas id="productosVendidos"></canvas>
                </div>
            </div>
        </div>
        <div class="graficos-informes mb-3 col-12 col-lg-6">
            <div class="border p-2 bg-white">
                <h4 class="text-center titulo-principal-modulo">Ranking de materiales</h4>
                <div class="response-table p-3">
                <table class="table table-sm table-bordered">
                    <thead>
                        <tr>
                            <th>NRO</th>
                            <th>NOMBRE</th>
                            <th>CANTIDAD</th>
                        </tr>
                    </thead>
                    <tbody id="tablaRankin">
                        
                    </tbody>
                </table>
                </div>
                
            </div>
        </div>
        <div class="graficos-informes mb-3 col-12 col-lg-12">
            <div class="border p-2 bg-white">
                <h4 class="text-center titulo-principal-modulo">Comparación de pedidos</h4>
                <div class="p-2">
                <canvas id="compraracionVentas"></canvas>
                </div>
            </div>
        </div>
    </div>
</section>