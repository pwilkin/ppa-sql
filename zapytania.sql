CREATE TABLE NIETESTOWA (ID INT PRIMARY KEY AUTO_INCREMENT, 
                         NAZWA VARCHAR(100),
                         COSTAM TINYINT);
INSERT INTO NIETESTOWA (NAZWA, COSTAM) VALUES ('pomidor', 2);
INSERT INTO NIETESTOWA (NAZWA, COSTAM) VALUES ('ogórek', -1);
INSERT INTO NIETESTOWA (NAZWA, COSTAM) VALUES ('rzodkiewka', 4);
INSERT INTO NIETESTOWA (NAZWA, COSTAM) VALUES ('kalarepa', 14);

CREATE TABLE TESTOWA (ID INT PRIMARY KEY AUTO_INCREMENT, 
                      TEKST VARCHAR(100), 
                      LICZBA INT, 
                      KWOTA DECIMAL(10, 2), 
                      DZIEN DATETIME,
                      NIETEST INT,
                      FOREIGN KEY (NIETEST) REFERENCES NIETESTOWA(ID)
                     );
                      
INSERT INTO TESTOWA (TEKST, LICZBA, KWOTA, DZIEN) 
VALUES ('jakiś tam tekst', 500, 40.2, '2019-01-02 15:00:00'); -- komentarz
INSERT INTO TESTOWA (TEKST, LICZBA, KWOTA, DZIEN, NIETEST) 
VALUES ('jakiś inny tekst', 114, 244.2, '2018-01-02 15:00:00', 2);
INSERT INTO TESTOWA (TEKST, LICZBA, KWOTA, DZIEN, NIETEST) 
VALUES ('zupełnie co innego', 0, NULL, '2018-05-02 15:00:00', 2);
UPDATE TESTOWA SET LICZBA = 225, KWOTA = 55.5 WHERE LICZBA > 250;

SELECT * FROM TESTOWA;
SELECT * FROM NIETESTOWA;

SELECT T.*, N.* FROM TESTOWA T 
LEFT JOIN NIETESTOWA N ON T.NIETEST = N.ID; 

SELECT T.*, N.* FROM TESTOWA T 
INNER JOIN NIETESTOWA N ON T.NIETEST = N.ID; 

SELECT T.*, N.* FROM TESTOWA T, NIETESTOWA N 
WHERE T.KWOTA / 100 > N.COSTAM;
