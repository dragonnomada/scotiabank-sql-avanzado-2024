-- Paso 1 - Abrir la llave simétrica (que es como la contraseña de encriptación/decriptación)

open symmetric key test_password_column
decryption by certificate test_cert;

-- Paso 2 - Utilizar la llave simétrica (ya podemos usar las funciones de encriptación/decriptación)

select 
    id,
    nombre, 
    convert(varchar(255), decryptByKey(no_cuenta)) as no_cuenta, 
    convert(varchar(255), decryptByKey(pin)) as pin
from cliente;

-- Paso 3 - Cerrar la llave simétrica

close symmetric key test_password_column;

