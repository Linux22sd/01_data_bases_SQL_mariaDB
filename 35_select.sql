USE `metro_cdmx`;

-- Filtrado basico
SELECT * FROM `limes`;

-- Filtrando por columnas
SELECT `id`,`name`, `color`
FROM `lines`;

-- Operaciones Matematicas con SELECT
SELECT (2 + 2);
--
SELECT (2 + 2) AS `Resultado`;

-- Calculando un promedio
SELECT AVG(year) FROM `trains`;
--
SELECT AVG(year) AS `year_AVG` FROM `trains`;

-- Juntar tablas
SELECT  
`lines`.`name`,
`trains`.`serial_number`
FROM `lines`
INNER JOIN `trains` ON trains.line_id = lines.id 
ORDER BY lines.id ASC;

-- Agrupando
SELECT  `lines`.`name`, COUNT(*) AS `trenes`
FROM `lines`
	INNER JOIN `trains` ON `lines`.id = `trains`.`line_id`
GROUP BY `trains`.`line_id`;
