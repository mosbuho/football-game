CREATE SEQUENCE G_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE C_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE P_SEQ START WITH 1 INCREMENT BY 1;

DROP SEQUENCE G_SEQ;
DROP SEQUENCE C_SEQ;
DROP SEQUENCE P_SEQ;

DROP TABLE OWNER;
DROP TABLE GAMER;
DROP TABLE PLAYER;
DROP TABLE CLUB;

CREATE TABLE CLUB (
    C_NO NUMBER DEFAULT C_SEQ.NEXTVAL CONSTRAINT C_PK PRIMARY KEY,
    C_NAME VARCHAR2(60) UNIQUE NOT NULL
);

CREATE TABLE GAMER (
    G_NO NUMBER DEFAULT G_SEQ.NEXTVAL CONSTRAINT G_PK PRIMARY KEY,
    C_NO NUMBER CONSTRAINT C_G_FK REFERENCES CLUB(C_NO) ON DELETE SET NULL,
    G_ID VARCHAR2(16) UNIQUE NOT NULL,
    G_PW VARCHAR2(16) NOT NULL,
    G_SESSIONID CHAR(36),
    G_ISADMIN NUMBER(1) DEFAULT 0 CHECK (G_ISADMIN IN (0, 1)),
    G_BALANCE NUMBER(8) DEFAULT 100000 CHECK (G_BALANCE >= 0),
    G_POINT NUMBER DEFAULT 0 CHECK (G_POINT >= 0)
);

CREATE TABLE PLAYER (
    P_NO NUMBER DEFAULT P_SEQ.NEXTVAL CONSTRAINT P_PK PRIMARY KEY,
    C_NO NUMBER CONSTRAINT C_P_FK REFERENCES CLUB(C_NO) ON DELETE SET NULL,
    P_NAME VARCHAR2(40) NOT NULL,
    P_UNIFORM_NO VARCHAR2(2),
    P_POSITION VARCHAR2(2),
    P_SHO NUMBER(2) CHECK (P_SHO > 0),
    P_PAS NUMBER(2) CHECK (P_PAS > 0),
    P_DEF NUMBER(2) CHECK (P_DEF > 0),
    P_PRICE NUMBER(8) CHECK (P_PRICE > 0)
);

CREATE TABLE OWNER (
    G_NO NUMBER CONSTRAINT O_G_FK REFERENCES GAMER(G_NO) ON DELETE CASCADE,
    P_NO NUMBER CONSTRAINT O_P_FK REFERENCES PLAYER(P_NO) ON DELETE CASCADE
);

INSERT INTO CLUB (C_NAME) VALUES ('Tottenham Spurs');
INSERT INTO CLUB (C_NAME) VALUES ('Manchester City');
INSERT INTO CLUB (C_NAME) VALUES ('Barcelona');

INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (1, 'Heung Min Son', 7,'fw', 98, 80, 49, 98000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (1, 'Richarlison', 9,'fw', 79, 72, 52, 46000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (1, 'Brennan Johnson', 22,'fw', 74, 67, 44, 36000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (1, 'James Maddison', 10,'mf', 81, 86, 63, 88000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (1, 'Rodrigo Bentancur', 30,'mf', 67, 81, 67, 39000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (1, 'Pierre-Emile Højbjerg', 5,'mf', 73, 78, 69, 52000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (1, 'Pedro Porro', 23,'df', 73, 77, 89, 44);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (1, 'Cristian Romero', 17,'df', 46, 59, 82, 85000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (1, 'Micky van de Ven', 37,'df', 43, 59, 87, 26000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (1, 'Destiny Udogie', 4,'df', 49, 69, 80, 39000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (1, 'Guglielmo Vicario', 13, 'gk', 13, 56, 83, 39000);

INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (2, 'Erling Haaland', 9, 'fw', 93, 66, 46,  195000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (2, 'Phil Foden', 47, 'fw', 79, 82, 42,  117000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (2, 'Jack Grealishn', 10, 'fw', 76, 84, 49,  156000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (2, 'Kevin De Bruyne', 17, 'mf', 88, 94, 67,  208000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (2, 'Rodri', 16, 'mf', 73, 80, 62,  114000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (2, 'Bernardo Silva', 20, 'mf', 8, 86, 65,  156000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (2, 'Kyle Walker', 2, 'df', 63, 77, 83,  91000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (2, 'Nathan Aké', 6, 'df', 53, 72, 87,  83000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (2, 'Joško Gvardiol', 24, 'df', 54, 69, 89,  104000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (2, 'Sergio Gómez', 21, 'df', 70, 75, 81,  39000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (2, 'Stefan Ortega', 18, 'gk', 33, 72, 82,  28000);

INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (3, 'Lewandowski', 9, 'fw', 91, 80, 44,  120000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (3, 'Lamin Yamal', 27, 'fw', 95, 80, 45,  125000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (3, 'Joao Felix', 14, 'fw', 79, 78, 40,  50000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (3, 'Frenkie DeJong', 21, 'mf', 69, 86, 77,  130000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (3, 'Ilkay Gundogan', 22, 'mf', 81, 84, 73,  85000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (3, 'Pedri', 8, 'mf', 69, 82, 70,  130000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (3, 'Balde', 3, 'df', 79, 78, 35,  115000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (3, 'Jules Kounde', 23, 'df', 45, 68, 86,  95000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (3, 'Ronald Araujo', 4, 'df', 51, 65, 86,  115000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (3, 'Joao Cancelo', 2, 'df', 73, 85, 80,  80000);
INSERT INTO PLAYER (C_NO, P_NAME, P_UNIFORM_NO, P_POSITION, P_SHO, P_PAS, P_DEF, P_PRICE) VALUES (3, 'Marc-Andre Ter Stergen', 1, 'gk', 26, 63, 85,  115000);

COMMIT;
ROLLBACK;

SELECT * FROM OWNER;
SELECT * FROM PLAYER;
SELECT * FROM CLUB;
SELECT * FROM GAMER;

UPDATE GAMER SET G_ISADMIN = 1 WHERE G_NO = 1;