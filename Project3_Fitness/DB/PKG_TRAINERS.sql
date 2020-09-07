--------------------------------------------------------
--  파일이 생성됨 - 월요일-8월-24-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_TRAINERS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "S"."PKG_TRAINERS" AS 
    
  -- 강사 info
  PROCEDURE PROC_TRAINER_INFO(
     IN_TID     IN      VARCHAR2,
      O_CUR     OUT     SYS_REFCURSOR
  );

  -- 강사 리스트 
   PROCEDURE PROC_TRAINER_LIST(
      O_CUR     OUT     SYS_REFCURSOR
  );

END PKG_TRAINERS;

/
