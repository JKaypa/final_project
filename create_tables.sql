CREATE TABLE clientes (
	DNI VARCHAR(11) NOT NULL PRIMARY KEY,
	NOMBRE VARCHAR(100) NULL,
    DIRECCION VARCHAR(150) NULL,
    BARRIO VARCHAR(50) NULL,
    CIUDAD VARCHAR(50) NULL,
    ESTADO VARCHAR(10) NULL,
    CP VARCHAR(10) NULL,
    FECHA_NACIMIENTO DATE NULL,
    EDAD SMALLINT NULL,
    SEXO VARCHAR(1) NULL,
    LIMITE_CREDITO FLOAT NULL,
    VOLUMEN_COMPRA FLOAT,
    PRIMERA_COMPRA BIT(1)
);

CREATE TABLE productos (
	CODIGO VARCHAR(10) NOT NULL,
    DESCRIPCION VARCHAR(100),
    SABOR VARCHAR(50),
    TAMANO VARCHAR(50),
    ENVASE VARCHAR(50),
    PRECIO FLOAT,
    
    PRIMARY KEY(CODIGO)
);

CREATE TABLE facturas (
	NUMERO VARCHAR(5) NOT NULL PRIMARY KEY,
    FECHA DATE,
    DNI VARCHAR(11) NOT NULL,
    MATRICULA VARCHAR(5) NOT NULL,
    IMPUESTO FLOAT,
    
    FOREIGN KEY(DNI) REFERENCES clientes(DNI),
    FOREIGN KEY(MATRICULA) REFERENCES vendedores(MATRICULA)
);

CREATE TABLE items (
	NUMERO VARCHAR(5) NOT NULL,
    CODIGO VARCHAR(10) NOT NULL,
    CANTIDAD INT,
    PRECIO FLOAT,
    
    PRIMARY KEY(NUMERO, CODIGO),
    FOREIGN KEY(NUMERO) REFERENCES facturas(NUMERO),
    FOREIGN KEY(CODIGO) REFERENCES  productos(CODIGO)
);