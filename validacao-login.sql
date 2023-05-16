CREATE OR REPLACE FUNCTION validarLogin
( p_email CHARACTER , p_senha CHARACTER )

RETURN CHARACTER
IS p_senhaEncontrada CHARACTER(1) := 'N';

BEGIN
    SELECT COUNT(*) INTO  p_senhaEncontrada 
    FROM USUARIOS WHERE EMAIL =  p_email AND SENHA = p_senha;

    RETURN p_senhaEncontrada;
END validarLogin;