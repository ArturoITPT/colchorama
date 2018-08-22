 <!--left navigation start-->
<aside class="sidebar-navigation">
    <div class="scrollbar-wrapper">
        <div>
            <button type="button" class="button-menu-mobile btn-mobile-view visible-xs visible-sm">
                <i class="mdi mdi-close"></i>
            </button>
            <!-- User Detail box -->
            <div class="user-details">
                <div class="pull-left">
                    <img src="<?= base_url()?>assets/images/users/avatar-3.jpg" alt="" class="thumb-md img-circle">
                </div>
                <div class="user-info">
                    <a href="#">Marco Molina</a>
                    <p class="text-muted m-0">Administrator</p>
                </div>
            </div>
            <!--- End User Detail box -->

            <!-- Left Menu Start -->
            <ul class="metisMenu nav" id="side-menu">
               
                    

              
                 <li>
                    <a href="javascript: void(0);" aria-expanded="true">
                        <i class="ti-briefcase"></i> Empresas <span class="fa arrow"></span></a>
                    <ul class="nav-second-level nav" aria-expanded="true">
                        <li>
                        <a href="<?= site_url("operator/companies")?>">

                            <i class="ti-package"></i> 
                            Compañias
                        </a>
                        </li>
                        <li>
                        <a href="<?= site_url("operator/branches")?>">

                            <i class="ti-pin2"></i> 
                            Sucursales 
                        </a>
                        </li>
                        <li>
                        <a href="<?= site_url("operator/depots")?>">

                            <i class="ti-pin-alt"></i> 
                            Bodegas 
                        </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="javascript: void(0);" aria-expanded="true">
                        <i class="ti-receipt"></i> Compras <span class="fa arrow"></span></a>
                    <ul class="nav-second-level nav" aria-expanded="true">
                        <li>
                        <a href="<?= site_url("operator/orders")?>">

                            <i class="ti-shopping-cart"></i> 
                            Ordenes de compra 
                        </a>
                        </li>
                        <li>
                        <a href="<?= site_url("operator/products")?>">

                            <i class="ti-shopping-cart"></i> 
                            Productos 
                        </a>
                        </li>
                        <li>
                        <a href="<?= site_url("operator/providers")?>">

                            <i class="ti-truck"></i> 
                            Proveedores 
                        </a>
                        </li>
                    </ul>
                </li>
                
                <li>
                    <a href="javascript: void(0);" aria-expanded="true">
                        <i class="ti-receipt"></i> Contabilidad <span class="fa arrow"></span></a>
                    <ul class="nav-second-level nav" aria-expanded="true">
                        <li>
                        <a href="<?= site_url("operator/receipts_to_pay")?>">

                            <i class="ti-shopping-cart"></i> 
                            Cuentas por pagar
                        </a>
                        </li>
                       
                       
                    </ul>
                </li>
                
                
                <li>
                    <a href="javascript: void(0);" aria-expanded="true">
                        <i class="ti-receipt"></i> Inventarios <span class="fa arrow"></span></a>
                    <ul class="nav-second-level nav" aria-expanded="true">
                        <li>
                        <a href="<?= site_url("operator/receipts")?>">

                            <i class="ti-receipt"></i> 
                            Recibos de compra 
                        </a>
                        </li>
                        <li>
                        <a href="<?= site_url("operator/query")?>">

                            <i class="ti-receipt"></i> 
                            Consulta de Inventario
                        </a>
                        </li>
                        
                    </ul>
                </li>
                
                
                <li>
                    <a href="<?= site_url("operator/employees")?>">

                        <i class="ti-user"></i> 
                        H.R. 
                    </a>
                </li>
                 

                
              

                

                <li>
                    <a href="javascript: void(0);" aria-expanded="true"><i class="ti-light-bulb"></i> Configuración <span class="fa arrow"></span></a>
                    <ul class="nav-second-level nav" aria-expanded="true">
                        <li><a href="<?= site_url2("afores") ?>">Afores</a></li>
                        <li><a href="<?= site_url2("brands") ?>">Marcas</a></li>
                        <li><a href="<?= site_url2("taxes") ?>">Impuestos</a></li>
                        <li><a href="<?= site_url2("paymenttypes") ?>">Tipos de Pago</a></li>
                        <li><a href="<?= site_url2("vehicletypes") ?>">Tipos de Vehículos</a></li>
                        
                        <li><a href="<?= site_url2("adjustments") ?>">Motivos de Ajuste</a></li>
                        <li><a href="<?= site_url2("returns") ?>">Motivos de Devolución</a></li>
                        <li><a href="<?= site_url2("categories") ?>">Categorias</a></li>
                        <li><a href="<?= site_url2("unitsofmeasures") ?>">Unidades de Medida</a></li>
                        <li><a href="<?= site_url2("marketingsources") ?>">Medios de Publicidad</a></li>
                        <li><a href="<?= site_url2("banks") ?>">Bancos</a></li>
                        <li>
                            <a href="<?= site_url("operator/vehicles")?>">

                            <i class="ti-car"></i> 
                            Vehiculos
                            </a>
                        </li>   
                        
                    </ul>
                </li>



            </ul>
        </div>
    </div><!--Scrollbar wrapper-->
</aside>
                <!--left navigation end-->
