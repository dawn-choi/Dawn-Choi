--------------------------------------------------------
--  파일이 생성됨 - 목요일-8월-20-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_STATISTICS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "S"."PKG_STATISTICS" AS 
    
    --연령대 별 인기있는 상품
    PROCEDURE PROC_STATISTICS_AGELIST(
        O_CUR           OUT     SYS_REFCURSOR
    );
    
    --  성별 인기있는 상품
    PROCEDURE PROC_STATISTICS_GENLIST(
        -- O_CUR만??
        --IN_MGENDER      IN       VARCHAR2,
        O_CUR           OUT     SYS_REFCURSOR
    );
    
    --  강사 선호도
    PROCEDURE PROC_STATISTICS_TRNLIST(
        O_CUR           OUT     SYS_REFCURSOR
    );
END PKG_STATISTICS;

/
