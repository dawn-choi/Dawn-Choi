--------------------------------------------------------
--  파일이 생성됨 - 월요일-8월-24-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body PKG_TRAINERS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "S"."PKG_TRAINERS" AS
 
    -- 강사 info
     PROCEDURE PROC_TRAINER_INFO(
     IN_TID     IN      VARCHAR2,
      O_CUR     OUT     SYS_REFCURSOR
  ) AS
  BEGIN
    OPEN    O_CUR     FOR
    SELECT  T1.TID, T1.TNAME, DECODE(T1.TGENDER, 'M', '남자', '여자') AS TGENDER, 
            TO_NUMBER(TRUNC(NVL(MONTHS_BETWEEN(SYSDATE, TO_DATE(SUBSTR(T1.TBIRTH, 1, 4), 'YYYY')) / 12 + 1, 0), 0)) AS TAGE,
            T1.TCAREER, DECODE(T1.TLICENSE, NULL, '-', T1.TLICENSE) AS TLICENSE
    FROM        TRAINERS T1
    WHERE       T1.TID = IN_TID
    GROUP BY    T1.TID, T1.TNAME, T1.TGENDER, T1.TBIRTH, T1.TCAREER, T1.TLICENSE;
  END PROC_TRAINER_INFO;
  
 PROCEDURE PROC_TRAINER_LIST(
      O_CUR     OUT     SYS_REFCURSOR
  ) AS
  BEGIN
    OPEN    O_CUR     FOR
    SELECT  T1.TID, T1.TNAME, DECODE(T1.TGENDER, 'M', '남자', '여자') AS TGENDER, 
            TO_NUMBER(TRUNC(NVL(MONTHS_BETWEEN(SYSDATE, TO_DATE(SUBSTR(T1.TBIRTH, 1, 4), 'YYYY')) / 12 + 1, 0), 0)) AS TAGE,
            T1.TCAREER, DECODE(T1.TLICENSE, NULL, '-', T1.TLICENSE) AS TLICENSE
    FROM        TRAINERS T1
    GROUP BY    T1.TID, T1.TNAME, T1.TGENDER, T1.TBIRTH, T1.TCAREER, T1.TLICENSE;
 END PROC_TRAINER_LIST;



END PKG_TRAINERS;

/
