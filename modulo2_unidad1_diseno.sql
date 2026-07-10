-- EJERCICIO: Introducción a las Bases de Datos Relacionales y PostgreSQL
-- DISEÑO DE ESTRUCTURAS: TABLAS DE CLIENTES Y PRODUCTOS
CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY, -- Usamos INTEGER porque es una columna numérica ideal para PK.
    nombre VARCHAR(100), -- Para limitar el texto a un máximo de 100 caracteres, optimización de espacio.
    perfil_bio TEXT, -- Usamos TEXT porque permite almacenar cadenas de caracteres.
    fecha_registro DATE -- Tipo DATE para guardar año, mes y día.
);

CREATE TABLE productos (
    id_producto INTEGER PRIMARY KEY, -- PK para indexar cada artículo del inventario.
    descripcion VARCHAR(255), -- Para texto corto o título detallado de el producto.
    precio DECIMAL(10,2), -- Soporta hasta 10 dígitos en total con 2 decimales.
    esta_activo BOOLEAN -- Verdadero o Falso, para indicar si esta discponible o no.
);
