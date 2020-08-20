--------------------------------------------------------
--  파일이 생성됨 - 목요일-8월-20-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body PKG_STATISTICS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "S"."PKG_STATISTICS" AS

    --연령대 별 인기있는 상품
    PROCEDURE PROC_STATISTICS_AGELIST(
        O_CUR           OUT     SYS_REFCURSOR
    ) AS
    BEGIN
        OPEN       O_CUR       FOR
        SELECT A.AGE, A.STR, A.PNAME, NVL(B.AGECNT, 0) AS AGECNT
FROM (
    WITH AGETABLE AS
    (
        SELECT 0 AGE, '10대 미만' STR FROM DUAL
        UNION ALL
        SELECT 10 AGE, '10대' STR FROM DUAL
        UNION ALL
        SELECT 20 AGE, '20대' STR FROM DUAL
        UNION ALL
        SELECT 30 AGE, '30대' STR FROM DUAL
        UNION ALL
        SELECT 40 AGE, '40대' STR FROM DUAL
        UNION ALL
        SELECT 50 AGE, '50대' STR FROM DUAL
        UNION ALL
        SELECT 60 AGE, '60대 이상' STR FROM DUAL
    )SELECT * FROM AGETABLE T1, (
        SELECT  T3.PNAME
        FROM    LSALES T1, LECTURES T2, PRODUCTS T3
        WHERE   T1.LID = T2.LID
        AND     T2.PID = T3.PID
        GROUP BY T3.PNAME
        ORDER BY T3.PNAME
        ) T2
    ) A, (
        SELECT PNAME, CAGE, COUNT(CAGE) AS AGECNT
        FROM
        (
            SELECT LSID, LID, LNAME, PNAME, MID, CASE WHEN CAGE > 60 THEN 60 ELSE CAGE END CAGE
            FROM(
                SELECT  T1.LSID, T1.LID, T2.LNAME, T3.PNAME, T4.MID, T4.MBIRTH
                        , TO_NUMBER(TRUNC(NVL(MONTHS_BETWEEN(SYSDATE, TO_DATE(SUBSTR(T4.MBIRTH, 1, 4), 'YYYY')) / 12 + 1, 0), -1)) AS CAGE
                FROM    LSALES T1, LECTURES T2, PRODUCTS T3, MEMBERS T4
                WHERE   T1.LID = T2.LID
                AND     T2.PID = T3.PID
                AND     T1.MID = T4.MID
                ORDER BY LID
                )
            )
        GROUP BY PNAME, CAGE
        ORDER BY PNAME
        ) B
    WHERE   A.PNAME = B.PNAME(+)
    AND     A.AGE = B.CAGE(+)
    ORDER BY A.PNAME, AGE ASC;
        
        END PROC_STATISTICS_AGELIST;
  
  --  성별 인기있는 상품
        PROCEDURE PROC_STATISTICS_GENLIST(
        O_CUR           OUT     SYS_REFCURSOR
    ) AS
  BEGIN
        OPEN       O_CUR       FOR
       SELECT C.PNAME, C.MGENDER, NVL(D.GENCNT,0) AS GENCNT FROM
  (
    SELECT A.PNAME, B.MGENDER FROM 
    (
    SELECT      T1.PNAME
    FROM        PRODUCTS T1, LECTURES T2, LSALES T3
    WHERE       T1.PID = T2.PID
    AND         T2.LID = T3.LID
    GROUP BY    T1.PNAME
    )A,
    (
    SELECT      T4.MGENDER
    FROM        MEMBERS T4
    GROUP BY    T4.MGENDER
    )B
    ORDER BY A.PNAME, B.MGENDER DESC
  )C, 
  (
    SELECT     T5.PNAME, T6.MGENDER, COUNT(T6.MGENDER)  AS GENCNT
    FROM       LECTURES T3, LSALES T4, PRODUCTS T5, MEMBERS T6
    WHERE      T3.LID = T4.LID
    AND        T3.PID = T5.PID
    AND        T4.MID = T6.MID
    GROUP BY   T5.PNAME, T6.MGENDER
    ORDER BY   T5.PNAME
  )D
  WHERE C.PNAME = D.PNAME(+)
  AND   C.MGENDER = D.MGENDER(+)
  ORDER BY PNAME
;       
  END PROC_STATISTICS_GENLIST;


   --  강사 선호도  
  PROCEDURE PROC_STATISTICS_TRNLIST(
        O_CUR           OUT     SYS_REFCURSOR
    ) AS
  BEGIN
        OPEN       O_CUR       FOR
        SELECT      T3.TNAME, COUNT(T1.LNAME)   AS TRNCNT
        FROM        LECTURES T1, LSALES T2, TRAINERS T3
        WHERE       T1.LID = T2.LID
        AND         T1.TID = T3.TID
        GROUP BY    T3.TNAME;
       
  END PROC_STATISTICS_TRNLIST;

END PKG_STATISTICS;

/
