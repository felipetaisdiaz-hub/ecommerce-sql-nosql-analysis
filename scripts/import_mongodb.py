"""
Script para importar los datos desde data/mongodb_data.json hacia MongoDB
Base de datos: ecommerce_analytics
Colecciones: customers, products, orders, order_details
"""

import json
from pathlib import Path
try:
    from pymongo import MongoClient
except ImportError:
    import sys
    print("pymongo no está instalado. Ejecuta: pip install pymongo")
    sys.exit(1)

MONGO_URI = "mongodb://localhost:27017"
DB_NAME = "ecommerce_analytics"
JSON_PATH = Path(__file__).resolve().parent.parent / "data" / "mongodb_data.json"

def main():
    print(f"Conectando a {MONGO_URI}...")
    client = MongoClient(MONGO_URI)
    db = client[DB_NAME]

    print(f"Leyendo archivo de datos desde: {JSON_PATH}")
    with open(JSON_PATH, "r", encoding="utf-8") as f:
        data = json.load(f)

    for collection_name, documents in data.items():
        if not documents:
            continue
        coll = db[collection_name]
        coll.drop()  # Reiniciar colección para datos limpios
        res = coll.insert_many(documents)
        print(f" -> Colección '{collection_name}': {len(res.inserted_ids)} documentos insertados.")

    print("\n¡Importación completada con éxito en MongoDB!")

if __name__ == "__main__":
    main()
