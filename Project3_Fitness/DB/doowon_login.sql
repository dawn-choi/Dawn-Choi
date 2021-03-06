--------------------------------------------------------
--  파일이 생성됨 - 월요일-8월-24-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_USER
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE PKG_USER AS 
PROCEDURE PROC_USER_INSERT
  (
    IN_MID IN VARCHAR2,
    IN_MPWD IN VARCHAR2,
    IN_MNAME IN VARCHAR2,
    IN_MEMAIL IN VARCHAR2,
    IN_MBIRTH IN VARCHAR2,
    IN_MGENDER IN VARCHAR2,
    IN_MTEL IN VARCHAR2,
    IN_MADDR IN VARCHAR2
    
    
    
    
    
  );
  
PROCEDURE PROC_USER_TICKET
(
 IN_MID IN VARCHAR2,
 O_CUR  OUT SYS_REFCURSOR
);

PROCEDURE PROC_USER_UPDATE
(
 IN_MID IN VARCHAR2,
 IN_PID IN VARCHAR2
);


PROCEDURE PROC_USER_INFO
(
 IN_MID IN VARCHAR2,
 O_CUR  OUT SYS_REFCURSOR
);
  
  
  

END PKG_USER;

/




--------------------------------------------------------
--  파일이 생성됨 - 월요일-8월-24-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body PKG_USER
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY PKG_USER AS

  PROCEDURE PROC_USER_INSERT
  (
    IN_MID IN VARCHAR2,
    IN_MPWD IN VARCHAR2,
    IN_MNAME IN VARCHAR2,
    IN_MEMAIL IN VARCHAR2,
    IN_MBIRTH IN VARCHAR2,
    IN_MGENDER IN VARCHAR2,
    IN_MTEL IN VARCHAR2,
    IN_MADDR IN VARCHAR2
  ) AS
  BEGIN
    INSERT INTO MEMBERS(
    MID ,
    MPWD ,
    MNAME ,
    MEMAIL ,
    MBIRTH,
    MGENDER ,
    MTEL ,
    MADDR 
    )VALUES(
    IN_MID ,
    IN_MPWD ,
    IN_MNAME ,
    IN_MEMAIL ,
    IN_MBIRTH ,
    IN_MGENDER ,
    IN_MTEL ,
    IN_MADDR 
    )
    ;
  END PROC_USER_INSERT;

-----------------------------------------------------

PROCEDURE PROC_USER_TICKET
(
 IN_MID IN VARCHAR2,
 O_CUR  OUT SYS_REFCURSOR
)AS
V_ID VARCHAR2(200);

BEGIN

 OPEN O_CUR FOR
 SELECT T1.MID AS MID , T2.PNAME  AS PNAME , TO_CHAR(T1.OEXP,'YYYY-MM-DD') AS OEXP ,T1.PID AS PID, T3.CNAME AS CNAME
 ,T1.OCNT  AS LCOUNT
 
-- ,(IF T1.OEXP IS NULL THEN 
-- SELECT MAX(OEXP) FROM ORDERS
--WHERE MID= T1.MI AND PID = T1.PID INTO V_ID)
-- 
 
 
 FROM
 (
 SELECT * FROM ORDERS
WHERE (OEXP > (SELECT SYSDATE FROM DUAL) OR OEXP IS NULL)
AND MID= IN_MID
) T1,
PRODUCTS T2 , COMMONS T3
WHERE T1.PID =T2.PID AND T2.CID= T3.CID;


END PROC_USER_TICKET;   


------------------------------------------------------



PROCEDURE PROC_USER_UPDATE
(
 IN_MID IN VARCHAR2,
 IN_PID IN VARCHAR2
)
AS
V_COUNT NUMBER;
V_TYPE VARCHAR2(200);
BEGIN


SELECT  T2.GRID INTO V_TYPE
 FROM PRODUCTS T1, COMMONS T2
 WHERE T1.PID = IN_PID AND T1.CID= T2.CID;
 
 END PROC_USER_UPDATE;
 
 
 
PROCEDURE PROC_USER_INFO
(
 IN_MID IN VARCHAR2,
 O_CUR  OUT SYS_REFCURSOR
)
AS
BEGIN

OPEN O_CUR FOR
SELECT  MID, MPWD ,MNAME ,MEMAIL ,MBIRTH ,MGENDER ,MTEL,MADDR
FROM MEMBERS
WHERE MID=IN_MID;
 
END PROC_USER_INFO; 
 
END PKG_USER;

/

