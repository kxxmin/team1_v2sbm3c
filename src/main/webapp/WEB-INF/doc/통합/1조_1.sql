/**********************************/
/* Table Name: 회원등급 */
/**********************************/
DROP TABLE GRADE CASCADE CONSTRAINTS;
CREATE TABLE MEMBER GRADE(
		MEMBERGRADE                  		NUMBER(10)		 NOT NULL,
		GRADENAME                    		VARCHAR(20)		 NULL 
);

COMMENT ON TABLE MEMBER GRADE is '회원등급';
COMMENT ON COLUMN MEMBER GRADE.MEMBERGRADE is '회원등급';
COMMENT ON COLUMN MEMBER GRADE.GRADENAME is '등급명';


/**********************************/
/* Table Name: 마이페이지 */
/**********************************/
CREATE TABLE mypage(
		mypageno                      		NUMBER(10)		 NOT NULL,
		MEMBERNO                      		NUMBER(10)		 NULL 
);

COMMENT ON TABLE mypage is '마이페이지';
COMMENT ON COLUMN mypage.mypageno is '마이페이지번호';
COMMENT ON COLUMN mypage.MEMBERNO is '회원번호';


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
		ID                            		VARCHAR(20)		 NOT NULL,
		PASSWORD                      		VARCHAR(20)		 NOT NULL,
		NAME                          		VARCHAR(20)		 NOT NULL,
		NUMBER                        		VARCHAR(20)		 NOT NULL,
		GENDER                        		CHAR(2)		 NOT NULL,
		NICKNAME                      		VARCHAR(20)		 NOT NULL,
		DATE                          		DATE		 NOT NULL,
		E-MAIL                        		VARCHAR(50)		 NOT NULL,
		ADDRESS                       		VARCHAR(100)		 NOT NULL,
		MEMBER GRADE                  		NUMBER(10)		 NULL ,
		mypageno                      		NUMBER(10)		 NULL 
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.MEMBERNO is '회원번호';
COMMENT ON COLUMN MEMBER.ID is '아이디';
COMMENT ON COLUMN MEMBER.PASSWORD is '비밀번호';
COMMENT ON COLUMN MEMBER.NAME is '이름';
COMMENT ON COLUMN MEMBER.NUMBER is '전화번호';
COMMENT ON COLUMN MEMBER.GENDER is '성별';
COMMENT ON COLUMN MEMBER.NICKNAME is '닉네임';
COMMENT ON COLUMN MEMBER.DATE is '생년월일';
COMMENT ON COLUMN MEMBER.E-MAIL is '이메일';
COMMENT ON COLUMN MEMBER.ADDRESS is '주소';
COMMENT ON COLUMN MEMBER.MEMBER GRADE is '회원등급';
COMMENT ON COLUMN MEMBER.mypageno is '마이페이지번호';


/**********************************/
/* Table Name: 관리자등급 */
/**********************************/
CREATE TABLE admingrade(
		admingrade                    		NUMBER(10)		 NOT NULL,
		gradename                     		VARCHAR2(30)		 NOT NULL
);

COMMENT ON TABLE admingrade is '관리자등급';
COMMENT ON COLUMN admingrade.admingrade is '관리자등급';
COMMENT ON COLUMN admingrade.gradename is '등급명';


/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE admin(
		adminno                       		NUMBER(10)		 NOT NULL,
		name                          		NUMBER(10)		 NOT NULL,
		id                            		VARCHAR2(20)		 NOT NULL,
		passwd                        		VARCHAR2(50)		 NOT NULL,
		admingrade                    		NUMBER(10)		 NULL 
);

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.adminno is '관리자번호';
COMMENT ON COLUMN admin.name is '이름';
COMMENT ON COLUMN admin.id is '아이디';
COMMENT ON COLUMN admin.passwd is '비밀번호';
COMMENT ON COLUMN admin.admingrade is '관리자등급';


/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE CATE(
		CATENO                        		NUMBER(10)		 NOT NULL,
		NAME                          		VARCHAR(50)		 NOT NULL,
		CNT                           		NUMBER(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		UDATE                         		DATE		 NOT NULL,
		SEQNO                         		NUMBER(10)		 NOT NULL,
		VISIBLE                       		CHAR(1)		 NOT NULL
);

COMMENT ON TABLE CATE is '카테고리';
COMMENT ON COLUMN CATE.CATENO is '카테고리번호';
COMMENT ON COLUMN CATE.NAME is '카테고리 이름';
COMMENT ON COLUMN CATE.CNT is '관련 자료 수';
COMMENT ON COLUMN CATE.RDATE is '등록일';
COMMENT ON COLUMN CATE.UDATE is '수정일';
COMMENT ON COLUMN CATE.SEQNO is '등록순서';
COMMENT ON COLUMN CATE.VISIBLE is 'VISIBLE';


/**********************************/
/* Table Name: 상품 */
/**********************************/
CREATE TABLE PRODUCT(
		PRODUCTNO                     		NUMBER(10)		 NOT NULL,
		CATENO                        		NUMBER(10)		 NULL ,
		adminno                       		NUMBER(10)		 NULL ,
		TITLE                         		VARCHAR(300)		 NOT NULL,
		CONTENT                       		VARCHAR(2000)		 NOT NULL,
		RECOM                         		NUMBER(10)		 NOT NULL,
		CNT                           		NUMBER(10)		 NOT NULL,
		REPLYCNT                      		NUMBER(10)		 NOT NULL,
		PASSWD                        		VARCHAR(15)		 NOT NULL,
		WORD                          		VARCHAR(300)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		FILE1                         		VARCHAR(100)		 NOT NULL,
		SIZE1                         		NUMBER(10)		 NOT NULL,
		PRICE                         		NUMBER(10)		 NOT NULL,
		DC                            		NUMBER(10)		 NOT NULL,
		SALEPRICE                     		NUMBER(10)		 NOT NULL,
		POINT                         		NUMBER(10)		 NOT NULL,
		SALECNT                       		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE PRODUCT is '상품';
COMMENT ON COLUMN PRODUCT.PRODUCTNO is '상품번호';
COMMENT ON COLUMN PRODUCT.CATENO is '카테고리번호';
COMMENT ON COLUMN PRODUCT.adminno is '관리자번호';
COMMENT ON COLUMN PRODUCT.TITLE is '제목';
COMMENT ON COLUMN PRODUCT.CONTENT is '내용';
COMMENT ON COLUMN PRODUCT.RECOM is '추천수';
COMMENT ON COLUMN PRODUCT.CNT is '조회수';
COMMENT ON COLUMN PRODUCT.REPLYCNT is '댓글수';
COMMENT ON COLUMN PRODUCT.PASSWD is '패스워드';
COMMENT ON COLUMN PRODUCT.WORD is '검색어';
COMMENT ON COLUMN PRODUCT.RDATE is '등록일';
COMMENT ON COLUMN PRODUCT.FILE1 is '메인 이미지';
COMMENT ON COLUMN PRODUCT.SIZE1 is '메인 이미지 크기';
COMMENT ON COLUMN PRODUCT.PRICE is '정가';
COMMENT ON COLUMN PRODUCT.DC is '할인률';
COMMENT ON COLUMN PRODUCT.SALEPRICE is '판매가';
COMMENT ON COLUMN PRODUCT.POINT is '포인트';
COMMENT ON COLUMN PRODUCT.SALECNT is '수량';


/**********************************/
/* Table Name: 공지사항 카테고리 */
/**********************************/
CREATE TABLE NCATE(
		NCATENO                       		NUMBER(10)		 NOT NULL,
		NAME                          		VARCHAR(50)		 NOT NULL,
		CNT                           		NUMERIC(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		UDATE                         		DATE		 NOT NULL,
		SEQNO                         		NUMERIC(10)		 NOT NULL,
		VISIBLE                       		CHAR(1)		 NOT NULL
);

COMMENT ON TABLE NCATE is '공지사항 카테고리';
COMMENT ON COLUMN NCATE.NCATENO is '카테고리번호';
COMMENT ON COLUMN NCATE.NAME is '카테고리 이름';
COMMENT ON COLUMN NCATE.CNT is '관련 자료 수';
COMMENT ON COLUMN NCATE.RDATE is '등록일';
COMMENT ON COLUMN NCATE.UDATE is '수정일';
COMMENT ON COLUMN NCATE.SEQNO is '등록순서';
COMMENT ON COLUMN NCATE.VISIBLE is 'VISIBLE';


/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE NOTICE(
		NOTICENO                      		NUMERIC(10)		 NULL ,
		NOTICETITLE                   		VARCHAR(50)		 NULL ,
		NOTICECONTENT                 		VARCHAR(3000)		 NULL ,
		NOTICECNT                     		NUMERIC(10)		 NULL ,
		NOTICESEARCH                  		VARCHAR(200)		 NULL ,
		NOTICEDATE                    		DATE		 NULL ,
		adminno                       		NUMBER(10)		 NULL ,
		NCATENO                       		NUMBER(10)		 NULL 
);

COMMENT ON TABLE NOTICE is '공지사항';
COMMENT ON COLUMN NOTICE.NOTICENO is '공지사항 번호';
COMMENT ON COLUMN NOTICE.NOTICETITLE is '공지사항 제목';
COMMENT ON COLUMN NOTICE.NOTICECONTENT is '공지사항 내용';
COMMENT ON COLUMN NOTICE.NOTICECNT is '조회수';
COMMENT ON COLUMN NOTICE.NOTICESEARCH is '검색어';
COMMENT ON COLUMN NOTICE.NOTICEDATE is '등록일';
COMMENT ON COLUMN NOTICE.adminno is '관리자번호';
COMMENT ON COLUMN NOTICE.NCATENO is '카테고리번호';


/**********************************/
/* Table Name: 이벤트-글 등록 */
/**********************************/
CREATE TABLE event(
		evtno                         		NUMBER(10)		 NOT NULL,
		evtitle                       		VARCHAR2(30)		 NOT NULL,
		evdesc                        		VARCHAR2(30)		 NOT NULL,
		evdate                        		DATE		 NOT NULL,
		evimage_r                     		VARCHAR2(1000)		 NULL ,
		evimage_t                     		VARCHAR2(1000)		 NOT NULL,
		adminno                       		NUMBER(10)		 NULL 
);

COMMENT ON TABLE event is '이벤트-글 등록';
COMMENT ON COLUMN event.evtno is '이벤트 번호';
COMMENT ON COLUMN event.evtitle is '이벤트 제목';
COMMENT ON COLUMN event.evdesc is '이벤트 설명';
COMMENT ON COLUMN event.evdate is '이벤트 기간';
COMMENT ON COLUMN event.evimage_r is '이벤트 이미지(조회용)';
COMMENT ON COLUMN event.evimage_t is '이벤트 이미지(썸네일)';
COMMENT ON COLUMN event.adminno is '관리자번호';


/**********************************/
/* Table Name: 고객센터 */
/**********************************/
CREATE TABLE CENTER(
		CENTERNO                      		NUMBER(10)		 NULL ,
		CENTER_CATE                   		VARCHAR(10)		 NULL ,
		MEMBERNO                      		NUMBER(10)		 NULL ,
		CENTER_PW                     		NUMBER(10)		 NULL ,
		VISIBLE                       		NUMBER(10)		 NULL ,
		CENTER_TITLE                  		VARCHAR(30)		 NULL ,
		CENTER_CONTENTS               		VARCHAR(1500)		 NULL ,
		CDATE                         		DATE		 NULL ,
		CUDATE                        		DATE		 NULL 
);

COMMENT ON TABLE CENTER is '고객센터';
COMMENT ON COLUMN CENTER.CENTERNO is '고객센터 번호';
COMMENT ON COLUMN CENTER.CENTER_CATE is '고객 카테고리';
COMMENT ON COLUMN CENTER.MEMBERNO is '회원 번호';
COMMENT ON COLUMN CENTER.CENTER_PW is '고객센터 글 암호';
COMMENT ON COLUMN CENTER.VISIBLE is '공개여부';
COMMENT ON COLUMN CENTER.CENTER_TITLE is '고객센터 글 제목';
COMMENT ON COLUMN CENTER.CENTER_CONTENTS is '고객센터 글 내용';
COMMENT ON COLUMN CENTER.CDATE is '게시일';
COMMENT ON COLUMN CENTER.CUDATE is '수정일';


/**********************************/
/* Table Name: 상품후기 */
/**********************************/
CREATE TABLE REVIEW(
		REVIEWNO                      		NUMBER(10)		 NOT NULL,
		TITLE                         		VARCHAR(300)		 NOT NULL,
		REVIEWCONTENT                 		VARCHAR(2000)		 NOT NULL,
		LIKE                          		VARCHAR(10)		 NOT NULL,
		LIKECNT                       		NUMBER(10)		 NOT NULL,
		WORD                          		VARCHAR(300)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		FILE1                         		VARCHAR(100)		 NOT NULL,
		SIZE1                         		NUMBER(10)		 NOT NULL,
		PRODUCTNO                     		NUMBER(10)		 NULL ,
		MEMBERNO                      		NUMBER(10)		 NULL 
);

COMMENT ON TABLE REVIEW is '상품후기';
COMMENT ON COLUMN REVIEW.REVIEWNO is '상품후기번호';
COMMENT ON COLUMN REVIEW.TITLE is '상품후기제목';
COMMENT ON COLUMN REVIEW.REVIEWCONTENT is '상품후기 내용';
COMMENT ON COLUMN REVIEW.LIKE is '좋아요';
COMMENT ON COLUMN REVIEW.LIKECNT is '좋아요수';
COMMENT ON COLUMN REVIEW.WORD is '검색어';
COMMENT ON COLUMN REVIEW.RDATE is '등록일';
COMMENT ON COLUMN REVIEW.FILE1 is '메인이미지';
COMMENT ON COLUMN REVIEW.SIZE1 is '메인이미지크기';
COMMENT ON COLUMN REVIEW.PRODUCTNO is '상품번호';
COMMENT ON COLUMN REVIEW.MEMBERNO is '회원번호';


/**********************************/
/* Table Name: 댓글 */
/**********************************/
CREATE TABLE reply(
		replyno                       		NUMBER(10)		 NOT NULL,
		content                       		CLOB(1000)		 NOT NULL,
		date                          		DATE		 NOT NULL,
		passwd                        		NUMBER(15)		 NULL ,
		MEMBERNO                      		NUMBER(10)		 NULL ,
		REVIEWNO                      		NUMBER(10)		 NULL 
);

COMMENT ON TABLE reply is '댓글';
COMMENT ON COLUMN reply.replyno is '댓글번호';
COMMENT ON COLUMN reply.content is '내용';
COMMENT ON COLUMN reply.date is '등록일';
COMMENT ON COLUMN reply.passwd is '비밀번호';
COMMENT ON COLUMN reply.MEMBERNO is '회원번호';
COMMENT ON COLUMN reply.REVIEWNO is '상품후기번호';


/**********************************/
/* Table Name: 박영은 */
/**********************************/
CREATE TABLE 박영은(

);

COMMENT ON TABLE 박영은 is '박영은';


/**********************************/
/* Table Name: 김성민 */
/**********************************/
CREATE TABLE 김성민(

);

COMMENT ON TABLE 김성민 is '김성민';


/**********************************/
/* Table Name: 이시원 */
/**********************************/
CREATE TABLE 이시원(

);

COMMENT ON TABLE 이시원 is '이시원';


/**********************************/
/* Table Name: 맹주영 */
/**********************************/
CREATE TABLE 맹주영(

);

COMMENT ON TABLE 맹주영 is '맹주영';


/**********************************/
/* Table Name: 최민영 */
/**********************************/
CREATE TABLE 최민영(

);

COMMENT ON TABLE 최민영 is '최민영';


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


/**********************************/
/* Table Name: Youtube 카테고리 */
/**********************************/
CREATE TABLE YCATE(
		YCATENO                       		NUMBER(10)		 NOT NULL,
		NAME                          		VARCHAR(50)		 NOT NULL,
		CNT                           		NUMBER(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		UDATE                         		DATE		 NOT NULL,
		SEQNO                         		NUMBER(10)		 NOT NULL,
		VISIBLE                       		CHAR(1)		 NOT NULL
);

COMMENT ON TABLE YCATE is 'Youtube 카테고리';
COMMENT ON COLUMN YCATE.YCATENO is '카테고리번호';
COMMENT ON COLUMN YCATE.NAME is '카테고리 이름';
COMMENT ON COLUMN YCATE.CNT is '관련 자료 수';
COMMENT ON COLUMN YCATE.RDATE is '등록일';
COMMENT ON COLUMN YCATE.UDATE is '수정일';
COMMENT ON COLUMN YCATE.SEQNO is '등록순서';
COMMENT ON COLUMN YCATE.VISIBLE is 'VISIBLE';


/**********************************/
/* Table Name: youtube */
/**********************************/
CREATE TABLE YOUTUBE(
		YOUTUBENO                     		NUMBER(10)		 NOT NULL,
		TITLE                         		VARCHAR2(300)		 NOT NULL,
		URL                           		VARCHAR2(1000)		 NOT NULL,
		CNT                           		NUMBER(7)		 NOT NULL,
		PASSWD                        		VARCHAR2(15)		 NOT NULL,
		WORD                          		VARCHAR2(300)		 NULL ,
		RDATE                         		DATE		 NOT NULL,
		MEMBERNO                      		NUMBER(10)		 NULL ,
		YCATENO                       		NUMBER(10)		 NULL 
);

COMMENT ON TABLE YOUTUBE is 'youtube';
COMMENT ON COLUMN YOUTUBE.YOUTUBENO is 'youtube 번호';
COMMENT ON COLUMN YOUTUBE.TITLE is '제목';
COMMENT ON COLUMN YOUTUBE.URL is '주소';
COMMENT ON COLUMN YOUTUBE.CNT is '조회수';
COMMENT ON COLUMN YOUTUBE.PASSWD is '패스워드';
COMMENT ON COLUMN YOUTUBE.WORD is '검색어';
COMMENT ON COLUMN YOUTUBE.RDATE is '등록일';
COMMENT ON COLUMN YOUTUBE.MEMBERNO is '회원 번호';
COMMENT ON COLUMN YOUTUBE.YCATENO is '카테고리번호';



ALTER TABLE MEMBER GRADE ADD CONSTRAINT IDX_MEMBER GRADE_PK PRIMARY KEY (MEMBER GRADE);

ALTER TABLE mypage ADD CONSTRAINT IDX_mypage_PK PRIMARY KEY (mypageno);

ALTER TABLE MEMBER ADD CONSTRAINT IDX_MEMBER_PK PRIMARY KEY (MEMBERNO);
ALTER TABLE MEMBER ADD CONSTRAINT IDX_MEMBER_FK0 FOREIGN KEY (MEMBER GRADE) REFERENCES MEMBER GRADE (MEMBER GRADE);
ALTER TABLE MEMBER ADD CONSTRAINT IDX_MEMBER_FK1 FOREIGN KEY (mypageno) REFERENCES mypage (mypageno);

ALTER TABLE admingrade ADD CONSTRAINT IDX_admingrade_PK PRIMARY KEY (admingrade);

ALTER TABLE admin ADD CONSTRAINT IDX_admin_PK PRIMARY KEY (adminno);
ALTER TABLE admin ADD CONSTRAINT IDX_admin_FK0 FOREIGN KEY (admingrade) REFERENCES admingrade (admingrade);

ALTER TABLE CATE ADD CONSTRAINT IDX_CATE_PK PRIMARY KEY (CATENO);

ALTER TABLE PRODUCT ADD CONSTRAINT IDX_PRODUCT_PK PRIMARY KEY (PRODUCTNO);
ALTER TABLE PRODUCT ADD CONSTRAINT IDX_PRODUCT_FK0 FOREIGN KEY (adminno) REFERENCES admin (adminno);
ALTER TABLE PRODUCT ADD CONSTRAINT IDX_PRODUCT_FK1 FOREIGN KEY (CATENO) REFERENCES CATE (CATENO);

ALTER TABLE NCATE ADD CONSTRAINT IDX_NCATE_PK PRIMARY KEY (NCATENO);

ALTER TABLE NOTICE ADD CONSTRAINT IDX_NOTICE_PK PRIMARY KEY (NOTICENO);
ALTER TABLE NOTICE ADD CONSTRAINT IDX_NOTICE_FK0 FOREIGN KEY (adminno) REFERENCES admin (adminno);
ALTER TABLE NOTICE ADD CONSTRAINT IDX_NOTICE_FK1 FOREIGN KEY (NCATENO) REFERENCES NCATE (NCATENO);

ALTER TABLE event ADD CONSTRAINT IDX_event_PK PRIMARY KEY (evtno);
ALTER TABLE event ADD CONSTRAINT IDX_event_FK0 FOREIGN KEY (adminno) REFERENCES admin (adminno);

ALTER TABLE CENTER ADD CONSTRAINT IDX_CENTER_PK PRIMARY KEY (CENTERNO);
ALTER TABLE CENTER ADD CONSTRAINT IDX_CENTER_FK0 FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO);

ALTER TABLE REVIEW ADD CONSTRAINT IDX_REVIEW_PK PRIMARY KEY (REVIEWNO);
ALTER TABLE REVIEW ADD CONSTRAINT IDX_REVIEW_FK0 FOREIGN KEY (PRODUCTNO) REFERENCES PRODUCT (PRODUCTNO);
ALTER TABLE REVIEW ADD CONSTRAINT IDX_REVIEW_FK1 FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO);

ALTER TABLE reply ADD CONSTRAINT IDX_reply_PK PRIMARY KEY (replyno);
ALTER TABLE reply ADD CONSTRAINT IDX_reply_FK0 FOREIGN KEY (REVIEWNO) REFERENCES REVIEW (REVIEWNO);
ALTER TABLE reply ADD CONSTRAINT IDX_reply_FK1 FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO);

ALTER TABLE YCATE ADD CONSTRAINT IDX_YCATE_PK PRIMARY KEY (YCATENO);

ALTER TABLE YOUTUBE ADD CONSTRAINT IDX_YOUTUBE_PK PRIMARY KEY (YOUTUBENO);
ALTER TABLE YOUTUBE ADD CONSTRAINT IDX_YOUTUBE_FK0 FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO);
ALTER TABLE YOUTUBE ADD CONSTRAINT IDX_YOUTUBE_FK1 FOREIGN KEY (YCATENO) REFERENCES YCATE (YCATENO);

