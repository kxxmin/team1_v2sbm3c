/**********************************/
/* Table Name: 마이페이지 */
/**********************************/
CREATE TABLE mypage(
		mypageno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEMBERNO                      		NUMERIC(10)		 NULL 
);

COMMENT ON TABLE mypage is '마이페이지';
COMMENT ON COLUMN mypage.mypageno is '마이페이지번호';
COMMENT ON COLUMN mypage.MEMBERNO is '회원번호';


/**********************************/
/* Table Name: 회원등급 */
/**********************************/
CREATE TABLE MGRADE(
		mgrade                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		GRADENAME                    		VARCHAR(20)		 NULL 
);

COMMENT ON TABLE MGRADE is '회원등급';
COMMENT ON COLUMN MGRADE.mgrade is '회원등급';
COMMENT ON COLUMN MGRADE.GRADENAME is '등급명';


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		MEMBERNO                      		NUMERIC(10)		 NOT NULL		 PRIMARY KEY,
		ID                            		VARCHAR2(20)		 NOT NULL,
		PASSWORD                      		VARCHAR2(20)		 NOT NULL,
		NAME                          		VARCHAR2(20)		 NOT NULL,
		tel                       		VARCHAR2(20)		 NOT NULL,
		GENDER                        		CHAR(2)		 NOT NULL,
		NICKNAME                      		VARCHAR2(20)		 NOT NULL,
		birth                          		DATE		 NOT NULL,
		EMAIL                        		VARCHAR2(50)		 NOT NULL,
		ADDRESS                       		VARCHAR2(100)		 NOT NULL,
		mgrade                        		NUMBER(10)		 NULL ,
		mypageno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (mypageno) REFERENCES mypage (mypageno),
  FOREIGN KEY (mgrade) REFERENCES MGRADE (mgrade)
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.MEMBERNO is '회원번호';
COMMENT ON COLUMN MEMBER.ID is '아이디';
COMMENT ON COLUMN MEMBER.PASSWORD is '비밀번호';
COMMENT ON COLUMN MEMBER.NAME is '이름';
COMMENT ON COLUMN MEMBER.tel is '전화번호';
COMMENT ON COLUMN MEMBER.GENDER is '성별';
COMMENT ON COLUMN MEMBER.NICKNAME is '닉네임';
COMMENT ON COLUMN MEMBER.birth is '생년월일';
COMMENT ON COLUMN MEMBER.EMAIL is '이메일';
COMMENT ON COLUMN MEMBER.ADDRESS is '주소';
COMMENT ON COLUMN MEMBER.mgrade is '회원등급';
COMMENT ON COLUMN MEMBER.mypageno is '마이페이지번호';


/**********************************/
/* Table Name: 카테고리 */
/**********************************/
DROP TABLE cate CASCADE CONSTRAINTS;
CREATE TABLE CATE(
		CATENO                        		NUMERIC(10)		 NOT NULL		 PRIMARY KEY,
		NAME                          		VARCHAR(50)		 NOT NULL,
		CNT                           		NUMERIC(10)	 DEFAULT 0	 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		UDATE                         		DATE		 NULL,
		SEQNO                         		NUMERIC(10)	 DEFAULT 0	 NOT NULL,
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

DROP SEQUENCE cate_seq;
CREATE SEQUENCE cate_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  commit;
  
  SELECT * FROM cate;
  UPDATE cate
  SET visible='Y'
  WHERE cateno=1;
/**********************************/
/* Table Name: 상품 */
/**********************************/
CREATE TABLE PRODUCT(
		PRODUCTNO                     		NUMERIC(10)		 NOT NULL		 PRIMARY KEY,
		CATENO                        		NUMERIC(10)		 NULL ,
		TITLE                         		VARCHAR(300)		 NOT NULL,
		CONTENT                       		VARCHAR(2000)		 NOT NULL,
		RECOM                         		NUMERIC(10)		 NOT NULL,
		CNT                           		NUMERIC(10)		 NOT NULL,
		REPLYCNT                      		NUMERIC(10)		 NOT NULL,
		PASSWD                        		VARCHAR(15)		 NOT NULL,
		WORD                          		VARCHAR(300)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		FILE1                         		VARCHAR(100)		 NOT NULL,
		SIZE1                         		NUMERIC(10)		 NOT NULL,
		PRICE                         		NUMERIC(10)		 NOT NULL,
		DC                            		NUMERIC(10)		 NOT NULL,
		SALEPRICE                     		NUMERIC(10)		 NOT NULL,
		POINT                         		NUMERIC(10)		 NOT NULL,
		SALECNT                       		NUMERIC(10)		 NOT NULL,
  FOREIGN KEY (CATENO) REFERENCES CATE (CATENO)
);

COMMENT ON TABLE PRODUCT is '상품';
COMMENT ON COLUMN PRODUCT.PRODUCTNO is '상품번호';
COMMENT ON COLUMN PRODUCT.CATENO is '카테고리번호';
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
/* Table Name: 관리자등급 */
/**********************************/
CREATE TABLE admingrade(
		admingrade                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		gradename                     		VARCHAR2(30)		 NOT NULL
);

COMMENT ON TABLE admingrade is '관리자등급';
COMMENT ON COLUMN admingrade.admingrade is '관리자등급';
COMMENT ON COLUMN admingrade.gradename is '등급명';

INSERT INTO admingrade(admingrade,gradename)
VALUES(10, '이벤트 관리자');
/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE admin(
		adminno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(10)		 NOT NULL,
		id                            		VARCHAR2(20)		 NOT NULL,
		passwd                        		VARCHAR2(50)		 NOT NULL,
		admingrade                    		NUMBER(10)		 NULL ,
  FOREIGN KEY (admingrade) REFERENCES admingrade (admingrade)
);

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.adminno is '관리자번호';
COMMENT ON COLUMN admin.name is '이름';
COMMENT ON COLUMN admin.id is '아이디';
COMMENT ON COLUMN admin.passwd is '비밀번호';
COMMENT ON COLUMN admin.admingrade is '관리자등급';


DROP SEQUENCE admin_seq;

CREATE SEQUENCE admin_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  commit;
  
INSERT INTO admin(adminno, name, id, passwd, admingrade)
VALUES (admin_seq.nextval, '관리자', 'eventad', 'eventad10', 10);
SELECT * FROM admin;
/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE NOTICE(
		NOTICENO                      		NUMERIC(10)		 NULL 		 PRIMARY KEY,
		NOTICETITLE                   		VARCHAR(50)		 NULL ,
		NOTICECONTENT                 		VARCHAR(3000)		 NULL ,
		NOTICECNT                     		NUMERIC(10)		 NULL ,
		NOTICESEARCH                  		VARCHAR(200)		 NULL ,
		NOTICEDATE                    		DATE		 NULL ,
		adminno                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE NOTICE is '공지사항';
COMMENT ON COLUMN NOTICE.NOTICENO is '공지사항 번호';
COMMENT ON COLUMN NOTICE.NOTICETITLE is '공지사항 제목';
COMMENT ON COLUMN NOTICE.NOTICECONTENT is '공지사항 내용';
COMMENT ON COLUMN NOTICE.NOTICECNT is '조회수';
COMMENT ON COLUMN NOTICE.NOTICESEARCH is '검색어';
COMMENT ON COLUMN NOTICE.NOTICEDATE is '등록일';
COMMENT ON COLUMN NOTICE.adminno is '관리자번호';


/**********************************/
/* Table Name: 이벤트-글 등록 */
/**********************************/
DROP TABLE event CASCADE CONSTRAINTS;
CREATE TABLE event(
		evtno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		evtitle                       		VARCHAR2(30)		 NOT NULL,
		evdesc                        		CLOB		 NOT NULL,
		evdate                        		VARCHAR2(70)		 NULL,
		evimage_r                     		VARCHAR2(1000)		 NULL ,
        evimage_rsaved                      VARCHAR2(1000)		 NULL ,
		evimage_t                     		VARCHAR2(1000)		 NULL,
        evimage_size                        VARCHAR2(1000)		 NULL,
        evword                        		VARCHAR2(50)		 NOT NULL,
		adminno                       		NUMBER(10)		NOT NULL ,
        cateno                       		NUMBER(10)		NOT NULL ,
  FOREIGN KEY (adminno) REFERENCES admin (adminno),
  FOREIGN KEY (cateno) REFERENCES cate (cateno)
);

COMMENT ON TABLE event is '이벤트-글 등록';
COMMENT ON COLUMN event.evtno is '이벤트 번호';
COMMENT ON COLUMN event.evtitle is '이벤트 제목';
COMMENT ON COLUMN event.evdesc is '이벤트 설명';
COMMENT ON COLUMN event.evdate is '이벤트 기간';
COMMENT ON COLUMN event.evimage_r is '이벤트 이미지(조회용)';
COMMENT ON COLUMN event.evimage_rsaved is '이미지 저장명';
COMMENT ON COLUMN event.evimage_t is '이벤트 이미지(썸네일)';
COMMENT ON COLUMN event.evimage_size is '이미지 크기';
COMMENT ON COLUMN event.evword is '이벤트 검색어';
COMMENT ON COLUMN event.adminno is '관리자번호';
COMMENT ON COLUMN event.cateno is '카테고리번호';
/**********************************/
/* 시퀀스 */
/**********************************/
DROP SEQUENCE event_seq;

CREATE SEQUENCE event_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  commit;
--등록
INSERT INTO event(evtno, evtitle, evdesc, evdate, evimage_r, evimage_t, evword, evimage_size, cateno, adminno) 
VALUES (event_seq.nextval, '블랙프라이데이', '블랙프라이데이 세일', '2022-12-25', 'blackfriday.jpg', 'blackfriday_t.jpg', '크리스마스,세일', 1, 1);

--전체목록
SELECT evtno, evtitle, evdesc, evdate, evimage_r, evimage_t, evword, evimage_size, cateno, adminno
FROM event
ORDER BY evtno ASC;

EVTNO    EVTITLE                             EVDESC                           EVDATE                     EVIMAGE_R                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                EVIMAGE_T                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ADMINNO
---------- ------------------------------ ------------------------------ ------------------------  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------
         1 블랙프라이데이                   블랙프라이데이 세일            2022-11-17 05:28:07  blackfriday.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          blackfriday_t.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 3
         3 블랙프라이데이                   블랙프라이데이 세일            2022-11-17 05:27:16  blackfriday.jpg       
         
-- 조회
SELECT evtno, evtitle, evdesc, evdate, evimage_r, evimage_t, adminno
FROM event
WHERE evtno=1;

    EVTNO EVTITLE                        EVDESC                         EVDATE              EVIMAGE_R            EVIMAGE_T   ADMINNO
---------- ------------------------------ ------------------------------ ------------------- -------------------------------------------------------
         1 블랙프라이데이                 블랙프라이데이 세일            2022-11-17 05:28:07 black.jpg     black_t.jpg    3
         
-- 수정
UPDATE event
SET evimage_r='black.jpg', evimage_t='black_t.jpg'
WHERE evtno=1;

-- 삭제
DELETE FROM event
WHERE evtno=3;

-- 레코드 갯수
SELECT COUNT(*) as cnt FROM event;

-- 검색 목록
SELECT evtno, evtitle, evdesc, evdate, evimage_r, evimage_t, adminno
FROM event
WHERE evtitle LIKE '%블랙%'
ORDER BY evtno ASC;

-- 검색 + 페이징 목록
SELECT evtno, evtitle, evdesc, evdate, evimage_r, evimage_t, adminno, r
FROM(
     SELECT evtno, evtitle, evdesc, evdate, evimage_r, evimage_t, adminno, rownum as r
     FROM (
            SELECT evtno, evtitle, evdesc, evdate, evimage_r, evimage_t, adminno
            FROM event
            WHERE evtitle LIKE '%블랙%'
            ORDER BY evtno ASC
     )  
)
WHERE r >= 1 AND r <= 3;

EVTNO     EVTITLE                             EVDESC                           EVDATE                            EVIMAGE_R            EVIMAGE_T         ADMINNO             R
---------- ------------------------------ ------------------------------ ------------------------------- ----------------  -----------------  --------------------- -----------------------
         1   블랙프라이데이                   블랙프라이데이 세일         2022-11-17 05:28:07             black.jpg                 black_t.jpg        3                        1       
         
         
commit;
/**********************************/
/* Table Name: 고객센터 */
/**********************************/
CREATE TABLE CENTER(
		CENTERNO                      		NUMERIC(10)		 NULL 		 PRIMARY KEY,
		CENTER_CATE                   		VARCHAR(10)		 NULL ,
		MEMBERNO                      		NUMERIC(10)		 NULL ,
		CENTER_PW                     		NUMERIC(10)		 NULL ,
		VISIBLE                       		NUMERIC(10)		 NULL ,
		CENTER_TITLE                  		VARCHAR(30)		 NULL ,
		CENTER_CONTENTS               		VARCHAR(1500)		 NULL ,
		CDATE                         		DATE		 NULL ,
		CUDATE                        		DATE		 NULL ,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
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
		REVIEWNO                      		NUMERIC(10)		 NOT NULL		 PRIMARY KEY,
		TITLE                         		VARCHAR(300)		 NOT NULL,
		REVIEWCONTENT                 		VARCHAR(2000)		 NOT NULL,
		pref                         		VARCHAR(10)		 NOT NULL,
		LIKECNT                       		NUMERIC(10)		 NOT NULL,
		word                         		VARCHAR(300)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		FILE1                         		VARCHAR(100)		 NOT NULL,
		SIZE1                         		NUMERIC(10)		 NOT NULL,
		PRODUCTNO                     		NUMERIC(10)		 NULL ,
		MEMBERNO                      		NUMERIC(10)		 NULL ,
  FOREIGN KEY (PRODUCTNO) REFERENCES PRODUCT (PRODUCTNO),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE REVIEW is '상품후기';
COMMENT ON COLUMN REVIEW.REVIEWNO is '상품후기번호';
COMMENT ON COLUMN REVIEW.TITLE is '상품후기제목';
COMMENT ON COLUMN REVIEW.REVIEWCONTENT is '상품후기 내용';
COMMENT ON COLUMN REVIEW.perf is '좋아요';
COMMENT ON COLUMN REVIEW.LIKECNT is '좋아요수';
COMMENT ON COLUMN REVIEW.word is '검색어';
COMMENT ON COLUMN REVIEW.RDATE is '등록일';
COMMENT ON COLUMN REVIEW.FILE1 is '메인이미지';
COMMENT ON COLUMN REVIEW.SIZE1 is '메인이미지크기';
COMMENT ON COLUMN REVIEW.PRODUCTNO is '상품번호';
COMMENT ON COLUMN REVIEW.MEMBERNO is '회원번호';


/**********************************/
/* Table Name: 댓글 */
/**********************************/
CREATE TABLE reply(
		replyno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		content                       		CLOB		 NOT NULL,
		rdate                          		DATE		 NOT NULL,
		passwd                        		NUMBER(15)		 NULL ,
		MEMBERNO                      		NUMERIC(10)		 NULL ,
		REVIEWNO                      		NUMERIC(10)		 NULL ,
  FOREIGN KEY (REVIEWNO) REFERENCES REVIEW (REVIEWNO),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE reply is '댓글';
COMMENT ON COLUMN reply.replyno is '댓글번호';
COMMENT ON COLUMN reply.content is '내용';
COMMENT ON COLUMN reply.rdate is '등록일';
COMMENT ON COLUMN reply.passwd is '비밀번호';
COMMENT ON COLUMN reply.MEMBERNO is '회원번호';
COMMENT ON COLUMN reply.REVIEWNO is '상품후기번호';



/**********************************/
/* Table Name: 주문_결재 */
/**********************************/
CREATE TABLE ORDER_PAY(
		ORDER_PAYNO                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEMBERNO                      		NUMBER(10)		 NULL ,
		RNAME                         		VARCHAR2(30)		 NOT NULL,
		RTEL                          		VARCHAR2(14)		 NOT NULL,
		RZIPCODE                      		VARCHAR2(5)		 NULL ,
		RADDRESS1                     		VARCHAR2(80)		 NOT NULL,
		RADDRESS2                     		VARCHAR2(50)		 NOT NULL,
		PAYTYPE                       		NUMBER(1)		 NOT NULL,
		AMOUNT                        		NUMBER(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE ORDER_PAY is '주문_결재';
COMMENT ON COLUMN ORDER_PAY.ORDER_PAYNO is '주문 번호';
COMMENT ON COLUMN ORDER_PAY.MEMBERNO is '회원 번호';
COMMENT ON COLUMN ORDER_PAY.RNAME is '수취인성명';
COMMENT ON COLUMN ORDER_PAY.RTEL is '수취인 전화번호';
COMMENT ON COLUMN ORDER_PAY.RZIPCODE is '수취인 우편번호';
COMMENT ON COLUMN ORDER_PAY.RADDRESS1 is '수취인 주소1';
COMMENT ON COLUMN ORDER_PAY.RADDRESS2 is '수취인 주소2';
COMMENT ON COLUMN ORDER_PAY.PAYTYPE is '결재 종류';
COMMENT ON COLUMN ORDER_PAY.AMOUNT is '결재금액';
COMMENT ON COLUMN ORDER_PAY.RDATE is '주문날짜';


/**********************************/
/* Table Name: 주문상세 */
/**********************************/
CREATE TABLE ORDER_ITEM(
		ORDER_ITEMNO                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEMBERNO                      		NUMBER(10)		 NULL ,
		PRODUCTNO                     		NUMERIC(10)		 NULL ,
		infono                        		NUMBER(10)		 NULL ,
		MENUNO                        		NUMBER(10)		 NULL ,
		ORDER_PAYNO                   		NUMBER(10)		 NOT NULL,
		CNT                           		NUMBER(5)		 NOT NULL,
		TOT                           		NUMBER(10)		 NOT NULL,
		STATENO                       		NUMBER(1)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (ORDER_PAYNO) REFERENCES ORDER_PAY (ORDER_PAYNO),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE ORDER_ITEM is '주문상세';
COMMENT ON COLUMN ORDER_ITEM.ORDER_ITEMNO is '주문상세번호';
COMMENT ON COLUMN ORDER_ITEM.MEMBERNO is '회원 번호';
COMMENT ON COLUMN ORDER_ITEM.PRODUCTNO is '상품번호';
COMMENT ON COLUMN ORDER_ITEM.infono is '주문배송번호';
COMMENT ON COLUMN ORDER_ITEM.MENUNO is '메뉴 번호';
COMMENT ON COLUMN ORDER_ITEM.ORDER_PAYNO is '주문 번호';
COMMENT ON COLUMN ORDER_ITEM.CNT is '수량';
COMMENT ON COLUMN ORDER_ITEM.TOT is '합계';
COMMENT ON COLUMN ORDER_ITEM.STATENO is '주문상태';
COMMENT ON COLUMN ORDER_ITEM.RDATE is '주문날짜';


/**********************************/
/* Table Name: 쇼핑카트 */
/**********************************/
CREATE TABLE CART(
		CARTNO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		CONTENTSNO                    		NUMBER(10)		 NOT NULL,
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
		CNT                           		NUMBER(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE CART is '쇼핑카트';
COMMENT ON COLUMN CART.CARTNO is '쇼핑카트 번호';
COMMENT ON COLUMN CART.CONTENTSNO is '컨텐츠 번호(상품 번호)';
COMMENT ON COLUMN CART.MEMBERNO is '회원 번호';
COMMENT ON COLUMN CART.CNT is '수량';
COMMENT ON COLUMN CART.RDATE is '날짜';


