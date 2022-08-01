-- Creacion y insercion de datos en la tabla tipo_cliente

create table tipo_cliente(
    customer_type_id INTEGER PRIMARY KEY,
    customer_type_description TEXT NOT NULL
);

INSERT INTO tipo_cliente (customer_type_description)
VALUES ("Classic"), ("Gold"), ("Black");


-- Creacion y insercion de datos en la tabla tipo_cuenta


CREATE TABLE tipo_cuenta(
    account_type_id INTEGER PRIMARY KEY AUTOINCREMENT,
    account_type_description TEXT NOT NULL
);

INSERT INTO tipo_cuenta (account_type_description)
VALUES ("Caja de ahorro en Pesos"),
("Caja de ahorro en dolares"),
("Cuenta corriente en Pesos"),
("Cuenta corriente en dolares"),
("Cuenta inversion");


-- Creacion y insercion de datos en la tabla marca_tarjeta

CREATE TABLE marca_tarjeta(
    brand_card_id INTEGER PRIMARY KEY AUTOINCREMENT,
    brand_card_name TEXT NOT NULL
);

INSERT INTO marca_tarjeta (brand_card_name)
VALUES
  ("Mastercard"),
  ("Visa"),
  ("American Express");
  


-- Creacion de la tabla tarjeta

CREATE TABLE tarjeta(
    card_id INTEGER PRIMARY KEY AUTOINCREMENT,
    card_number TEXT UNIQUE NOT NULL CHECK (length(card_number) <= 20),
    card_expire_date INTEGER NOT NULL,
    card_given_date INTEGER NOT NULL,
    card_cvv INTEGER NOT NULL,
    card_type TEXT NOT NULL,
    customer_id INTEGER NOT NULL,
	brand_card_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES cliente (customer_id),
    FOREIGN KEY (brand_card_id) REFERENCES marca_tarjeta (brand_card_id)
);


-- cambiar formato de la fecha en la columna employee_hire_date de la tabla empleado

UPDATE empleado set employee_hire_date = SUBSTR(employee_hire_date, 7, 4)
     || '-' || SUBSTR(employee_hire_date, 4, 2)
     || '-' || SUBSTR(employee_hire_date, 1, 2)