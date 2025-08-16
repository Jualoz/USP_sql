--select * from menu

INSERT INTO Menu (NombreMenu, DescripcionMenu, Ruta, Icono, Orden, Activo, Status, FechaCreacion) VALUES 
(''Dashboard'', ''Panel principal del sistema'', ''secured/dashboard'', ''faGauge'', 1, 1, ''Active'', GETDATE()),
(''Mantenimientos'', ''Panel de Mantenimientos'', ''/'', ''faGear'', 2, 1, ''Active'', GETDATE()),
(''Afiliados'', ''Panel de Afiliados'', ''/'', ''faUser'', 3, 1, ''Active'', GETDATE()),
(''Manual Tarifario'', ''Panel de Manual Tarifario'', ''/'', ''faFlag'', 4, 1, ''Active'', GETDATE()),
(''Procesar Periodos'', ''Panel de Procesar Periodos'', ''/'', ''faChalkboardUser'', 5, 1, ''Active'', GETDATE()),
(''Reportes'', ''Panel de Reportes'', ''/'', ''faSquarePen'', 6, 1, ''Active'', GETDATE()),
(''Configuracion Contable'', ''Panel de Configuracion Contable'', ''/'', ''faLocationDot'', 7, 1, ''Active'', GETDATE()),
(''Proyectos'', ''Panel de Proyectos'', ''/'', ''faLocationDot'', 8, 1, ''Active'', GETDATE()),
(''PQR'', ''Panel de Peticiones / Quejas / Reclamos'', ''/'', ''faInbox'', 9, 1, ''Active'', GETDATE());
GO

DECLARE @IdPadre INT;
-- Hijos de Mantenimientos
SELECT @IdPadre = IdMenu FROM Menu where NombreMenu LIKE ''Mantenimientos'' AND IdMenuPadre IS NULL
INSERT INTO Menu (NombreMenu, DescripcionMenu, Ruta, Icono, Orden, Activo, Status, FechaCreacion, IdMenuPadre) VALUES 
--(''Barrios'', ''Mantenimiento de Barrios'', ''/secured/barrios'', ''faMinus'', 1, 1, ''Active'', GETDATE(), @IdPadre),
(''Usuarios'', ''Mantenimiento de Usuarios'', ''/secured/usuarios'', ''faMinus'', 2, 1, ''Active'', GETDATE(), @IdPadre),
(''Estratos'', ''Mantenimiento de Estratos'', ''/secured/estratos'', ''faMinus'', 3, 1, ''Active'', GETDATE(), @IdPadre),
(''Periodos'', ''Mantenimiento de Periodos'', ''/secured/periodos'', ''faMinus'', 4, 1, ''Active'', GETDATE(), @IdPadre),
(''Clases'', ''Mantenimiento de Clases'', ''/secured/clases'', ''faMinus'', 5, 1, ''Active'', GETDATE(), @IdPadre),
(''Rutas'', ''Mantenimiento de Rutas'', ''/secured/rutas'', ''faMinus'', 6, 1, ''Active'', GETDATE(), @IdPadre),
(''Conceptos'', ''Mantenimiento de Conceptos'', ''/secured/conceptos'', ''faMinus'', 7, 1, ''Active'', GETDATE(), @IdPadre),
(''Conceptos Unicos'', ''Mantenimiento de Conceptos Unicos'', ''/secured/conceptos-unico-cobro'', ''faMinus'', 8, 1, ''Active'', GETDATE(), @IdPadre),
(''Servicios'', ''Mantenimiento de Servicios'', ''/secured/servicios'', ''faMinus'', 9, 1, ''Active'', GETDATE(), @IdPadre),
(''Productos'', ''Mantenimiento de Productos'', ''/secured/producto'', ''faMinus'', 10, 1, ''Active'', GETDATE(), @IdPadre),
(''Revisado'', ''Mantenimiento de Revisado'', ''/secured/revisado'', ''faMinus'', 11, 1, ''Active'', GETDATE(), @IdPadre),
(''Parametros'', ''Mantenimiento de Parametros'', ''/secured/parametros'', ''faMinus'', 12, 1, ''Active'', GETDATE(), @IdPadre),
(''Historico de Pagos'', ''Mantenimiento de Historico de Pagos'', ''/secured/registro-pago'', ''faMinus'', 13, 1, ''Active'', GETDATE(), @IdPadre),
(''Anuncios Facturacion'', ''Mantenimiento de Anuncios Facturacion'', ''/secured/anuncios'', ''faMinus'', 14, 1, ''Active'', GETDATE(), @IdPadre),

(''PQR'', ''Mantenimiento de PQR'', ''/'', ''faMinus'', 15, 1, ''Active'', GETDATE(), @IdPadre),
(''Historico de Pagos'', ''Mantenimiento de Historico de Pagos'', ''/secured/registro-pago'', ''faMinus'', 16, 1, ''Active'', GETDATE(), @IdPadre),
(''Roles / Menu'', ''Mantenimiento de Roles y Menu'', ''/'', ''faMinus'', 17, 1, ''Active'', GETDATE(), @IdPadre);

-- SubMenu de roles
SELECT @IdPadre = IdMenu FROM Menu where NombreMenu LIKE ''Roles / Menu'' AND IdMenuPadre IS NOT NULL
INSERT INTO Menu (NombreMenu, DescripcionMenu, Ruta, Icono, Orden, Activo, Status, FechaCreacion, IdMenuPadre) VALUES 
(''Menu'', ''Mantenimiento de Menu'', ''/secured/menu'', ''faMinus'', 1, 1, ''Active'', GETDATE(), @IdPadre),
(''Rol'', ''Mantenimiento de Roles'', ''/secured/roles'', ''faMinus'', 2, 1, ''Active'', GETDATE(), @IdPadre),
(''Asignar Menu a Roles'', ''Mantenimiento de Roles Menu'', ''/secured/roles/menu'', ''faMinus'', 3, 1, ''Active'', GETDATE(), @IdPadre),
(''Asignar Roles a Usuario'', ''Mantenimiento de Roles Usuario'', ''/secured/roles/usuarios'', ''faMinus'', 4, 1, ''Active'', GETDATE(), @IdPadre);

-- Hijos de Afiliados 
SELECT @IdPadre = IdMenu FROM Menu where NombreMenu LIKE ''Afiliados'' AND IdMenuPadre IS NULL
INSERT INTO Menu (NombreMenu, DescripcionMenu, Ruta, Icono, Orden, Activo, Status, FechaCreacion, IdMenuPadre) VALUES 
(''Afiliados'', ''Gestión de Afiliados'', ''/secured/afiliados'', ''faMinus'', 1, 1, ''Active'', GETDATE(), @IdPadre),
(''Revisión'', ''Revisión de Afiliados'', ''/secured/revision'', ''faMinus'', 2, 1, ''Active'', GETDATE(), @IdPadre),
(''Afiliado - Concepto'', ''Relación Afiliado-Concepto'', ''/secured/afiliados-conceptos'', ''faMinus'', 3, 1, ''Active'', GETDATE(), @IdPadre),
(''Solicitud Servicio'', ''Solicitud de Servicio'', ''/secured/solicitud-servicio'', ''faMinus'', 4, 1, ''Active'', GETDATE(), @IdPadre),
(''Orden Trabajo'', ''Orden de Trabajo'', ''/secured/orden-trabajo'', ''faMinus'', 5, 1, ''Active'', GETDATE(), @IdPadre),
(''Reclamos'', ''Gestión de Reclamos'', ''/secured/reclamo'', ''faMinus'', 6, 1, ''Active'', GETDATE(), @IdPadre),
(''Solicitud Conexión'', ''Solicitud de Conexión'', ''/secured/solicitud-conexion'', ''faMinus'', 7, 1, ''Active'', GETDATE(), @IdPadre);

-- Hijos de Manual Tarifario 
SELECT @IdPadre = IdMenu FROM Menu where NombreMenu LIKE ''Manual Tarifario'' AND IdMenuPadre IS NULL
INSERT INTO Menu (NombreMenu, DescripcionMenu, Ruta, Icono, Orden, Activo, Status, FechaCreacion, IdMenuPadre) VALUES 
(''Intereses'', ''Gestión de Intereses'', ''/secured/intereses'', ''faMinus'', 1, 1, ''Active'', GETDATE(), @IdPadre),
(''Tarifas'', ''Gestión de Tarifas'', ''/secured/tarifas'', ''faMinus'', 2, 1, ''Active'', GETDATE(), @IdPadre);

-- Hijos de Procesar Periodos 
SELECT @IdPadre = IdMenu FROM Menu where NombreMenu LIKE ''Procesar Periodos'' AND IdMenuPadre IS NULL
INSERT INTO Menu (NombreMenu, DescripcionMenu, Ruta, Icono, Orden, Activo, Status, FechaCreacion, IdMenuPadre) VALUES 
(''Lecturas'', ''Gestión de Lecturas'', ''/secured/lecturas'', ''faMinus'', 1, 1, ''Active'', GETDATE(), @IdPadre),
(''Procesar periodo'', ''Procesar Periodos'', ''/secured/procesar-periodos'', ''faMinus'', 2, 1, ''Active'', GETDATE(), @IdPadre),
(''Consultar facturas'', ''Consulta de Facturas'', ''/secured/facturas'', ''faMinus'', 3, 1, ''Active'', GETDATE(), @IdPadre),
(''Factura de venta'', ''Factura de Venta'', ''/secured/factura-venta'', ''faMinus'', 4, 1, ''Active'', GETDATE(), @IdPadre),
(''Facturacion electronica'', ''Facturación Electrónica'', ''/secured/facturas/facturas-equivalentes'', ''faMinus'', 5, 1, ''Active'', GETDATE(), @IdPadre),
(''Matriculas'', ''Factura Manual'', ''/secured/factura-manual'', ''faMinus'', 6, 1, ''Active'', GETDATE(), @IdPadre),
(''Correccion Facturas'', ''Corrección de Facturas'', ''/secured/correccion-facturas'', ''faMinus'', 7, 1, ''Active'', GETDATE(), @IdPadre),
(''Anular Pagos'', ''Anulación de Pagos'', ''/secured/facturas/anular-pagos'', ''faMinus'', 8, 1, ''Active'', GETDATE(), @IdPadre),
(''Pago Manual'', ''Pago Manual'', ''/secured/pago-manual'', ''faMinus'', 9, 1, ''Active'', GETDATE(), @IdPadre),
(''Financiacion'', ''Acuerdos de Pago'', ''/secured/acuerdo-pago'', ''faMinus'', 10, 1, ''Active'', GETDATE(), @IdPadre),
(''Saldos a Favor'', ''Saldos a Favor'', ''/secured/saldo-favor'', ''faMinus'', 11, 1, ''Active'', GETDATE(), @IdPadre);

-- Hijos de Reportes  
SELECT @IdPadre = IdMenu FROM Menu where NombreMenu LIKE ''Reportes'' AND IdMenuPadre IS NULL
INSERT INTO Menu (NombreMenu, DescripcionMenu, Ruta, Icono, Orden, Activo, Status, FechaCreacion, IdMenuPadre) VALUES 
(''Impresión masiva de Facturas'', ''Impresión Masiva de Facturas'', ''/secured/impresion-facturas'', ''faMinus'', 1, 1, ''Active'', GETDATE(), @IdPadre),
(''Reporte de Facturacion'', ''Reporte de Facturación'', ''/secured/reportes/cartera'', ''faMinus'', 2, 1, ''Active'', GETDATE(), @IdPadre),
(''Reporte de Facturacion Detallada'', ''Reporte de Facturación Detallada'', ''/secured/reportes/cartera-detalle'', ''faMinus'', 3, 1, ''Active'', GETDATE(), @IdPadre),
(''Toma de Lecturas'', ''Reporte de Toma de Lecturas'', ''/secured/reportes/lecturas'', ''faMinus'', 4, 1, ''Active'', GETDATE(), @IdPadre),
(''Recaudacion x Periodo'', ''Recaudación por Periodo'', ''/secured/reportes/recaudacion-periodo-estado'', ''faMinus'', 5, 1, ''Active'', GETDATE(), @IdPadre),
(''Recaudacion x Periodo Detallado'', ''Recaudación por Periodo Detallado'', ''/secured/reportes/recaudacion-periodo-estado-detalle'', ''faMinus'', 6, 1, ''Active'', GETDATE(), @IdPadre),
(''Personalizados'', ''Reportes Personalizados'', ''/secured/reportes/personalizados'', ''faMinus'', 7, 1, ''Active'', GETDATE(), @IdPadre);

-- Hijos de Configuracion Contable 
SELECT @IdPadre = IdMenu FROM Menu where NombreMenu LIKE ''Configuracion Contable'' AND IdMenuPadre IS NULL
INSERT INTO Menu (NombreMenu, DescripcionMenu, Ruta, Icono, Orden, Activo, Status, FechaCreacion, IdMenuPadre) VALUES 
(''PlanCuentas'', ''Plan de Cuentas'', ''/secured/plancuentas'', ''faMinus'', 1, 1, ''Active'', GETDATE(), @IdPadre),
(''FuenteFinanciacion'', ''Fuente de Financiación'', ''/secured/fuentefinanciacion'', ''faMinus'', 2, 1, ''Active'', GETDATE(), @IdPadre),
(''Naturaleza'', ''Naturaleza Contable'', ''/secured/naturaleza'', ''faMinus'', 3, 1, ''Active'', GETDATE(), @IdPadre),
(''Configuracion Contable'', ''Configuración Contable'', ''/secured/configuracion-contable'', ''faMinus'', 4, 1, ''Active'', GETDATE(), @IdPadre);

-- Hijos de Proyectos 
SELECT @IdPadre = IdMenu FROM Menu where NombreMenu LIKE ''Proyectos'' AND IdMenuPadre IS NULL
INSERT INTO Menu (NombreMenu, DescripcionMenu, Ruta, Icono, Orden, Activo, Status, FechaCreacion, IdMenuPadre) VALUES 
(''Proyectos'', ''Gestión de Proyectos'', ''/secured/proyectos'', ''faMinus'', 1, 1, ''Active'', GETDATE(), @IdPadre);

-- Hijos de PQR 
SELECT @IdPadre = IdMenu FROM Menu where NombreMenu LIKE ''PQR'' AND IdMenuPadre IS NULL
INSERT INTO Menu (NombreMenu, DescripcionMenu, Ruta, Icono, Orden, Activo, Status, FechaCreacion, IdMenuPadre) VALUES 
(''Peticiones / Quejas / Reclamos'', ''Gestión de PQR'', ''/secured/pqr'', ''faMinus'', 1, 1, ''Active'', GETDATE(), @IdPadre);

-- Luego los otros items PQR que estaban en el array menuPQR
SELECT @IdPadre = IdMenu FROM Menu where NombreMenu LIKE ''PQR'' AND IdMenuPadre IS NOT NULL
INSERT INTO Menu (NombreMenu, DescripcionMenu, Ruta, Icono, Orden, Activo, Status, FechaCreacion, IdMenuPadre) VALUES 
(''Presentacion'', ''Presentación de PQR'', ''/secured/presentacion'', ''faMinus'', 2, 1, ''Active'', GETDATE(), @IdPadre),
(''Notificacion'', ''Notificación de PQR'', ''/secured/notificacion'', ''faMinus'', 3, 1, ''Active'', GETDATE(), @IdPadre),
(''Dependencia'', ''Dependencias para PQR'', ''/secured/dependencia'', ''faMinus'', 4, 1, ''Active'', GETDATE(), @IdPadre),
(''Aforador'', ''Aforadores para PQR'', ''/secured/aforador'', ''faMinus'', 5, 1, ''Active'', GETDATE(), @IdPadre),
(''Causal'', ''Causales de PQR'', ''/secured/causal-pqr'', ''faMinus'', 6, 1, ''Active'', GETDATE(), @IdPadre),
(''Causal Refacturacion'', ''Causales de Refacturación'', ''/secured/causal-refacturacion'', ''faMinus'', 7, 1, ''Active'', GETDATE(), @IdPadre),
(''Clase'', ''Clases de PQR'', ''/secured/clase-pqr'', ''faMinus'', 8, 1, ''Active'', GETDATE(), @IdPadre),
(''Concepto'', ''Conceptos de PQR'', ''/secured/concepto-pqr'', ''faMinus'', 9, 1, ''Active'', GETDATE(), @IdPadre),
(''Detalle Clase'', ''Detalles de Clase PQR'', ''/secured/detalle-clase-pqr'', ''faMinus'', 10, 1, ''Active'', GETDATE(), @IdPadre),
(''Tipo Tramite'', ''Tipos de Trámite PQR'', ''/secured/tipo-tramite'', ''faMinus'', 11, 1, ''Active'', GETDATE(), @IdPadre);
