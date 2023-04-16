-- Crear Tabla lines_stations

USE metro_cdmx;

CREATE TABLE `lines_stations`(
	`id` BIGINT(20) UNSIGNED PRIMARY KEY AUTO_INCREMENT,

    `lines_id` BIGINT(20) UNSIGNED NOT NULL,
    `station_id` BIGINT(20) UNSIGNED NOT NULL,

    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    
    CONSTRAINT `lines_stations_lines_id_foreign`
    FOREIGN KEY (`lines_id`)
    REFERENCES `lines` (`id`),
    
    CONSTRAINT `lines_stations_station_id_foreign`
    FOREIGN KEY (`station_id`)
    REFERENCES `stations` (`id`)
)
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci;