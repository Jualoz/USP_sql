INSERT INTO ROL (Status, FechaCreacion, NombreRol, DescripcionRol, IdResponsable) VALUES 
(''Active'', GETDATE(), ''Administrador'', ''Rol con acceso total al sistema y control administrativo'', 1),
(''Active'', GETDATE(), ''Operador'', ''Rol con acceso a operaciones y gestión de servicios'', 1),
(''Active'', GETDATE(), ''Asistente'', ''Rol con acceso básico para asistencia y consultas'', 1)
GO

INSERT INTO UserRol (Status, FechaCreacion, IdUser, IdRol, IdResponsable)
SELECT 
  ''Active'',
  GETDATE(),
  u.IdUsuario AS IdUser,
  r.IdRol AS IdRol,
  1 AS IdResponsable
FROM 
  Usuario u
CROSS JOIN 
  Rol r;
GO

INSERT INTO MenuRol (Status, FechaCreacion, IdMenu, IdRol, IdResponsable, PermisoCustom1, PermisoCustom2, PermisoCustom3, PuedeCrear, PuedeEditar, PuedeEliminar, PuedeImprimir)
SELECT 
	''Active'',
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
	ROL R;
GO