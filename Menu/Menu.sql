CREATE TABLE [Menu] (
    [IdMenu] int NOT NULL IDENTITY,
    [Status] nvarchar(max) NOT NULL,
    [FechaCreacion] datetime NOT NULL,
    [UltimaActualizacion] datetime NULL,
    [FechaBorrado] datetime NULL,
    [NombreMenu] varchar(100) NOT NULL,
    [DescripcionMenu] varchar(500) NOT NULL,
    [Ruta] varchar(200) NOT NULL,
    [Icono] varchar(50) NULL,
    [Orden] int NOT NULL,
    [Activo] bit NOT NULL,
    [IdMenuPadre] int NULL,
    CONSTRAINT [PK_Menu] PRIMARY KEY ([IdMenu]),
    CONSTRAINT [FK_Menu_Menu_IdMenuPadre] FOREIGN KEY ([IdMenuPadre]) REFERENCES [Menu] ([IdMenu]) ON DELETE NO ACTION
);

GO

CREATE TABLE [Rol] (
    [IdRol] int NOT NULL IDENTITY,
    [Status] nvarchar(max) NOT NULL,
    [FechaCreacion] datetime NOT NULL,
    [UltimaActualizacion] datetime NULL,
    [FechaBorrado] datetime NULL,
    [NombreRol] varchar(100) NOT NULL,
    [DescripcionRol] varchar(500) NOT NULL,
    [IdResponsable] int NOT NULL,
    CONSTRAINT [PK_Rol] PRIMARY KEY ([IdRol]),
    CONSTRAINT [FK_Rol_Seguridad_IdResponsable] FOREIGN KEY ([IdResponsable]) REFERENCES [Seguridad] ([IdSeguridad]) ON DELETE NO ACTION
);

GO

CREATE TABLE [MenuRol] (
    [IdMenuRol] int NOT NULL IDENTITY,
    [Status] nvarchar(max) NOT NULL,
    [FechaCreacion] datetime NOT NULL,
    [UltimaActualizacion] datetime NULL,
    [FechaBorrado] datetime NULL,
    [IdMenu] int NOT NULL,
    [IdRol] int NOT NULL,
    [IdResponsable] int NOT NULL,
    CONSTRAINT [PK_MenuRol] PRIMARY KEY ([IdMenuRol]),
    CONSTRAINT [FK_MenuRol_Menu_IdMenu] FOREIGN KEY ([IdMenu]) REFERENCES [Menu] ([IdMenu]) ON DELETE NO ACTION,
    CONSTRAINT [FK_MenuRol_Seguridad_IdResponsable] FOREIGN KEY ([IdResponsable]) REFERENCES [Seguridad] ([IdSeguridad]) ON DELETE NO ACTION,
    CONSTRAINT [FK_MenuRol_Rol_IdRol] FOREIGN KEY ([IdRol]) REFERENCES [Rol] ([IdRol]) ON DELETE NO ACTION
);

GO

CREATE TABLE [UserRol] (
    [IdUserRol] int NOT NULL IDENTITY,
    [Status] nvarchar(max) NOT NULL,
    [FechaCreacion] datetime NOT NULL,
    [UltimaActualizacion] datetime NULL,
    [FechaBorrado] datetime NULL,
    [IdUser] int NOT NULL,
    [IdRol] int NOT NULL,
    [IdResponsable] int NOT NULL,
    CONSTRAINT [PK_UserRol] PRIMARY KEY ([IdUserRol]),
    CONSTRAINT [FK_UserRol_Seguridad_IdResponsable] FOREIGN KEY ([IdResponsable]) REFERENCES [Seguridad] ([IdSeguridad]) ON DELETE NO ACTION,
    CONSTRAINT [FK_UserRol_Rol_IdRol] FOREIGN KEY ([IdRol]) REFERENCES [Rol] ([IdRol]) ON DELETE NO ACTION,
    CONSTRAINT [FK_UserRol_Seguridad_IdUser] FOREIGN KEY ([IdUser]) REFERENCES [Seguridad] ([IdSeguridad]) ON DELETE NO ACTION
);
GO


CREATE INDEX [IX_Menu_IdMenuPadre] ON [Menu] ([IdMenuPadre]);
GO

CREATE INDEX [IX_MenuRol_IdResponsable] ON [MenuRol] ([IdResponsable]);
GO

CREATE INDEX [IX_MenuRol_IdRol] ON [MenuRol] ([IdRol]);
GO

CREATE UNIQUE INDEX [IX_MenuRol_IdMenu_IdRol] ON [MenuRol] ([IdMenu], [IdRol]);
GO

CREATE UNIQUE INDEX [IX_Rol_NombreRol] ON [Rol] ([NombreRol]);
GO

CREATE INDEX [IX_Rol_IdResponsable] ON [Rol] ([IdResponsable]);
GO

CREATE INDEX [IX_UserRol_IdResponsable] ON [UserRol] ([IdResponsable]);
GO

CREATE INDEX [IX_UserRol_IdRol] ON [UserRol] ([IdRol]);
GO

CREATE UNIQUE INDEX [IX_UserRol_IdUser_IdRol] ON [UserRol] ([IdUser], [IdRol]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250718130253_UserRol', N'3.1.3');
GO

ALTER TABLE [UserRol] DROP CONSTRAINT [FK_UserRol_Seguridad_IdUser];
GO

ALTER TABLE [UserRol] ADD CONSTRAINT [FK_UserRol_Usuario_IdUser] FOREIGN KEY ([IdUser]) REFERENCES [Usuario] ([IdUsuario]) ON DELETE NO ACTION;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], 
[ProductVersion])
VALUES (N'20250718200141_UserRolUp', N'3.1.3');
GO

ALTER TABLE [MenuRol] ADD [PermisoCustom1] bit NOT NULL DEFAULT CAST(0 AS bit);
GO

ALTER TABLE [MenuRol] ADD [PermisoCustom2] bit NOT NULL DEFAULT CAST(0 AS bit);
GO

ALTER TABLE [MenuRol] ADD [PermisoCustom3] bit NOT NULL DEFAULT CAST(0 AS bit);
GO

ALTER TABLE [MenuRol] ADD [PuedeCrear] bit NOT NULL DEFAULT CAST(0 AS bit);
GO

ALTER TABLE [MenuRol] ADD [PuedeEditar] bit NOT NULL DEFAULT CAST(0 AS bit);
GO

ALTER TABLE [MenuRol] ADD [PuedeEliminar] bit NOT NULL DEFAULT CAST(0 AS bit);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250718222219_MenuRolUpdate', N'3.1.3');
GO

ALTER TABLE [MenuRol] ADD [PuedeImprimir] bit NOT NULL DEFAULT CAST(0 AS bit);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250721202856_MenuRolUpdatev2', N'3.1.3');
GO

ALTER TABLE [Menu] ADD [ResponsableId] int NOT NULL DEFAULT 0;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250723141613_AddResponsableMenu', N'3.1.3');
GO
