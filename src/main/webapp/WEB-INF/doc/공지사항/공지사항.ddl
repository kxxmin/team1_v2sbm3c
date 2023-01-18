/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE ADMIN(
		ADMINNO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		ID                            		VARCHAR2(20)		 NOT NULL,
		PASSWD                        		VARCHAR2(15)		 NOT NULL,
		MNAME                         		VARCHAR2(20)		 NOT NULL,
		MDATE                         		DATE		 NOT NULL,
		GRADE                         		NUMBER(2)		 NOT NULL,
  CONSTRAINT SYS_C007459 UNIQUE (ID)
);

COMMENT ON TABLE ADMIN is '관리자';
COMMENT ON COLUMN ADMIN.ADMINNO is '관리자 번호';
COMMENT ON COLUMN ADMIN.ID is '아이디';
COMMENT ON COLUMN ADMIN.PASSWD is '패스워드';
COMMENT ON COLUMN ADMIN.MNAME is '성명';
COMMENT ON COLUMN ADMIN.MDATE is '가입일';
COMMENT ON COLUMN ADMIN.GRADE is '등급';


/**********************************/
/* Table Name: 공지사항 카테고리 */
/**********************************/
CREATE TABLE NOTICECATE(
		NOTICECATENO                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NAME                          		VARCHAR2(50)		 NOT NULL,
		CNT                           		NUMBER(7)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		UDATE                         		DATE		 NULL ,
		SEQNO                         		NUMBER(5)		 DEFAULT 0		 NOT NULL,
		VISIBLE                       		CHAR(1)		 DEFAULT 'N'		 NOT NULL
);

COMMENT ON TABLE NOTICECATE is '공지사항 카테고리';
COMMENT ON COLUMN NOTICECATE.NOTICECATENO is '공지사항 카테고리번호';
COMMENT ON COLUMN NOTICECATE.NAME is '카테고리 이름';
COMMENT ON COLUMN NOTICECATE.CNT is '관련 자료수';
COMMENT ON COLUMN NOTICECATE.RDATE is '등록일';
COMMENT ON COLUMN NOTICECATE.UDATE is '수정일';
COMMENT ON COLUMN NOTICECATE.SEQNO is '출력 순서';
COMMENT ON COLUMN NOTICECATE.VISIBLE is '출력모드';


/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE NOTICE(
		NOTICENO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		ADMINNO                       		NUMBER(10)		 NOT NULL,
		NOTICECATENO                  		NUMBER(10)		 NULL ,
		TITLE                         		VARCHAR2(300)		 NOT NULL,
		CONTENT                       		CLOB(4000)		 NOT NULL,
		CNT                           		NUMBER(7)		 NOT NULL,
		PASSWD                        		VARCHAR2(15)		 NOT NULL,
		WORD                          		VARCHAR2(300)		 NULL ,
		RDATE                         		DATE		 NOT NULL,
		FILE1                         		VARCHAR2(100)		 NULL ,
		FILE1SAVED                    		VARCHAR2(100)		 NULL ,
		THUMB1                        		VARCHAR2(100)		 NULL ,
		SIZE1                         		NUMBER(10)		 NULL ,
  FOREIGN KEY (NOTICECATENO) REFERENCES NOTICECATE (NOTICECATENO),
  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
);

COMMENT ON TABLE NOTICE is '공지사항';
COMMENT ON COLUMN NOTICE.NOTICENO is '공지사항 번호';
COMMENT ON COLUMN NOTICE.ADMINNO is '관리자 번호';
COMMENT ON COLUMN NOTICE.NOTICECATENO is '공지사항 카테고리번호';
COMMENT ON COLUMN NOTICE.TITLE is '제목';
COMMENT ON COLUMN NOTICE.CONTENT is '내용';
COMMENT ON COLUMN NOTICE.CNT is '조회수';
COMMENT ON COLUMN NOTICE.PASSWD is '패스워드';
COMMENT ON COLUMN NOTICE.WORD is '검색어';
COMMENT ON COLUMN NOTICE.RDATE is '등록일';
COMMENT ON COLUMN NOTICE.FILE1 is '메인 이미지';
COMMENT ON COLUMN NOTICE.FILE1SAVED is '실제 저장된 메인 이미지';
COMMENT ON COLUMN NOTICE.THUMB1 is '메인 이미지 Preview';
COMMENT ON COLUMN NOTICE.SIZE1 is '메인 이미지 크기';


/**********************************/
/* Table Name: 영역 확장 테이블 */
/**********************************/
CREATE TABLE TABLE_15(
		COLUMN_1                      		INTEGER(10)		 NULL ,
		COLUMN_2                      		INTEGER(10)		 NULL ,
		COLUMN_3                      		INTEGER(10)		 NULL ,
		COLUMN_4                      		INTEGER(10)		 NULL ,
		COLUMN_5                      		INTEGER(10)		 NULL 
);

COMMENT ON TABLE TABLE_15 is '영역 확장 테이블';
COMMENT ON COLUMN TABLE_15.COLUMN_1 is 'Column1';
COMMENT ON COLUMN TABLE_15.COLUMN_2 is 'Column2';
COMMENT ON COLUMN TABLE_15.COLUMN_3 is 'Column3';
COMMENT ON COLUMN TABLE_15.COLUMN_4 is 'Column4';
COMMENT ON COLUMN TABLE_15.COLUMN_5 is 'Column5';


