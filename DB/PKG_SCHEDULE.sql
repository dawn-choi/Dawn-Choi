--------------------------------------------------------
--  파일이 생성됨 - 목요일-8월-20-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_SCHEDULE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "S"."PKG_SCHEDULE" AS 

  -- 수업 시간표
 PROCEDURE PROC_SCHEDULE_LIST(
        IN_MID  IN      VARCHAR2,
        O_CUR   OUT     SYS_REFCURSOR
 );

  --   상세보기
  PROCEDURE PROC_SCHEDULE_SEL(
        IN_MID      IN      VARCHAR2,
        IN_LID      IN      VARCHAR2,
        O_CUR   OUT     SYS_REFCURSOR
  );
  
  --    운동향상량
  PROCEDURE PROC_BIMP_SEL(
        IN_PID  IN     VARCHAR2,
        O_CUR   OUT     SYS_REFCURSOR        
  );
 
END PKG_SCHEDULE;

/
