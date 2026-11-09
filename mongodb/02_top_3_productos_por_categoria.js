/**
 * Análisis 2: TOP 3 productos más vendidos por categoría
 * Base de datos: ecommerce_analytics
 * Colección: order_details (con lookup a products)
 * 
 * Objetivo: Identificar los 3 productos más vendidos en cada categoría.
 * Salida esperada:
 *   - Categoría del producto
 *   - Nombre del producto
 *   - Cantidad total vendida (suma de unidades)
 *   - Ingresos totales generados
 *   - Top 3 por categoría
 */

use ecommerce_analytics;

db.order_details.aggregate([
  // 1. Agrupar por producto para calcular total vendido e ingresos
  {
    $group: {
      _id: "$id_producto",
      cantidad_total_vendida: { $sum: "$cantidad" },
      ingresos_totales_generados: {
        $sum: { $multiply: ["$cantidad", "$precio_unitario"] }
      }
    }
  },
  // 2. Unir con la colección products para obtener nombre y categoría
  {
    $lookup: {
      from: "products",
      localField: "_id",
      foreignField: "id_producto",
      as: "producto_info"
    }
  },
  // 3. Descomponer el array producto_info ($unwind)
  {
    $unwind: "$producto_info"
  },
  // 4. Ordenar por categoría ascendente y cantidad vendida descendente ($sort)
  {
    $sort: {
      "producto_info.categoria": 1,
      cantidad_total_vendida: -1
    }
  },
  // 5. Agrupar por categoría acumulando los productos ordenados en una lista ($group)
  {
    $group: {
      _id: "$producto_info.categoria",
      productos: {
        $push: {
          nombre_producto: "$producto_info.nombre_producto",
          cantidad_total_vendida: "$cantidad_total_vendida",
          ingresos_totales_generados: { $round: ["$ingresos_totales_generados", 2] }
        }
      }
    }
  },
  // 6. Extraer únicamente los 3 primeros de cada categoría ($slice)
  {
    $project: {
      _id: 0,
      categoria: "$_id",
      top_3: { $slice: ["$productos", 3] }
    }
  },
  // 7. Aplanar el array de top_3 ($unwind) para obtener salida tabular idéntica a SQL
  {
    $unwind: "$top_3"
  },
  {
    $project: {
      categoria: "$categoria",
      nombre_producto: "$top_3.nombre_producto",
      cantidad_total_vendida: "$top_3.cantidad_total_vendida",
      ingresos_totales_generados: "$top_3.ingresos_totales_generados"
    }
  },
  {
    $sort: {
      categoria: 1,
      cantidad_total_vendida: -1
    }
  }
]);
