USE metro_cdmx;

DELIMITER //
CREATE PROCEDURE `get_line_stations` (
    IN line_name VARCHAR(15)
)
BEGIN

    DECLARE line_id BIGINT(20);
    
    SELECT id 
    INTO line_id
    FROM `lines`
    WHERE name = line_name
    COLLATE utf8mb4_unicode_ci;

    SET @sql = CONCAT("
        SELECT 
            `lines_stations`.`id` AS relation_id,
            `lines`.`name` AS line_name,
            `stations`.`name` AS station_name
        FROM `lines_stations`
        INNER JOIN `stations`
        ON `lines_stations`.`station_id` = `stations`.`id`
        INNER JOIN `lines`
        ON `lines_stations`.`lines_id` = `lines`.`id`
        WHERE `lines_stations`.`lines_id`=", line_id);
    
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
   

END //
DELIMITER ;
