SELECT 
    A.nome,
    A.uf,
    a.celular
FROM TBCLIENTE  A 
    INNER JOIN tbfinanciamento B ON A.ID = b.idcliente
    INNER JOIN (
                SELECT 
                    COUNT(*) OVER (PARTITION BY numeroparcela) AS TOTAL,
                    ID,
                    idfinanciamento,
                    datapagamento
                FROM TBPARCELAS  
                ) C ON B.ID = c.idfinanciamento
WHERE A.UF = 'SP'
 AND  C.TOTAL / C.TOTAL * 100 > 60
 AND c.datapagamento IS NOT NULL

 
 SELECT 
    A.nome,
    A.uf,
    a.celular
FROM TBCLIENTE  A 
    INNER JOIN tbfinanciamento B ON A.ID = b.idcliente
    INNER JOIN TBPARCELAS C ON B.ID = c.idfinanciamento
WHERE c.datapagamento IS NULL 
  AND to_date(sysdate + 5, 'dd-mm-yy hh24:mi:ss') > c.datavencimento  

 SELECT 
    A.nome,
    A.uf,
    a.celular
FROM TBCLIENTE  A 
    INNER JOIN tbfinanciamento B ON A.ID = b.idcliente
    INNER JOIN TBPARCELAS C ON B.ID = c.idfinanciamento
WHERE c.datapagamento > c.dataVencimento
    AND b.valorTotal > 10000