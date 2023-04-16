USE `metro_cdmx`;

-- Calculamos en metros
SELECT 
ST_Distance_Sphere(
    POINT(-99.13542151, 19.40891333),
    POINT(-99.13987398, 19.37938304)
) AS Distance;

-- Calculamos en Kilometros
SELECT 
ST_Distance_Sphere(
    POINT(-99.13542151, 19.40891333),
    POINT(-99.13987398, 19.37938304)
) / 1000 AS Distance;

--Busqueda personalizada
SELECT
ST_Distance_Sphere(
    (
        SELECT `locations`.`location` 
        FROM `locations`
            INNER JOIN `stations` ON `locations`.`station_id` = `stations`.`id`
        WHERE `stations`.`name` = "Popotla"
    ),
    (
        SELECT `locations`.`location` 
        FROM `locations`
            INNER JOIN `stations` ON `locations`.`station_id` = `stations`.`id`
        WHERE `stations`.`name` = "Lomas Estrella"
    )
) / 1000 AS Distance;

--Concatenado y a dos digitos despues del punto
SELECT CONCAT(ROUND(ST_Distance_Sphere(
    (
        SELECT `locations`.`location` 
        FROM `locations`
            INNER JOIN `stations` ON `locations`.`station_id` = `stations`.`id`
        WHERE `stations`.`name` = "Popotla"
    ),
    (
        SELECT `locations`.`location` 
        FROM `locations`
            INNER JOIN `stations` ON `locations`.`station_id` = `stations`.`id`
        WHERE `stations`.`name` = "Lomas Estrella"
    )
) / 1000,2)," Km ")  AS Distance;