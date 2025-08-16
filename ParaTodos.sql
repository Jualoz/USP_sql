DECLARE @Bases TABLE (Nombre NVARCHAR(100))

--use usptrinidad2024
--declare @id int;
--select @id = idmenu from menu where nombremenu like '%historico%' and orden = 16
--delete from menurol where idmenu = @id
--delete from menu where idmenu = @id


INSERT INTO @Bases (Nombre)
VALUES 
-- Descomenta o agrega según necesites
('USP_PRUEBAS'),
('USP_Quebradanegra'),
('USP_Sasaima'),
('USPAriguani2024'),
('USPBarbosa2024'),
('USPAlbania2024'),
('USPAcuacanadas2024'),
('USPBorbur2024'),
('USPGuaca2024'),
('USPMacaravita2025'),
('USPOiba2024Clon'),
('USPOiba2024Clon2'),
('USPCalifornia2025'),
('USPCharala2024Clon'),
('USPCharala2024'),
('USPCharala2024Clon2'),
('USPOiba2024'),
('USPChima2023'),
('USPChima2023Clon'),
('USPPalenque2024'),
('USPQuipama2024'),
('USPOtanche2025'),
--('USPTrinidad2024Clon2'),
('USPTrinidad2024Clon3'),
('USPTrinidad2024'),
--('USPTrinidad2024Clon'),
('USPVetas2024'),
('USPQuipama2024Clon'),
('USPTrinidad2024Viejo'),
('USPCharta2024'),
('USPVetas2024Clon'),
('USPVillagomez2025'),
('USPOiba2024Clon4')

DECLARE @BaseName NVARCHAR(100)
DECLARE @SQL NVARCHAR(MAX)

DECLARE db_cursor CURSOR FOR
SELECT Nombre FROM @Bases

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @BaseName  

WHILE @@FETCH_STATUS = 0  
BEGIN  
    SET @SQL = '
    USE [' + @BaseName + '];

	declare @id int;
select @id = idmenu from menu where nombremenu like ''%historico%'' and orden = 16
delete from menurol where idmenu = @id
delete from menu where idmenu = @id

    PRINT ''Insertado en base: ' + @BaseName + '''
    '

    PRINT 'Ejecutando en: ' + @BaseName
    EXEC sp_executesql @SQL

    FETCH NEXT FROM db_cursor INTO @BaseName  
END  

CLOSE db_cursor  
DEALLOCATE db_cursor  