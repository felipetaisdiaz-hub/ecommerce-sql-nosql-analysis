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

SELECT 
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
