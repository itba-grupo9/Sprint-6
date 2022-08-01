CREATE VIEW clientes
AS
SELECT 	
	customer_id AS id,
	branch_id AS número_sucursal,
	customer_name AS nombre,
	customer_surname AS apellido,
	customer_DNI AS DNI,
	CASE
		WHEN strftime('%m', date('now')) > strftime('%m', date(dob)) THEN strftime('%Y', date('now')) - strftime('%Y', date(dob))
		WHEN strftime('%m', date('now')) = strftime('%m', date(dob)) THEN
			CASE
				WHEN strftime('%d', date('now')) >= strftime('%d', date(dob)) THEN strftime('%Y', date('now')) - strftime('%Y', date(dob))
				ELSE strftime('%Y', date('now')) - strftime('%Y', date(dob)) -1
			END
		WHEN strftime('%m', date('now')) < strftime('%m', date(dob)) THEN strftime('%Y', date('now')) - strftime('%Y', date(dob)) -1
	END AS 'edad'
FROM 
	cliente


SELECT * FROM clientes WHERE edad>40 ORDER BY DNI

SELECT * FROM clientes WHERE nombre='Anne' OR nombre='Tyler' ORDER BY edad


INSERT INTO cliente (customer_name, customer_surname, customer_DNI, branch_id, dob)
VALUES 
("Lois", "Stout", 47730534, 80, "1984-07-07"),
("Hall","Mcconnell",52055464,45,"1968-04-30"),
("Hilel","Mclean",43625213,77,"1993-03-28"),
("Jin","Cooley",21207908,96,"1959-08-24"),
("Gabriel","Harmon",57063950,27,"1976-04-01")