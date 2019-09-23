CREATE TABLE TBCLIENTE 
(
  ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 NOT NULL 
, NOME VARCHAR2(150 BYTE) 
, UF VARCHAR2(2 BYTE) 
, CELULAR VARCHAR2(11 BYTE) 
, CONSTRAINT TBCLIENTE_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX TBCLIENTE_PK ON TBCLIENTE (ID ASC) 
      LOGGING 
      TABLESPACE SYSTEM 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        FREELISTS 1 
        FREELIST GROUPS 1 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL;


CREATE TABLE TBTIPOFINANCIAMENTO 
(
  ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1  NOT NULL 
, DESCRICAO VARCHAR2(150 BYTE) 
, CONSTRAINT TBTIPOFINANCIAMENTO_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX TBTIPOFINANCIAMENTO_PK ON TBTIPOFINANCIAMENTO (ID ASC) 
      LOGGING 
      TABLESPACE SYSTEM 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        FREELISTS 1 
        FREELIST GROUPS 1 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL;


CREATE TABLE TBFINANCIAMENTO 
(
  ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 NOT NULL 
, IDCLIENTE NUMBER NOT NULL 
, IDTIPOFINANCIAMENTO NUMBER NOT NULL 
, VALORTOTAL NUMBER(15, 2) 
, DATAVENCIMENTO DATE 
, CONSTRAINT TBFINANCIAMENTO_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX TBFINANCIAMENTO_PK ON TBFINANCIAMENTO (ID ASC) 
      LOGGING 
      TABLESPACE SYSTEM 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        FREELISTS 1 
        FREELIST GROUPS 1 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL;

ALTER TABLE TBFINANCIAMENTO
ADD CONSTRAINT FK_IDCLIENTE FOREIGN KEY
(
  IDCLIENTE 
)
REFERENCES TBCLIENTE
(
  ID 
)
ENABLE;

ALTER TABLE TBFINANCIAMENTO
ADD CONSTRAINT FK_TIPOFINANCIAMENTO FOREIGN KEY
(
  IDTIPOFINANCIAMENTO 
)
REFERENCES TBTIPOFINANCIAMENTO
(
  ID 
)
ENABLE;

CREATE TABLE TBPARCELAS 
(
  ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 NOT NULL 
, IDFINANCIAMENTO NUMBER NOT NULL 
, NUMEROPARCELA NUMBER 
, VALORPARCELA NUMBER(10, 2) 
, DATAVENCIMENTO DATE 
, DATAPAGAMENTO DATE 
, CONSTRAINT TBPARCELAS_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX TBPARCELAS_PK ON TBPARCELAS (ID ASC) 
      LOGGING 
      TABLESPACE SYSTEM 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        FREELISTS 1 
        FREELIST GROUPS 1 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL;

ALTER TABLE TBPARCELAS
ADD CONSTRAINT FK_IDPARCELAS FOREIGN KEY
(
  IDFINANCIAMENTO 
)
REFERENCES TBFINANCIAMENTO
(
  ID 
)
ENABLE;




INSERT INTO TBCLIENTE (nome, uf, celular) VALUES('GUILHERME', 'SP', '11970565325');
INSERT INTO TBCLIENTE (nome, uf, celular) VALUES('MARIA', 'SP', '11970465325');
INSERT INTO TBCLIENTE (nome, uf, celular) VALUES('JOAO', 'SP', '11970555325');
INSERT INTO TBCLIENTE (nome, uf, celular) VALUES('DIEGO', 'SP', '11970566325');
INSERT INTO TBCLIENTE (nome, uf, celular) VALUES('LUCAS', 'SP', '11970567825');
INSERT INTO TBCLIENTE (nome, uf, celular) VALUES('FELIPE', 'SP', '11970578325');
INSERT INTO TBCLIENTE (nome, uf, celular) VALUES('FABIO', 'MG', '14970578325');

INSERT INTO tbtipofinanciamento (descricao) VALUES('IMOBILIARIO');
INSERT INTO tbtipofinanciamento (descricao) VALUES('AUTOMOTIVO');
INSERT INTO tbtipofinanciamento (descricao) VALUES('CONSTRUÇÃO');

select * from tbfinanciamento
INSERT INTO tbfinanciamento (idcliente, idtipofinanciamento, valorTotal, dataVencimento) VALUES(1, 1, 1500.00, TO_DATE('22/10/2019','DD/MM/YYYY'));
INSERT INTO tbfinanciamento (idcliente, idtipofinanciamento, valorTotal, dataVencimento) VALUES(1, 1, 1500.00, TO_DATE('22/11/2019','DD/MM/YYYY'));
INSERT INTO tbfinanciamento (idcliente, idtipofinanciamento, valorTotal, dataVencimento) VALUES(1, 1, 1500.00, TO_DATE('22/12/2019','DD/MM/YYYY'));
INSERT INTO tbfinanciamento (idcliente, idtipofinanciamento, valorTotal, dataVencimento) VALUES(1, 1, 1500.00, TO_DATE('22/01/2020','DD/MM/YYYY'));
INSERT INTO tbfinanciamento (idcliente, idtipofinanciamento, valorTotal, dataVencimento) VALUES(2, 1, 1800.00, TO_DATE('22/10/2019','DD/MM/YYYY'));
INSERT INTO tbfinanciamento (idcliente, idtipofinanciamento, valorTotal, dataVencimento) VALUES(2, 1, 1800.00, TO_DATE('22/11/2019','DD/MM/YYYY'));
INSERT INTO tbfinanciamento (idcliente, idtipofinanciamento, valorTotal, dataVencimento) VALUES(3, 1, 1500.00, TO_DATE('22/10/2019','DD/MM/YYYY'));
INSERT INTO tbfinanciamento (idcliente, idtipofinanciamento, valorTotal, dataVencimento) VALUES(3, 1, 1500.00, TO_DATE('22/11/2019','DD/MM/YYYY'));
INSERT INTO tbfinanciamento (idcliente, idtipofinanciamento, valorTotal, dataVencimento) VALUES(3, 1, 1500.00, TO_DATE('22/12/2019','DD/MM/YYYY'));
INSERT INTO tbfinanciamento (idcliente, idtipofinanciamento, valorTotal, dataVencimento) VALUES(4, 1, 1500.00, TO_DATE('22/07/2019','DD/MM/YYYY'));
INSERT INTO tbfinanciamento (idcliente, idtipofinanciamento, valorTotal, dataVencimento) VALUES(4, 1, 1500.00, TO_DATE('22/08/2019','DD/MM/YYYY'));
INSERT INTO tbfinanciamento (idcliente, idtipofinanciamento, valorTotal, dataVencimento) VALUES(5, 1, 1500.00, TO_DATE('22/05/2019','DD/MM/YYYY'));
INSERT INTO tbfinanciamento (idcliente, idtipofinanciamento, valorTotal, dataVencimento) VALUES(5, 1, 1500.00, TO_DATE('22/04/2019','DD/MM/YYYY'));
INSERT INTO tbfinanciamento (idcliente, idtipofinanciamento, valorTotal, dataVencimento) VALUES(6, 1, 1500.00, TO_DATE('22/12/2019','DD/MM/YYYY'));
INSERT INTO tbfinanciamento (idcliente, idtipofinanciamento, valorTotal, dataVencimento) VALUES(6, 1, 10000.50, TO_DATE('23/09/2019','DD/MM/YYYY'));

INSERT INTO tbparcelas (idfinanciamento, numeroparcela, valorparcela, datavencimento, datapagamento) VALUES( 1, 1, 300.00, TO_DATE('22/04/2019','DD/MM/YYYY'), TO_DATE('22/04/2019','DD/MM/YYYY'))
INSERT INTO tbparcelas (idfinanciamento, numeroparcela, valorparcela, datavencimento, datapagamento) VALUES( 1, 2, 300.00, TO_DATE('22/05/2019','DD/MM/YYYY'), TO_DATE('22/05/2019','DD/MM/YYYY'));
INSERT INTO tbparcelas (idfinanciamento, numeroparcela, valorparcela, datavencimento, datapagamento) VALUES( 1, 3, 300.00, TO_DATE('22/06/2019','DD/MM/YYYY'), TO_DATE('22/06/2019','DD/MM/YYYY'));
INSERT INTO tbparcelas (idfinanciamento, numeroparcela, valorparcela, datavencimento, datapagamento) VALUES( 1, 4, 300.00, TO_DATE('22/07/2019','DD/MM/YYYY'), TO_DATE('22/07/2019','DD/MM/YYYY'));
INSERT INTO tbparcelas (idfinanciamento, numeroparcela, valorparcela, datavencimento, datapagamento) VALUES( 1, 5, 300.00, TO_DATE('22/08/2019','DD/MM/YYYY'), TO_DATE('22/08/2019','DD/MM/YYYY'));

INSERT INTO tbparcelas (idfinanciamento, numeroparcela, valorparcela, datavencimento, datapagamento) VALUES( 5, 1, 300.00, TO_DATE('22/08/2019','DD/MM/YYYY'), TO_DATE(null));
INSERT INTO tbparcelas (idfinanciamento, numeroparcela, valorparcela, datavencimento, datapagamento) VALUES( 7, 1, 300.00, TO_DATE('25/08/2019','DD/MM/YYYY'), TO_DATE(null));
INSERT INTO tbparcelas (idfinanciamento, numeroparcela, valorparcela, datavencimento, datapagamento) VALUES( 10, 1, 300.00, TO_DATE('25/08/2019','DD/MM/YYYY'), TO_DATE(null));
INSERT INTO tbparcelas (idfinanciamento, numeroparcela, valorparcela, datavencimento, datapagamento) VALUES( 11, 1, 300.00, TO_DATE('25/08/2019','DD/MM/YYYY'), TO_DATE(null));
INSERT INTO tbparcelas (idfinanciamento, numeroparcela, valorparcela, datavencimento, datapagamento) VALUES( 15, 1, 300.00, TO_DATE('25/05/2019','DD/MM/YYYY'), TO_DATE('22/06/2019','DD/MM/YYYY'));
INSERT INTO tbparcelas (idfinanciamento, numeroparcela, valorparcela, datavencimento, datapagamento) VALUES( 15, 1, 300.00, TO_DATE('25/06/2019','DD/MM/YYYY'), TO_DATE('22/07/2019','DD/MM/YYYY'));



