-- Crear base de datos
CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;
 
-- Tabla de clientes
CREATE TABLE customers (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    pais VARCHAR(50),
    fecha_registro DATE
);

-- Tabla de productos
CREATE TABLE products (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(150),
    categoria VARCHAR(50),
    precio DECIMAL(10,2),
    stock INT
);

-- Tabla de pedidos
CREATE TABLE orders (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    fecha_pedido DATE,
    total DECIMAL(10,2),
    estado VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES customers(id_cliente)
);

-- Tabla de detalles de pedidos
CREATE TABLE order_details (
    id_detalle INT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES orders(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES products(id_producto)
);

-- Insertar clientes
INSERT INTO customers VALUES
(1, 'María García', 'maria.garcia@email.com', 'España', '2023-01-15'),
(2, 'John Smith', 'john.smith@email.com', 'USA', '2023-02-20'),
(3, 'Pierre Dubois', 'pierre.dubois@email.com', 'Francia', '2023-01-10'),
(4, 'Ana Silva', 'ana.silva@email.com', 'Brasil', '2023-03-05'),
(5, 'Klaus Mueller', 'klaus.mueller@email.com', 'Alemania', '2023-02-15'),
(6, 'Sofia Rossi', 'sofia.rossi@email.com', 'Italia', '2023-04-01'),
(7, 'Carlos Mendez', 'carlos.mendez@email.com', 'México', '2023-01-25'),
(8, 'Emma Johnson', 'emma.johnson@email.com', 'UK', '2023-03-10'),
(9, 'Yuki Tanaka', 'yuki.tanaka@email.com', 'Japón', '2023-02-28'),
(10, 'Lars Anderson', 'lars.anderson@email.com', 'Suecia', '2023-04-15'),
(11, 'Isabel Lopez', 'isabel.lopez@email.com', 'España', '2023-05-01'),
(12, 'Michael Brown', 'michael.brown@email.com', 'USA', '2023-03-20'),
(13, 'Laura Bianchi', 'laura.bianchi@email.com', 'Italia', '2023-04-25'),
(14, 'Hans Schmidt', 'hans.schmidt@email.com', 'Alemania', '2023-05-10'),
(15, 'Patricia Santos', 'patricia.santos@email.com', 'Brasil', '2023-06-01');

-- Insertar productos
INSERT INTO products VALUES
(101, 'Laptop Dell XPS 13', 'Tecnología', 1299.99, 25),
(102, 'iPhone 14 Pro', 'Tecnología', 1099.99, 40),
(103, 'Samsung Galaxy S23', 'Tecnología', 899.99, 35),
(104, 'iPad Air', 'Tecnología', 599.99, 30),
(105, 'Auriculares Sony WH-1000XM5', 'Tecnología', 349.99, 50),
(201, 'Sofá Moderno 3 Plazas', 'Hogar', 799.99, 15),
(202, 'Mesa de Comedor Roble', 'Hogar', 549.99, 20),
(203, 'Lámpara de Pie LED', 'Hogar', 129.99, 45),
(204, 'Alfombra Persa 200x300', 'Hogar', 399.99, 25),
(205, 'Estantería Modular', 'Hogar', 249.99, 30),
(301, 'Cafetera Nespresso', 'Electrodomésticos', 199.99, 60),
(302, 'Aspiradora Roomba i7', 'Electrodomésticos', 699.99, 20),
(303, 'Microondas Samsung', 'Electrodomésticos', 149.99, 35),
(304, 'Batidora KitchenAid', 'Electrodomésticos', 279.99, 40),
(305, 'Freidora de Aire Philips', 'Electrodomésticos', 179.99, 55);

-- Insertar pedidos
INSERT INTO orders VALUES
(1001, 1, '2024-01-10', 1949.98, 'Entregado'),
(1002, 2, '2024-01-12', 1099.99, 'Entregado'),
(1003, 3, '2024-01-15', 1749.97, 'Entregado'),
(1004, 1, '2024-01-20', 599.99, 'Entregado'),
(1005, 4, '2024-01-22', 949.98, 'Entregado'),
(1006, 5, '2024-01-25', 2399.96, 'Entregado'),
(1007, 2, '2024-02-01', 899.99, 'Entregado'),
(1008, 6, '2024-02-05', 1349.98, 'Entregado'),
(1009, 7, '2024-02-08', 779.98, 'Entregado'),
(1010, 3, '2024-02-10', 349.99, 'Entregado'),
(1011, 8, '2024-02-15', 1299.99, 'Entregado'),
(1012, 1, '2024-02-18', 699.99, 'Entregado'),
(1013, 9, '2024-02-20', 1649.97, 'Entregado'),
(1014, 4, '2024-02-25', 549.99, 'Entregado'),
(1015, 10, '2024-03-01', 2099.97, 'Entregado'),
(1016, 5, '2024-03-05', 899.99, 'Entregado'),
(1017, 11, '2024-03-08', 1549.98, 'Entregado'),
(1018, 2, '2024-03-12', 1299.99, 'Entregado'),
(1019, 6, '2024-03-15', 629.98, 'Entregado'),
(1020, 12, '2024-03-18', 1899.98, 'Entregado'),
(1021, 7, '2024-03-22', 949.98, 'Entregado'),
(1022, 8, '2024-03-25', 1749.97, 'Entregado'),
(1023, 3, '2024-04-01', 799.99, 'Entregado'),
(1024, 13, '2024-04-05', 1449.98, 'Entregado'),
(1025, 9, '2024-04-08', 1099.99, 'Entregado'),
(1026, 14, '2024-04-12', 2299.96, 'Entregado'),
(1027, 1, '2024-04-15', 349.99, 'Entregado'),
(1028, 10, '2024-04-18', 1599.98, 'Entregado'),
(1029, 15, '2024-04-22', 999.98, 'Entregado'),
(1030, 4, '2024-04-25', 1849.97, 'Entregado');

-- Insertar detalles de pedidos
INSERT INTO order_details VALUES
-- Pedido 1001 (María García)
(1, 1001, 101, 1, 1299.99),
(2, 1001, 203, 5, 129.99),
-- Pedido 1002 (John Smith)
(3, 1002, 102, 1, 1099.99),
-- Pedido 1003 (Pierre Dubois)
(4, 1003, 103, 1, 899.99),
(5, 1003, 105, 1, 349.99),
(6, 1003, 301, 2, 199.99),
-- Pedido 1004 (María García)
(7, 1004, 104, 1, 599.99),
-- Pedido 1005 (Ana Silva)
(8, 1005, 105, 1, 349.99),
(9, 1005, 301, 3, 199.99),
-- Pedido 1006 (Klaus Mueller)
(10, 1006, 101, 1, 1299.99),
(11, 1006, 102, 1, 1099.99),
-- Pedido 1007 (John Smith)
(12, 1007, 103, 1, 899.99),
-- Pedido 1008 (Sofia Rossi)
(13, 1008, 201, 1, 799.99),
(14, 1008, 202, 1, 549.99),
-- Pedido 1009 (Carlos Mendez)
(15, 1009, 204, 1, 399.99),
(16, 1009, 205, 1, 249.99),
(17, 1009, 303, 1, 129.99),
-- Pedido 1010 (Pierre Dubois)
(18, 1010, 105, 1, 349.99),
-- Pedido 1011 (Emma Johnson)
(19, 1011, 101, 1, 1299.99),
-- Pedido 1012 (María García)
(20, 1012, 302, 1, 699.99),
-- Pedido 1013 (Yuki Tanaka)
(21, 1013, 102, 1, 1099.99),
(22, 1013, 202, 1, 549.99),
-- Pedido 1014 (Ana Silva)
(23, 1014, 202, 1, 549.99),
-- Pedido 1015 (Lars Anderson)
(24, 1015, 101, 1, 1299.99),
(25, 1015, 201, 1, 799.99),
-- Pedido 1016 (Klaus Mueller)
(26, 1016, 103, 1, 899.99),
-- Pedido 1017 (Isabel Lopez)
(27, 1017, 102, 1, 1099.99),
(28, 1017, 301, 1, 199.99),
(29, 1017, 305, 1, 179.99),
(30, 1017, 203, 1, 129.99),
-- Pedido 1018 (John Smith)
(31, 1018, 101, 1, 1299.99),
-- Pedido 1019 (Sofia Rossi)
(32, 1019, 301, 2, 199.99),
(33, 1019, 304, 1, 279.99),
-- Pedido 1020 (Michael Brown)
(34, 1020, 102, 1, 1099.99),
(35, 1020, 201, 1, 799.99),
-- Pedido 1021 (Carlos Mendez)
(36, 1021, 103, 1, 899.99),
(37, 1021, 203, 1, 129.99),
-- Pedido 1022 (Emma Johnson)
(38, 1022, 101, 1, 1299.99),
(39, 1022, 301, 1, 199.99),
(40, 1022, 305, 1, 179.99),
(41, 1022, 203, 1, 129.99),
-- Pedido 1023 (Pierre Dubois)
(42, 1023, 201, 1, 799.99),
-- Pedido 1024 (Laura Bianchi)
(43, 1024, 102, 1, 1099.99),
(44, 1024, 105, 1, 349.99),
-- Pedido 1025 (Yuki Tanaka)
(45, 1025, 102, 1, 1099.99),
-- Pedido 1026 (Hans Schmidt)
(46, 1026, 101, 2, 1299.99),
-- Pedido 1027 (María García)
(47, 1027, 105, 1, 349.99),
-- Pedido 1028 (Lars Anderson)
(48, 1028, 201, 2, 799.99),
-- Pedido 1029 (Patricia Santos)
(49, 1029, 103, 1, 899.99),
(50, 1029, 203, 1, 129.99),
-- Pedido 1030 (Ana Silva)
(51, 1030, 102, 1, 1099.99),
(52, 1030, 201, 1, 799.99);