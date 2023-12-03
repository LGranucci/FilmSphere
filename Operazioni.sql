DROP PROCEDURE IF EXISTS rating_assoluto;

DELIMITER \\

CREATE PROCEDURE rating_assoluto (IN _idFilm INT, OUT _rating FLOAT)
	BEGIN
    DECLARE _mediaRecensioniUtente, _mediaRecensioniCritica FLOAT;
    DECLARE _premiFilm, _premiAttori, _premiRegista FLOAT;
    SET _mediaRecensioniUtente = (SELECT MediaRecensioni from Film Where Codice = _idFilm);
	SET _mediaRecensioniCritica = (Select SUM(Valore)/(count(*))
									From recensione R
                                    Where R.Film = _idFilm);
    SET _premiFilm = (Select sum(P.Valore)
					FROM Vincita V  inner join Premio P on V.Premio = P.Tipo
                    WHERE V.Film = _idFilm);
	SET _premiAttori = (Select sum(P.Valore)
						FROM Vincita V inner join premiazioneattore PA on V.Codice = PA.Vincita inner join premio P on V.Premio = P.Tipo
                        Where V.Film <> _idFilm and PA.Attore IN (Select P.Attore from Partecipazione P Where P.Film = _idFilm));
	SET _premiRegista = (Select sum(P.Valore)
						FROM Vincita V inner join premiazioneregista PR on V.Codice = PR.Vincita inner join premio P on V.Premio = P.Tipo
                        Where V.Film <> _idFilm and PR.Attore = (Select F.Regista From Film F where F.Codice = _idFilm));
	
	
    SET _rating = (_mediaRecensioniUtente + 1.2 * (_mediaRecensioniCritica)) / (1 + 1.2) + (_premiFilm + 0.5 * _premiAttori + 0.8 * _premiRegista)/10;
    
    IF (_rating > 10) THEN 
		SET _rating = 10;
	END IF;
    
    END \\
DELIMITER ;


-- ---------------------------------------
-- Generi di Film
-- ----------------------------------------
DROP PROCEDURE IF EXISTS Generi_Film;
DELIMITER \\

Create procedure Generi_Film (IN _idFilm INT)
BEGIN
SELECT A.Nome
	FROM Appartenenza A
    WHERE A.Film = _idFilm;
 END \\
DELIMITER ;

-- -----------------------------------------
-- Inserimento Nuovo Acquisto
-- -----------------------------------------
DROP PROCEDURE Inserimento_Nuovo_Acquisto
DELIMITER \\
create procedure Inserimento_Nuovo_Acquisto(IN _numCarta INT , _tipoAbbonamento INT)


END \\
DELIMITER ;
