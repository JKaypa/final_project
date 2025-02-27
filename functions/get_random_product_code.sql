CREATE DEFINER=`root`@`localhost` FUNCTION `GET_RANDOM_PRODUCT_CODE`() RETURNS varchar(10) CHARSET utf8mb4
BEGIN
DECLARE PRODUCTS_COUNT INT;
DECLARE PRODUCT_NUMBER INT;

SELECT COUNT(*) INTO PRODUCTS_COUNT FROM productos;
SET PRODUCT_NUMBER = (SELECT RANDOM_NUMBER(1, PRODUCTS_COUNT)) - 1;
RETURN (SELECT CODIGO FROM productos LIMIT PRODUCT_NUMBER, 1);
END