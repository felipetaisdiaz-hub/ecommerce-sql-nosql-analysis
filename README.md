# SQL vs NoSQL: Análisis Comparativo de Ventas en DataMart Global

Este repositorio contiene la resolución del caso práctico de análisis de datos comparativo entre **MySQL (Relacional)** y **MongoDB (Documental)** sobre una plataforma de e-commerce.

---

## 📁 Estructura del Proyecto

```text
ecommerce-sql-nosql-analysis/
├── data/
│   ├── init_ecommerce.sql        # Script DDL y DML para MySQL
│   └── mongodb_data.json         # Dataset estructurado en JSON para MongoDB
├── sql/
│   ├── 01_top_10_clientes.sql    # Análisis 1: Top 10 clientes por gasto total (JOINs)
│   └── 02_top_3_productos_por_categoria.sql # Análisis 2: Top 3 productos por categoría (ROW_NUMBER)
├── mongodb/
│   ├── 01_top_10_clientes.js     # Análisis 1: Pipeline de agregación ($lookup, $project)
│   └── 02_top_3_productos_por_categoria.js # Análisis 2: Pipeline de agregación ($unwind, $group, $slice)
├── scripts/
│   └── import_mongodb.py         # Script para importar mongodb_data.json a MongoDB
├── docs/
│   └── Caso_Practico_Consigna.pdf
├── docker-compose.yml            # Orquestación de MySQL y MongoDB en contenedores
├── .gitignore
└── README.md
```

---

## 🚀 Puesta en Marcha con Docker (en VS Code)

### 1. Iniciar los contenedores
Asegúrate de tener Docker Desktop abierto y ejecuta en la terminal integrada de VS Code:
```bash
docker compose up -d
```
> **Nota:** El contenedor de MySQL (`ecommerce_mysql`) cargará automáticamente el script `init_ecommerce.sql` al iniciar por primera vez, creando la base de datos `ecommerce_db` con todas sus tablas y datos.

### 2. Importar los datos a MongoDB
Para poblar la base de datos `ecommerce_analytics` en MongoDB con el dataset `mongodb_data.json`:
```bash
python scripts/import_mongodb.py
```
*(Requiere `pip install pymongo`)*

---

## 🔌 Conexión en VS Code con SQLTools

Para ejecutar las consultas SQL directamente desde VS Code:
1. Abre el panel de **SQLTools** en la barra lateral de VS Code.
2. Añade una nueva conexión de tipo **MySQL**:
   - **Connection name:** `Ecommerce MySQL`
   - **Server Address:** `localhost`
   - **Port:** `3306`
   - **Database:** `ecommerce_db`
   - **Username:** `root`
   - **Password:** `root`
3. Conéctate y abre los archivos dentro de la carpeta `sql/` para ejecutarlos directamente.

---

## 📊 Resumen de los Análisis

### Análisis 1: TOP 10 clientes por gasto total
* **Objetivo:** Identificar los clientes con mayor volumen de compra en la plataforma.
* **SQL:** [sql/01_top_10_clientes.sql](sql/01_top_10_clientes.sql)
* **MongoDB:** [mongodb/01_top_10_clientes.js](mongodb/01_top_10_clientes.js)

### Análisis 2: TOP 3 productos más vendidos por categoría
* **Objetivo:** Determinar los productos líderes en ventas agrupados por categoría.
* **SQL:** [sql/02_top_3_productos_por_categoria.sql](sql/02_top_3_productos_por_categoria.sql)
* **MongoDB:** [mongodb/02_top_3_productos_por_categoria.js](mongodb/02_top_3_productos_por_categoria.js)
