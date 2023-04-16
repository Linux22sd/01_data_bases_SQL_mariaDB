USE metro_cdmx;

DELIMITER //
CREATE PROCEDURE `distance`(
    IN station_1 VARCHAR(50),
    IN station_2 VARCHAR(50),
    IN measurement VARCHAR(3)
)
BEGIN
	DECLARE term VARCHAR(20);
    DECLARE result FLOAT;
	SET term = " meters";
    SET result = (
        SELECT
        ST_Distance_Sphere(
            (
                SELECT `locations`.`location` 
                FROM `locations`
                    INNER JOIN `stations` ON `locations`.`station_id` = `stations`.`id`
                WHERE `stations`.`name` COLLATE utf8mb4_unicode_ci = station_1
            ),
            (
                SELECT `locations`.`location` 
                FROM `locations`
                    INNER JOIN `stations` ON `locations`.`station_id` = `stations`.`id`
                WHERE `stations`.`name` COLLATE utf8mb4_unicode_ci = station_2
            )
        ) 
    );
    IF (measurement = "k") THEN  
        SET result = (result/1000);
        SET term = " Kilometers";
    END IF;
    SELECT CONCAT(result, term) AS Distance;
END //
DELIMITER ;


