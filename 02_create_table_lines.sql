--Creando tablas lines

USE metro_cdmx;

CREATE TABLE `lines`(
    `id` BIGINT(20) UNSIGNED PRIMARY KEY AUTO_INCREMENT,

    `name` VARCHAR(10) NOT NULL,
    `color` VARCHAR(15) NOT NULL,
    
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci;
  