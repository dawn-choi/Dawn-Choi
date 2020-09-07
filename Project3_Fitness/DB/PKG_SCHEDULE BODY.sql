--------------------------------------------------------
--  파일이 생성됨 - 목요일-8월-20-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body PKG_SCHEDULE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "S"."PKG_SCHEDULE" AS

  -- 수업 시간표
  PROCEDURE PROC_SCHEDULE_LIST(
        IN_MID  IN      VARCHAR2,
        O_CUR   OUT     SYS_REFCURSOR
 ) AS
        
  BEGIN
    OPEN O_CUR FOR
    SELECT IN_MID AS MID, L.LID, LNAME, DTIME, DDAY, DHOURS, RNAME, TNAME, PID, PTOT || '명' AS PTOT, PCOST || '원' AS PCOST, E.CNAME || '개월' AS CNAME
    FROM LSALES L,
        (
            --그룹수업  -- 수업명    
        SELECT A.LID, C.GRNAME, B.LNAME, C.CNAME,
                    DECODE(A.DDAY, NULL, ' ', A.DDAY) AS DDAY,  --요일
                    DECODE(A.DTIME, NULL, ' ' , A.DTIME) AS DTIME, --  시간
                    DECODE(B.RNAME, NULL, ' ' , B.RNAME) AS RNAME,  DHOURS, C.PID, C.PTOT, B.TNAME, C.PCOST    
                                                        --  강의실명    -- 강사명  --가격
        --  수업 상세(A 51) +  B(수업, 강사, 강의실(24)) + C(상품(A) - B(공통, 그룹 공통(3)) (12))  
        
        FROM DLECTURES A, 
             (
                -- 수업, 강사, 강의실(24) 
                SELECT T1.LID, T1.LNAME, T1.PID, T1.RID, T3.RNAME, T1.TID, T2.TNAME
                FROM   LECTURES T1, TRAINERS T2, CLASSROOM T3
                WHERE  T1.TID = T2.TID
                AND    T1.RID = T3.RID(+)
                AND    T1.RID IS NOT NULL
                ORDER BY T1.LID
            ) B,
            (
                -- 상품(A) - B(공통, 그룹 공통(3)) (12)
                SELECT A.PID, A.PNAME, A.PCOST, A.PTOT, A.CID, B.CNAME, B.PARENT_NAME, B.GRNAME
                FROM PRODUCTS A, 
                 (     
                        -- 공통, 그룹 공통(3)
                        SELECT T1.CID, T1.CNAME , T1.CPARENT_ID, T2.CNAME AS PARENT_NAME, T2.CPARENT_ID, T3.GRID, T3.GRNAME
                        FROM   COMMONS T1, COMMONS T2, GRP T3
                        WHERE  T1.CPARENT_ID = T2.CID
                        AND    T1.GRID = T3.GRID
                        AND    T3.GRID = 'GR002'
                        AND    T1.CLVL = 2
                 ) B
                WHERE A.CID = B.CID
            ) C
            WHERE A.LID = B.LID
            AND A.PID = C.PID
            AND A.DDAY IS NOT NULL
        )E
    WHERE L.LID = E.LID 
    AND   L.MID = IN_MID
    ORDER BY 
       CASE
       WHEN DDAY='일' THEN '0'
       WHEN DDAY='월' THEN '1'
       WHEN DDAY='화' THEN '2'
       WHEN DDAY='수' THEN '3'
       WHEN DDAY='목' THEN '4'
       WHEN DDAY='금' THEN '5'
       WHEN DDAY='토' THEN '6'
       END, TO_NUMBER(SUBSTR(DTIME,1,2));
  END PROC_SCHEDULE_LIST;
    
  --   상세보기
  PROCEDURE PROC_SCHEDULE_SEL(
        IN_MID      IN      VARCHAR2,
        IN_LID      IN      VARCHAR2,
        O_CUR       OUT     SYS_REFCURSOR
 ) AS
        
  BEGIN
    OPEN O_CUR FOR
    SELECT IN_MID AS MID, LNAME, DDAY, 
       DTIME, RNAME, TNAME, PTOT || '명' AS PTOT, PCOST || '원' AS PCOST, E.CNAME || '개월' AS CNAME
    FROM LSALES L,
        (
            --그룹수업  -- 수업명    
        SELECT A.LID, C.GRNAME, B.LNAME, C.CNAME,
                    DECODE(A.DDAY, NULL, ' ', A.DDAY)    AS DDAY,  --요일
                    DECODE(A.DTIME, NULL, ' ' , A.DTIME) AS DTIME, --  시간
                    DECODE(B.RNAME, NULL, ' ' , B.RNAME) AS RNAME,  C.PTOT, B.TNAME, C.PCOST    
                                                        --  강의실명    -- 강사명  --가격
        --  수업 상세(A 51) +  B(수업, 강사, 강의실(24)) + C(상품(A) - B(공통, 그룹 공통(3)) (12))  
        
        FROM DLECTURES A, 
             (
                -- 수업, 강사, 강의실(24) 
                SELECT T1.LID, T1.LNAME, T1.PID, T1.RID, T3.RNAME, T1.TID, T2.TNAME
                FROM   LECTURES T1, TRAINERS T2, CLASSROOM T3
                WHERE  T1.TID = T2.TID
                AND    T1.RID = T3.RID(+)
                AND    T1.RID IS NOT NULL
                ORDER BY T1.LNAME
            ) B,
            (
                -- 상품(A) - B(공통, 그룹 공통(3)) (12)
                SELECT A.PID, A.PNAME, A.PCOST, A.PTOT, A.CID, B.CNAME, B.PARENT_NAME, B.GRNAME
                FROM PRODUCTS A, 
                 (     
                        -- 공통, 그룹 공통(3)
                        SELECT T1.CID, T1.CNAME , T1.CPARENT_ID, T2.CNAME AS PARENT_NAME, T2.CPARENT_ID, T3.GRID, T3.GRNAME
                        FROM   COMMONS T1, COMMONS T2, GRP T3
                        WHERE  T1.CPARENT_ID = T2.CID
                        AND    T1.GRID = T3.GRID
                        AND    T3.GRID = 'GR002'
                        AND    T1.CLVL = 2
                 ) B
                WHERE A.CID = B.CID
            ) C
            WHERE A.LID = B.LID
            AND A.PID = C.PID
            AND A.DDAY IS NOT NULL
        )E
    WHERE L.LID = E.LID 
    AND   L.MID = IN_MID
    AND   L.LID  = IN_LID
    ORDER BY  
      CASE
       WHEN DDAY='일' THEN '0'
       WHEN DDAY='월' THEN '1'
       WHEN DDAY='화' THEN '2'
       WHEN DDAY='수' THEN '3'
       WHEN DDAY='목' THEN '4'
       WHEN DDAY='금' THEN '5'
       WHEN DDAY='토' THEN '6'
       END
       ,TO_NUMBER(SUBSTR(DTIME,1,2));
    END PROC_SCHEDULE_SEL;
    
  PROCEDURE PROC_BIMP_SEL(
    IN_PID  IN     VARCHAR2,
     O_CUR   OUT     SYS_REFCURSOR        
  ) AS
  BEGIN
    OPEN O_CUR FOR
    SELECT   T2.BNAME, T1.IMP
    FROM     BIMP T1, BPART T2   
    WHERE    T1.BID(+) = T2.BID
    AND      T1.PID    = IN_PID
    ;

  END PROC_BIMP_SEL;


END PKG_SCHEDULE;

/
