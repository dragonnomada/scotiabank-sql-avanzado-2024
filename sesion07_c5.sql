-- Paso 1 - Abrir la llave simétrica (que es como la contraseña de encriptación/decriptación)

open symmetric key test_password_column
decryption by certificate test_cert;

-- Paso 2 - Utilizar la llave simétrica (ya podemos usar las funciones de encriptación/decriptación)

insert into cliente (nombre, no_cuenta, pin)
values ('Don Ramón', encryptByKey(key_guid('test_password_column'), '123456789'), encryptByKey(key_guid('test_password_column'), '1234'));

-- Paso 3 - Cerrar la llave simétrica

close symmetric key test_password_column;
