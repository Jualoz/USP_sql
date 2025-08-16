DECLARE @IdPadre INT;
DECLARE @IdMenu INT;
DECLARE @URL VARCHAR(50) = '/secured/novedades-afiliados';

SELECT @IdPadre = IdMenu FROM Menu where NombreMenu LIKE 'Afiliados' AND IdMenuPadre IS NULL
INSERT INTO Menu (NombreMenu, DescripcionMenu, Ruta, Icono, Orden, Activo, Status, FechaCreacion, IdMenuPadre) VALUES 
('Novedades de Afiliados', 'Gestión de Novedades de Afiliados', @URL, 'faMinus', 1, 1, 'Active', GETDATE(), @IdPadre);

SELECT @IdMenu = IdMenu FROM MENU WHERE Ruta LIKE @URL;

INSERT INTO MenuRol (Status, FechaCreacion, IdMenu, IdRol, IdResponsable, PermisoCustom1, PermisoCustom2, PermisoCustom3, PuedeCrear, PuedeEditar, PuedeEliminar, PuedeImprimir)
SELECT 
	'Active',
	GETDATE(),
	M.IdMenu AS IdMenu,
	R.IdRol AS IdRol,
	1 AS IdResponsable,
	1 AS PermisoCustom1, 
	1 AS PermisoCustom2, 
	1 AS PermisoCustom3, 
	1 AS PuedeCrear, 
	1 AS PuedeEditar, 
	1 AS PuedeEliminar, 
	1 AS PuedeImprimir
FROM 
	Menu M
CROSS JOIN
	ROL R
WHERE M.IdMenu = @IdMenu;
GO