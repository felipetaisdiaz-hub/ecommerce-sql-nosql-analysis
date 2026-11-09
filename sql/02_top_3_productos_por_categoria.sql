-- ==============================================================================
-- Análisis 2: TOP 3 productos más vendidos por categoría
-- Base de datos: ecommerce_db
-- Objetivo: Identificar los 3 productos más vendidos en cada categoría de productos.
-- Columnas requeridas:
--   - Categoría del producto
--   - Nombre del producto
--   - Cantidad total vendida (suma de unidades)
--   - Ingresos totales generados
--   - Solo mostrar el top 3 por cada categoría (usando ROW_NUMBER)
-- ==============================================================================

USE ecommerce_db;

WITH ventas_por_producto AS (
    SELECT 
        p.categoria,
        p.nombre_producto,SELECT 
    c.nombre AS nombre_cliente,
    c.pais,
    COUNT(o.id_pedido) AS total_pedidos,
    SUM(o.total) AS monto_total_gastado
FROM customers c
INNER JOIN orders o ON c.id_cliente = o.id_cliente
GROUP BY 
    c.id_cliente,
    c.nombre,
    c.pais
ORDER BY 
    monto_total_gastado DESC
LIMIT 10;

-- ==============================================================================
-- Análisis 1: TOP 10 clientes por gasto total
-- Base de datos: ecommerce_db
-- Objetivo: Identificar los 10 clientes que más han gastado en la plataforma.
-- Columnas requeridas:
--   - Nombre del cliente
--   - País
--   - Número total de pedidos realizados
--   - Monto total gastado
--   - Ordenado por monto total (descendente)
-- ==============================================================================

USE ecommerce_db;
        SUM(od.cantidad) AS cantidad_total_vendida,
        SUM(od.cantidad * od.precio_unitario) AS ingresos_totales_generados,
        ROW_NUMBER() OVER (
            PARTITION BY p.categoria 
            ORDER BY SUM(od.cantidad) DESC
        ) AS ranking_categoria
    FROM products p
    INNER JOIN order_details od ON p.id_producto = od.id_producto
    GROUP BY 
        p.categoria,
        p.id_producto,
        p.nombre_producto
)
SELECT 
    categoria,
    nombre_producto,
    cantidad_total_vendida,
    ingresos_totales_generados
FROM ventas_por_producto
WHERE ranking_categoria <= 3
ORDER BY 
    categoria ASC,
    ranking_categoria ASC;
