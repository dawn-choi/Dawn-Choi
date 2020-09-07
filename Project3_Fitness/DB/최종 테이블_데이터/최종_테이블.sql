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
CREATE TABLE GRP(
    GRID    CHAR(5)             PRIMARY KEY,
    GRNAME  VARCHAR(20)         NOT NULL
);

--  공통 테이블
CREATE TABLE COMMONS(
    CID         CHAR(4)             PRIMARY KEY,
    GRID        CHAR(5)             NOT NULL,
    CNAME       VARCHAR2(20)        NOT NULL,
    CLVL        NUMBER(1)           NOT NULL,     
    CPARENT_ID  CHAR(4)             NOT NULL  -- 맨처음 ROOT C000
);

--  상품 테이블
CREATE TABLE PRODUCTS(
    PID     CHAR(4)             PRIMARY KEY,    
    PNAME   VARCHAR2(200)       NOT NULL,       
    PCOST   NUMBER(10)          NOT NULL,
    PTOT    NUMBER(3),                           --총인원
    CID     CHAR(4)             NOT NULL         --EX.6개월권    
);

--  강사 테이블
CREATE TABLE TRAINERS
   (   
    TID         CHAR(4 BYTE) NOT NULL, 
   TNAME       VARCHAR2(20 BYTE) NOT NULL, 
   TGENDER     CHAR(1 BYTE), 
   TBIRTH      VARCHAR2(20 BYTE), 
   TCAREER     NUMBER, 
   TLICENSE    VARCHAR2(100 BYTE)
    );

--  결제 데이터(O001 -> OR001로 수정, OID CHAR(6)으로 변경)
-- 8/8 두원 - OCNT 컬럼 추가 
CREATE TABLE ORDERS(
    ORID       CHAR(6)          PRIMARY KEY, 
    PID        CHAR(4)          NOT NULL,
    MID        VARCHAR2(20)     NOT NULL,
    SDATE      DATE             NOT NULL,
    OEXP       DATE
    OCNT       NUMBER      
);


--  수업 테이블
CREATE TABLE LECTURES(
    LID      CHAR(4)              PRIMARY KEY, 
    LNAME    VARCHAR2(20)         NOT NULL,
    PID      CHAR(4)              NOT NULL,
    RID      CHAR(4),
    TID      CHAR(4)              NOT NULL
);

--  수강신청 테이블
CREATE TABLE LSALES(
    LSID     CHAR(6)        PRIMARY KEY, 
    DID      CHAR(4)        NOT NULL,
    MID      VARCHAR2(20)   NOT NULL,    
    LSDATE   DATE           DEFAULT     SYSDATE 
);

-- 수업상세테이블 DLECTURES
CREATE TABLE DLECTURES(
    DID      CHAR(4)        PRIMARY KEY, 
    LID      CHAR(4)        NOT NULL,
    PID      CHAR(4)        NOT NULL,
    DSDATE   DATE, 
    DDAY     VARCHAR2(20),     
    DTIME    VARCHAR2(20),
    DHOURS   NUMBER         NOT NULL   
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
    PID      CHAR(4)         NOT NULL, 
    BID      CHAR(4)         NOT NULL,
    IMP      NUMBER    
);

-- 부위테이블
CREATE TABLE BPART(
    BID        CHAR(4)          PRIMARY KEY, 
    BNAME      VARCHAR2(20)     NOT NULL
);

--  게시판(BOARD)
CREATE TABLE BOARD(
    IDX         NUMBER(5)                  PRIMARY KEY,
    MENU_ID     CHAR(10)                   NOT NULL,
    TITLE       VARCHAR2(100)              NOT NULL,
    CONT        VARCHAR2(4000),
    MID         VARCHAR2(20)               NOT NULL,
    REGDATE     VARCHAR2(50)               NOT NULL,
    READCOUNT   NUMBER(5),
    BNUM        NUMBER(5),
    LVL         NUMBER(5),
    STEP        NUMBER(5),
    NREF        NUMBER(5),
    DELNUM      NUMBER(2),
    LIKECOUNT NUMBER(10)
);


CREATE TABLE FILES(
    FILE_NUM    NUMBER(5)                   PRIMARY KEY,
    IDX         NUMBER(5)                   NOT NULL,
    FILENAME    VARCHAR2(300)               NOT NULL,
    FILEEXT     VARCHAR2(20)                NOT NULL,
    SFILENAME   VARCHAR2(300)               NOT NULL
);

CREATE TABLE BLIKE(
    MID VARCHAR2(20),
    IDX NUMBER(5),
    ISLIKE CHAR(1)
);


CREATE TABLE MENUS(
    MENU_ID     CHAR(7)                     PRIMARY KEY,  
    MENU_NAME   VARCHAR2(100)               NOT NULL,
    MENU_SEQ    NUMBER(5)                   NOT NULL
);