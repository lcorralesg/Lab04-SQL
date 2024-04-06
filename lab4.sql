CREATE PROCEDURE USP_ListadoProductos
AS
BEGIN
SELECT
    nombreProducto,
    cantidadPorUnidad,
    precioUnidad,
    categoriaProducto,
    unidadesEnExistencia
FROM productos
END

CREATE PROCEDURE USP_ListadoCategorias
AS
BEGIN
SELECT
    idcategoria,
    nombrecategoria,
    descripcion,
    Activo,
    CodCategoria
FROM categorias
END

CREATE PROCEDURE USP_ListadoProveedores
AS
BEGIN
SELECT
    [nombreCompa�ia],
    nombrecontacto,
    direccion,
    ciudad,
    pais
FROM proveedores pro
END

CREATE PROCEDURE USP_ProveedoresPorNombreyCiudad
@nombrecontacto nvarchar(50),
@ciudad nvarchar(50)
AS
BEGIN
SELECT
    [nombreCompa�ia],
    nombrecontacto,
    direccion,
    ciudad,
    pais
FROM proveedores pro
WHERE nombrecontacto = @nombrecontacto AND ciudad = @ciudad
END

EXEC USP_ProveedoresPorNombreyCiudad 'Ian Devling', 'Melbourne'

CREATE PROCEDURE USP_ListadoDetallesPedidosPorFecha
@fechaInicio datetime,
@fechaFin datetime
AS
BEGIN
SELECT
    idpedido,
    idcliente,
    idempleado,
    fechapedido,
    fechaentrega,
    fechaenvio
FROM Pedidos
WHERE fechapedido BETWEEN @fechaInicio AND @fechaFin
END

EXEC USP_ListadoDetallesPedidosPorFecha '1994-08-05', '1994-08-10'