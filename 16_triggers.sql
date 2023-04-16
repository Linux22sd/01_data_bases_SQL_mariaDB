USE `metro_cdmx`;

CREATE TRIGGER l_updated_at_field 
BEFORE UPDATE   
ON `lines`
FOR EACH ROW
SET NEW.updated_at = NOW();