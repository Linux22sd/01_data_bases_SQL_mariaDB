USE metro_cdmx;

DELIMITER //
CREATE PROCEDURE calculate_distances (
    IN station_1 POINT, 
    IN station_2 POINT,
    IN meters BOOLEAN
)
BEGIN

    SELECT 
    ST_Distance_Sphere(station_1, station_2) / if( meters, 1, 1000 ) AS Distance;

END //
DELIMITER ;


