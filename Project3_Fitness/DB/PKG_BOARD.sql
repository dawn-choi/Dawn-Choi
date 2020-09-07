--------------------------------------------------------
--  파일이 생성됨 - 월요일-8월-24-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_BOARD
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "S"."PKG_BOARD" AS 

 PROCEDURE PROC_BOARD_LIST(
  O_CUR   OUT   SYS_REFCURSOR
 );
 
 PROCEDURE PROC_BOARD_SELECT(
  IN_SELONE  IN VARCHAR2,
  IN_SELTWO  IN VARCHAR2,
  O_CUR       OUT   SYS_REFCURSOR
 );
 
 PROCEDURE PROC_BOARD_MENU(
  IN_MENUNAME  IN VARCHAR2,
  O_CUR       OUT   SYS_REFCURSOR
 );

END PKG_BOARD;

/
