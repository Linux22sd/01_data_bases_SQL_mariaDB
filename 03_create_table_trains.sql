-- Crear Tabla trains

USE metro_cdmx;

CREATE TABLE `trains`(
	`serial_number` VARCHAR(10) PRIMARY KEY  NOT NULL, 

    `line_id` BIGINT(20) UNSIGNED NOT NULL, 
    `type` TINYINT(4) NOT NULL,
    `year` INT(4) NOT NULL,

    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT `trains_line_id_foreign`
    FOREIGN KEY (`line_id`) 
    REFERENCES `lines` (`id`)
)
DEFAULT CHARSET= utf8mb4
COLLATE = utf8mb4_unicode_ci;