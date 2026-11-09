/**
 * Análisis 1: TOP 10 clientes por gasto total
 * Base de datos: ecommerce_analytics
 * Colección: customers (o orders)
 * 
 * Objetivo: Identificar los 10 clientes que más han gastado en la plataforma.
 * Salida esperada:
 *   - Nombre del cliente
 *   - País
 *   - Número total de pedidos realizados
 *   - Monto total gastado
 *   - Ordenado desc por monto_total_gastado (limit 10)
 */

use ecommerce_analytics;

db.customers.aggregate([
  // 1. Unir con la colección de pedidos (orders) mediante el id_cliente
  {
    $lookup: {
      from: "orders",
      localField: "id_cliente",
      foreignField: "id_cliente",
      as: "pedidos"
    }
  },
  // 2. Filtrar clientes que tengan al menos 1 pedido
  {
    $match: {
      "pedidos.0": { $exists: true }
    }
  },
  // 3. Proyectar campos calculados: conteo de pedidos y suma de montos
  {
    $project: {
      _id: 0,
      nombre_cliente: "$nombre",
      pais: "$pais",
      total_pedidos: { $size: "$pedidos" },
      monto_total_gastado: { $round: [{ $sum: "$pedidos.total" }, 2] }
    }
  },
  // 4. Ordenar de mayor a menor gasto
  {
    $sort: { monto_total_gastado: -1 }
  },
  // 5. Limitar a los 10 principales
  {
    $limit: 10
  }
]);
