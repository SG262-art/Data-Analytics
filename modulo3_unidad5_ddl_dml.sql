-- ══════════════════════════════════════════
-- BodegaTech — Script de Inventario
-- Autor: Analista de Datos BodegaTech
-- Fecha: Julio 2026
-- ══════════════════════════════════════════



-- ── SECCIÓN DDL ──────────────────────────

-- DROP TABLE

DROP TABLE IF EXISTS inventario; -- Elimina la tabla si ya existe para evitar errores de duplicidad al volver a ejecutar el script.

-- CREATE TABLE

CREATE TABLE inventario (
    
    id_producto INT PRIMARY KEY, -- Definido como INT y PK para garantizar el ID de cada artículo y no nulo.
    
    nombre_producto VARCHAR(100),
    categoria VARCHAR(50),
    
    precio_unitario DECIMAL(10,2), -- Se elige DECIMAL(10,2) para evitar errores de redondeo.
    
    stock_actual INT,
    stock_minimo INT,
    fecha_income DATE, -- Almacena exclusivamente año, mes y día para el ingreso del stock.
    
    activo SMALLINT -- Se usa SMALLINT para representar 1 = disponible o 0 = descontinuado.
);



-- ── SECCIÓN DML ────────────────────────

-- INSERT INTO 
INSERT INTO inventario (id_producto, nombre_producto, categoria, precio_unitario, stock_actual, stock_minimo, fecha_income, activo) 
VALUES
(1, 'Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
(2, 'Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
(3, 'Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
(4, 'Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
(5, 'Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
(6, 'Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
(7, 'Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
(8, 'Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
(9, 'SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
(10, 'Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);


-- UPDATE con WHERE
-- Restamos las unidades vendidas directamente al stock_actual usando filtros por ID.

-- Venta de Laptop Pro 15: 15 - 3 = 12 unidades finales.
UPDATE inventario 
SET stock_actual = stock_actual - 3 
WHERE id_producto = 1;

-- Venta de Mouse Inalámbrico: 80 - 12 = 68 unidades finales.
UPDATE inventario 
SET stock_actual = stock_actual - 12 
WHERE id_producto = 2;

-- Venta de Auriculares BT Pro: 35 - 5 = 30 unidades finales.
UPDATE inventario 
SET stock_actual = stock_actual - 5 
WHERE id_producto = 6;


-- SELECT de validación
-- Ver la tabla completa para confirmar que los datos y actualizaciones se procesaron correctamente
SELECT * FROM inventario;

-- UPDATE adicional para Producto descontinuado
-- Cambiamos el estado de la Webcam HD 1080p a inactiva
UPDATE inventario 
SET activo = 0 
WHERE id_producto = 8;


-- SELECT de validación
-- Ver la tabla completa para confirmar que los datos y actualizaciones se procesaron correctamente
SELECT * FROM inventario;
