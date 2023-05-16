CREATE OR REPLACE FUNCTION obter_consultas_por_paciente(p_pacienteId  NUMBER)
RETURN SYS_REFCURSOR IS
    l_cursor SYS_REFCURSOR;
    l_consultaId CONSULTAS.CONSULTAID%TYPE;
    l_medicoId CONSULTAS.MEDICOID%TYPE;
    l_pacienteId CONSULTAS.PACIENTEID%TYPE;
    l_dataConsulta CONSULTAS.DATACONSULTA%TYPE;
BEGIN
    SELECT CONSULTAID, MEDICOID, PACIENTEID, DATACONSULTA
    INTO l_consultaId, l_medicoId, l_pacienteId, l_dataConsulta
    FROM CONSULTAS
    WHERE PACIENTEID = p_pacienteId;

    OPEN l_cursor FOR
        SELECT l_consultaId, l_medicoId, l_pacienteId, l_dataConsulta
        FROM DUAL;

    RETURN l_cursor;
END;