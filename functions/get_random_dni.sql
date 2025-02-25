CREATE DEFINER=`root`@`localhost` FUNCTION `GET_RANDOM_DNI`() RETURNS varchar(11) CHARSET utf8mb4
BEGIN
DECLARE TOTAL_CLIENTS INT;
DECLARE CLIENT_NUMBER INT;

SELECT COUNT(*) FROM clientes INTO TOTAL_CLIENTS;
SELECT RANDOM_NUMBER(1, TOTAL_CLIENTS) INTO CLIENT_NUMBER;
SET CLIENT_NUMBER = CLIENT_NUMBER - 1;
RETURN (SELECT DNI FROM clientes LIMIT CLIENT_NUMBER, 1);

END