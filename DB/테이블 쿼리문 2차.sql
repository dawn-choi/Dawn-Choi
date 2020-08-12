--  회원 테이블
CREATE TABLE MEMBERS(
    MID     VARCHAR2(20)        PRIMARY KEY,
    MPWD    VARCHAR2(20)        NOT NULL,
    MNAME   VARCHAR2(20)        NOT NULL,
    MEMAIL  VARCHAR2(300)       NOT NULL,
    MBIRTH  VARCHAR2(20)        NOT NULL,
    MGENDER CHAR(1)             NOT NULL,
    MTEL    VARCHAR2(30)        NOT NULL,
    MADDR   VARCHAR2(3000)
);

--  강의실 테이블
CREATE TABLE CLASSROOM(
    RID     CHAR(4)             PRIMARY KEY,    
    RNAME   VARCHAR2(20)        NOT NULL       
);

--  그룹 공통 테이블
CREATE TABLE COMMONS(
    GRID         CHAR(5)        PRIMARY KEY,
    GRNAME 	VARCHAR2(20)	NOT NULL,
);

--  공통 테이블
CREATE TABLE COMMONS(
    CID         CHAR(4)             PRIMARY KEY,
    GID 	CHAR(5)		    NOT NULL,
    CNAME       VARCHAR2(20)        NOT NULL,
    CLVL        NUMBER(1)           NOT NULL,     
    CPARENT_ID  CHAR(4)             NOT NULL  -- 맨처음 ROOT C000
);

--  상품 테이블
CREATE TABLE PRODUCTS(
    PID     CHAR(4)             PRIMARY KEY,    
    PNAME   VARCHAR2(200)       NOT NULL,       
    PCOST   NUMBER(10)          NOT NULL,
    PTOT    NUMBER(3)           NOT NULL,        --총인원
    CID     CHAR(4)             NOT NULL         --EX.6개월권    
);

--  강사 테이블
CREATE TABLE TRAINERS(
    TID     CHAR(4)             PRIMARY KEY,  
    TNAME   VARCHAR2(20)        NOT NULL
);

--  결제 테이블
CREATE TABLE ORDERS 
   (	"ORID" CHAR(6 BYTE), 
	"PID" CHAR(4 BYTE), 
	"MID" VARCHAR2(20 BYTE), 
	"SDATE" DATE, 
	"OEXP" DATE, 
	"COUNT" NUMBER
   );

--  수업 테이블
CREATE TABLE LECTURES(
    LID      CHAR(4)              PRIMARY KEY, 
    LNAME    VARCHAR2(20)         NOT NULL,
    PID      CHAR(4)              NOT NULL,
    RID      CHAR(4),
    TID      CHAR(4)              NOT NULL
);

-- 수업상세테이블 DLECTURES
CREATE TABLE LSALES(
    DID     CHAR(4)        PRIMARY KEY, 
    LID      CHAR(4)        NOT NULL,
    PID      CHAR(4)  	    NOT NULL,
    DSDATE   DATE           NOT NULL, 
    DDAY     VARCHAR2(20),     
    DTIME    VARCHAR2(20),
    DHOURS    NUMBER        NOT NULL	
);

--  수업 신청
CREATE TABLE LSALES(
    LSID     CHAR(6)        PRIMARY KEY, 
    DID      CHAR(4)        NOT NULL,
    MID      VARCHAR2(20)   NOT NULL,    
    LSDATE   DATE           DEFAULT     SYSDATE 
);

--  상품 향상성 테이블
CREATE TABLE BIMP(
    PID     CHAR(4)         NOT NULL, 
    BID      CHAR(4)        NOT NULL,
    IMP      NUMBER   NOT NULL,    
);

-- 부위테이블
CREATE TABLE BIMP(
    BID        CHAR(4)          PRIMARY KEY, 
    BNAME      VARCHAR2(20)        NOT NULL,
);


--  게시판(BOARD)
CREATE TABLE BOARD(
    IDX         NUMBER(5,0)                PRIMARY KEY,
    MENU_ID     CHAR(6 BYTE)               NOT NULL,
    TITLE       VARCHAR2(100 BYTE)         NOT NULL,
    CONT        VARCHAR2(4000 BYTE)        NOT NULL,
    MID         VARCHAR2(20 BYTE)          NOT NULL,
    REGDATE     VARCHAR2(50 BYTE)          NOT NULL,
    READCOUNT   NUMBER(5,0),
    BNUM        NUMBER(5,0),
    LVL         NUMBER(5,0),
    STEP        NUMBER(5,0),
    NREF        NUMBER(5,0),
    DELNUM      NUMBER(2,0)
);


CREATE TABLE FILES(
    FILE_NUM    NUMBER(5,0)                  PRIMARY KEY,
    IDX         NUMBER(5,0)                   NOT NULL,
    FILENAME    VARCHAR2(300 BYTE)            NOT NULL,
    FILEEXT     VARCHAR2(20 BYTE)             NOT NULL,
    SFILENAME   VARCHAR2(300 BYTE)            NOT NULL
);

CREATE TABLE IMG(
    IMG_NUM    NUMBER(5,0)                  PRIMARY KEY,
    IDX         NUMBER(5,0)                   NOT NULL,
    IMGNAME    VARCHAR2(300 BYTE)            NOT NULL,
    IMGEXT     VARCHAR2(20 BYTE)             NOT NULL,
    SIMGNAME   VARCHAR2(300 BYTE)            NOT NULL
);


CREATE TABLE MENUS(
    MENU_ID     CHAR(6 BYTE)                 PRIMARY KEY,  
    MENU_NAME   VARCHAR2(100 BYTE)           NOT NULL,
    MENU_SEQ    NUMBER(5,0)                  NOT NULL
);