/**********************************/
/* Table Name: 공지사항 */
/**********************************/
DROP TABLE NOTICE CASCADE CONSTRAINTS;
CREATE TABLE NOTICE(
		NOTICENO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		ADMINNO                       		NUMBER(10)		 NOT NULL,
		NOTICECATENO                  		NUMBER(10)		 NULL ,
		TITLE                         		VARCHAR2(300)		 NOT NULL,
		CONTENT                       		CLOB     		 NOT NULL,
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

DROP SEQUENCE NOTICE_SEQ;
CREATE SEQUENCE NOTICE_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999       -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지

-- 등록: 1건 이상, adminno, noticecateno 컬럼에 등록되어 있는 값만 사용 가능
INSERT INTO notice(noticeno, adminno, noticecateno,
                   title, content, cnt, passwd,
                   word, rdate, file1, file1saved, thumb1, size1)
VALUES (notice_seq.nextval, 1, 1, 
        '회식 관련', '종강날 회식', 0, '1234',
        '회식', sysdate, 'file1.jpg', 'file1saved.jpg', 'thumb1.jpg', 1000);

INSERT INTO notice(noticeno, adminno, noticecateno,
                   title, content, cnt, passwd,
                   word, rdate, file1, file1saved, thumb1, size1)
VALUES (notice_seq.nextval, 1, 1, 
        '회식 관련', '종강날 회식', 0, '1234',
        '회식', sysdate, 'file1.jpg', 'file1saved.jpg', 'thumb1.jpg', 2000);

INSERT INTO notice(noticeno, adminno, noticecateno,
                   title, content, cnt, passwd,
                   word, rdate, file1, file1saved, thumb1, size1)
VALUES (notice_seq.nextval, 1, 1, 
        '회식 관련', '종강날 회식', 0, '1234',
        '회식', sysdate, 'file1.jpg', 'file1saved.jpg', 'thumb1.jpg', 3000);

commit;

-- 전체 목록
SELECT noticeno, adminno, noticecateno, title, content, cnt, passwd,
       word, rdate, file1, file1saved, thumb1, size1
FROM notice
ORDER BY noticeno DESC;

-- 조회
SELECT noticeno, adminno, noticecateno, title, content, cnt, passwd,
       word, rdate, file1, file1saved, thumb1, size1
FROM notice
WHERE noticeno=1;

-- 글 수정
UPDATE notice
SET title='회식 관련', content='종로에서 진행', cnt=100, word='회식' 
WHERE noticeno=1 and passwd='1234';

-- 파일 수정
UPDATE notice
SET file1='food.jpg', file1saved='food_1.jpg', thumb1='food_1_t.jpg', size1=5000
WHERE noticeno=1 and passwd='1234';

-- 삭제
DELETE FROM notice
WHERE noticeno=3;

-- 레코드 갯수
SELECT COUNT(*) as cnt FROM notice;

-- *************** FK 자식 테이블일 경우 구현 시작 ***************
-- FK 컬럼 기준 카운트, 특정 그룹에 속한 레코드 갯수 산출
-- 1번 관리자가 등록한 공지사항 갯수는?
SELECT COUNT(*) as cnt FROM notice WHERE adminno=1;

-- 1번 공지사항 카테고리의 공지사항 등록 갯수는?
SELECT COUNT(*) as cnt FROM notice WHERE noticecateno=1;

-- FK 컬럼 기준 삭제, 특정 그룹에 속한 레코드 모두 삭제
-- 1번 관리자가 등록한 공지사항 삭제
DELETE FROM notice WHERE adminno=1;

-- 1번 공지사항 카테고리의 공지사항 삭제
DELETE FROM notice WHERE noticecateno=1;

-- 부모 테이블과의 JOIN
SELECT c.noticecateno, c.name, c.cnt,
       n.noticeno, n.title, n.cnt as notice_cnt, n.rdate, n.file1saved, n.thumb1
FROM noticecate c, notice n
WHERE c.noticecateno = n.noticecateno;

-- *************** FK 자식 테이블일 경우 구현 종료 ***************

-- 검색 목록(구현 권장)
SELECT noticeno, adminno, noticecateno, title, content, cnt, passwd, word, rdate, file1, file1saved, thumb1, size1
FROM notice
WHERE adminno=1 or title='%회식%' or word='%회식%'
ORDER BY noticeno DESC;

-- 검색 + 페이징 목록(구현 권장)
-- 검색, 정렬 -> rownum -> 분할

SELECT noticeno, adminno, noticecateno, title, content, cnt, passwd, word, rdate, file1, file1saved, thumb1, size1, r
FROM(
     SELECT noticeno, adminno, noticecateno, title, content, cnt, passwd, word, rdate, file1, file1saved, thumb1, size1, rownum as r
     FROM (
          SELECT noticeno, adminno, noticecateno, title, content, cnt, passwd, word, rdate, file1, file1saved, thumb1, size1 
          FROM notice
          WHERE adminno=1 or title='%회식%' or word='%회식%'
          ORDER BY noticeno DESC
     )  
)
WHERE r >= 1 AND r <= 3;

