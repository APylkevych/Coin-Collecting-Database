DROP TABLE Section_coin CASCADE CONSTRAINTS;
DROP TABLE Material CASCADE CONSTRAINTS;
DROP TABLE Developer CASCADE CONSTRAINTS;
DROP TABLE Value CASCADE CONSTRAINTS;
DROP TABLE Dat CASCADE CONSTRAINTS;
DROP TABLE MINT CASCADE CONSTRAINTS;
DROP TABLE Quality CASCADE CONSTRAINTS;
DROP TABLE Feature CASCADE CONSTRAINTS;
DROP TABLE NUMBER_CATALOG CASCADE CONSTRAINTS;
DROP TABLE COIN CASCADE CONSTRAINTS;
DROP TABLE COIN_audit CASCADE CONSTRAINTS;


DROP procedure Section_coin_fill;
DROP TRIGGER audit_COIN;

CREATE TABLE Section_coin(
Sec_C INT NOT NULL PRIMARY KEY,
Section_name VARCHAR(40) NOT NULL);


create or replace procedure Section_coin_fill 
is
TYPE TABSTR IS TABLE OF VARCHAR2(250);
	name TABSTR;
    qname NUMBER(5);
    sec NUMBER(38);
   
BEGIN
	name := TABSTR ('Usual', ' Memorable', 'Collectible', 'Unique', 'Replica', 'Antique', 'Souvenir');
	qname := name.count;

	FOR i IN 1..qname LOOP
		sec := i;
		INSERT INTO Section_coin VALUES (sec, name(i));
	END LOOP;
	DBMS_OUTPUT.put_line('All companies added.');
END;



exec Section_coin_fill;



CREATE TABLE Material(
Mat_C INT NOT NULL PRIMARY KEY,
Materail_name VARCHAR(40) NOT NULL);
Commit;


INSERT INTO Material(Mat_C, Materail_name) values (1, 'Gold');
INSERT INTO Material(Mat_C, Materail_name) values (2, 'Silver');
INSERT INTO Material(Mat_C, Materail_name) values (3, 'Cuprum');
INSERT INTO Material(Mat_C, Materail_name) values (4, 'Aluminum');
INSERT INTO Material(Mat_C, Materail_name) values (5, 'Bimetal');
INSERT INTO Material(Mat_C, Materail_name) values (6, 'CuprumNickel');
INSERT INTO Material(Mat_C, Materail_name) values (7, 'GoldSilver');
INSERT INTO Material(Mat_C, Materail_name) values (8, 'Special1');
INSERT INTO Material(Mat_C, Materail_name) values (9, 'Special2');


Commit;

CREATE TABLE Developer(
Devel_C  INT NOT NULL PRIMARY KEY,
Devel_name VARCHAR(40) NOT NULL);

INSERT INTO Developer  values (101, 'Fred');
INSERT INTO Developer  values (102, 'Denis');
INSERT INTO Developer  values (103, 'Jack');
INSERT INTO Developer  values (104, 'Tony');
INSERT INTO Developer  values (105, 'Frank');

Commit;


CREATE TABLE Value(
Value_C VARCHAR(40) NOT NULL PRIMARY KEY,
Value_name VARCHAR(40) NOT NULL);


INSERT INTO Value values ('000', 'NoValue');
INSERT INTO Value values ('001', 'One'); 
INSERT INTO Value values ('002', 'Two');
INSERT INTO Value values ('003', 'Three'); 
INSERT INTO Value values ('005', 'Five'); 
INSERT INTO Value values ('006', 'Six');
INSERT INTO Value values ('010', 'Ten'); 
INSERT INTO Value values ('012', 'Twelve'); 
INSERT INTO Value values ('015', 'Fifteen'); 
INSERT INTO Value values ('025', 'Twenty five'); 
INSERT INTO Value values ('104', 'oneFourth'); 
INSERT INTO Value values ('105', 'oneFifth');
INSERT INTO Value values ('106', 'oneSixth');
INSERT INTO Value values ('108', 'oneEighth'); 
INSERT INTO Value values ('110', 'oneTenth'); 
INSERT INTO Value values ('140', 'oneForty'); 
INSERT INTO Value values ('160', 'oneSixty');


CREATE TABLE Dat(
Dat_t  DATE NOT NULL PRIMARY KEY,
Day INT NOT NULL,
Month VARCHAR(12) NOT NULL,
Year INT NOT NULL);

INSERT INTO Dat values (to_date('25-10-1913','DD-MM-YYYY'), 25, 'October', 1913);
INSERT INTO Dat values (to_date('20-10-1950','DD-MM-YYYY'), 20, 'October', 1950); 
INSERT INTO Dat values (to_date('25-10-1914','DD-MM-YYYY'), 25, 'October', 1914);
INSERT INTO Dat values (to_date('26-10-1915','DD-MM-YYYY'),26, 'October', 1915);  
INSERT INTO Dat values (to_date('05-11-985','DD-MM-YYYY'), 5, 'November', 985);
INSERT INTO Dat values (to_date('05-01-1970','DD-MM-YYYY'), 05, 'Jan', 1970);
INSERT INTO Dat values (to_date('05-01-1960','DD-MM-YYYY'),05, 'Jan', 1960); 



commit;

CREATE TABLE MINT(
MINT_C INT NOT NULL PRIMARY KEY,
MINT_name VARCHAR(40) NOT NULL);


INSERT INTO MINT values (0, 'Unknown');
INSERT INTO MINT values (1, 'UnitedStatesMint‎');
INSERT INTO MINT values (2, 'MoscowMint');
INSERT INTO MINT values (3, 'RoyalCanadianMint');
INSERT INTO MINT values (4, 'JapanMint');
INSERT INTO MINT values (5, 'SwissMint');
INSERT INTO MINT values (6, 'KoreaMint');
INSERT INTO MINT values (7, 'RoyalDutchMint');
INSERT INTO MINT values (8, 'RoyalNorwegianMint');
commit;


CREATE TABLE Quality(
Qual_C VARCHAR(20) NOT NULL PRIMARY KEY,
Qual_name VARCHAR(40) NOT NULL);


INSERT INTO Quality values ('PF', 'Proof'); 
INSERT INTO Quality values ('PL', 'ProofLike'); 
INSERT INTO Quality values ('UNC', 'Uncirculated'); 
INSERT INTO Quality values ('aUNC', 'AboutUncirculated'); 
INSERT INTO Quality values ('XF', 'ExtremelyFine'); 
INSERT INTO Quality values ('VF', 'VeryFine'); 
INSERT INTO Quality values ('F', 'Fine'); 
INSERT INTO Quality values ('VG', 'VeryGood'); 
INSERT INTO Quality values ('G', 'Good');

commit;


CREATE TABLE Feature(
Feature_C INT NOT NULL PRIMARY KEY,
Feature_name VARCHAR(40) NOT NULL);

INSERT INTO Feature values(999, 'pictureDefect'); 
INSERT INTO Feature values(998, 'thicknessDefect'); 
INSERT INTO Feature values(997, 'materialDefect'); 
INSERT INTO Feature values(996, 'weightDefect'); 
INSERT INTO Feature values(995, 'breathDefect');
INSERT INTO Feature values(0, 'NO');

commit;



CREATE TABLE NUMBER_CATALOG(
Kat_num  CHAR (10) NOT NULL PRIMARY KEY,
Sec_C INT NOT NULL,
Value_C VARCHAR(40) NOT NULL, 
Mat_C INT NOT NULL,
MINT_C INT NOT NULL,
Devel_C  INT NOT NULL,
Qual_C VARCHAR(20) NOT NULL,
Feature_C INT NOT NULL,
Dat_t DATE NOT NULL,
Circulation INT NOT NULL,
CONSTRAINT fk FOREIGN KEY (Devel_C) REFERENCES Developer(Devel_C),
CONSTRAINT fk1 FOREIGN KEY (Sec_C) REFERENCES Section_coin(Sec_C),
CONSTRAINT fk2 FOREIGN KEY (Mat_C) REFERENCES Material(Mat_C),
CONSTRAINT fk3 FOREIGN KEY (Value_C) REFERENCES Value(Value_C),
CONSTRAINT fk4 FOREIGN KEY (MINT_C) REFERENCES MINT(MINT_C),
CONSTRAINT fk5 FOREIGN KEY (Feature_C) REFERENCES Feature(Feature_C),
CONSTRAINT fk6 FOREIGN KEY (Dat_t) REFERENCES Dat(Dat_t),
CONSTRAINT fk7 FOREIGN KEY (Qual_C) REFERENCES Quality(Qual_C));




INSERT INTO NUMBER_CATALOG values ('K1', 1, '012', 3, 7, 103, 'PF', 999, to_date('25-10-1913','DD-MM-YYYY'), 10000);
INSERT INTO NUMBER_CATALOG values ('K2', 1, '015', 4, 6, 102, 'PF', 997, to_date('25-10-1914','DD-MM-YYYY'), 25000);
INSERT INTO NUMBER_CATALOG values ('K3', 1, '015', 4, 6, 102, 'PL', 997, to_date('25-10-1914','DD-MM-YYYY'), 25000);
INSERT INTO NUMBER_CATALOG values ('K4', 2, '001', 7, 6, 102, 'UNC', 995, to_date('26-10-1915','DD-MM-YYYY'), 1000);
INSERT INTO NUMBER_CATALOG values ('K6', 6, '001', 1, 0, 101, 'G', 0, to_date('05-11-985','DD-MM-YYYY'), 100);
INSERT INTO NUMBER_CATALOG values ('K7', 1, '025', 6, 4, 104, 'XF', 996, to_date('05-01-1970','DD-MM-YYYY'), 260000);
INSERT INTO NUMBER_CATALOG values ('K8', 3, '010', 4, 5, 104, 'XF', 997, to_date('05-01-1960','DD-MM-YYYY'), 160000);




commit;



CREATE TABLE COIN(
Coin_code INT NOT NULL PRIMARY KEY,
Kat_num  CHAR(10) NOT NULL,
Qual_C  VARCHAR(20) NOT NULL,
Diameter NUMBER(6,4) NOT NULL,
Weight NUMBER(6,4) NOT NULL,
Thickness NUMBER(6,4) NOT NULL,
Price NUMBER(10,4) NOT NULL,
CONSTRAINT afk FOREIGN KEY (Kat_num) REFERENCES NUMBER_CATALOG(Kat_num),
CONSTRAINT afk1 FOREIGN KEY (Qual_C) REFERENCES Quality(Qual_C) );

INSERT INTO COIN values (555, 'K1', 'PF', 3, 25, 1, 7777); 
INSERT INTO COIN values (556, 'K2', 'PF', 4, 26, 1, 5555);
INSERT INTO COIN values (557, 'K3', 'PL', 4, 25, 1, 999);


CREATE TABLE COIN_audit( 
Coin_code INT ,
Qual_C  VARCHAR(20),
Kat_num  CHAR(10) ,
Diameter_OLD NUMBER(8,2) ,
Diameter_NEW NUMBER(8,2) ,
Weight_OLD NUMBER(8,2) ,
Weight_NEW NUMBER(8,2) ,
Thickness_OLD NUMBER(8,2) ,
Thickness_NEW NUMBER(8,2) ,
Price_OLD NUMBER(8,2) ,
Price_NEW NUMBER(8,2) ,
change_date   DATE,
operation     VARCHAR(30));





CREATE OR REPLACE TRIGGER audit_COIN
    AFTER INSERT OR UPDATE OR DELETE ON COIN
    FOR EACH ROW
    BEGIN
       IF INSERTING THEN
        INSERT INTO COIN_audit(Coin_code,Qual_C,Kat_num,
                                  Diameter_NEW, Weight_NEW, Thickness_NEW, Price_NEW, Change_date, operation)
       VALUES(:NEW.Coin_code,:NEW.Qual_C,:NEW.Kat_num,
             :NEW.Diameter,:NEW.Weight,:NEW.Thickness,:NEW.Price, to_date('25-10-1913','DD-MM-YYYY'),'INSERT');

       ELSIF UPDATING THEN
          INSERT INTO COIN_audit(Coin_code,Qual_C,Kat_num,
                                  Diameter_OLD,Diameter_NEW,
                                  Weight_OLD,Weight_NEW,
                                  Thickness_OLD,Thickness_NEW, Price_OLD, Price_NEW, Change_date, operation)
       VALUES(:NEW.Coin_code,:NEW.Qual_C,:NEW.Kat_num,
                :OLD.Diameter,:NEW.Diameter,
                :OLD.Weight,:NEW.Weight,
                :OLD.Thickness,:NEW.Thickness,
                :OLD.Price,:NEW.Price,
                SYSDATE,'UPDATE');

       ELSIF DELETING THEN
          INSERT INTO COIN_audit(Coin_code,Qual_C,Kat_num,
                                  Diameter_OLD,Weight_OLD,Thickness_OLD, Price_OLD, Change_date, operation)
          VALUES(:OLD.Coin_code,:OLD.Qual_C,:OLD.Kat_num,
                 :OLD.Diameter,:OLD.Weight,:OLD.Thickness,:OLD.Price,
                 SYSDATE,'DELETE');
       END IF;
    END audit_COIN;



INSERT INTO COIN values (558, 'K4', 'UNC', 4, 19, 2, 123); 

delete from Material where Mat_C = 6;
Insert into Material (Mat_C,Materail_name) values (10,'Jeniss');




