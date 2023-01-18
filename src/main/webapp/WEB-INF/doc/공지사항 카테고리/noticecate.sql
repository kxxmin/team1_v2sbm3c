/**********************************/
/* Table Name: 공지사항 카테고리 */
/**********************************/
DROP TABLE NOTICECATE CASCADE CONSTRAINTS;
CREATE TABLE NOTICECATE(
		NOTICECATENO              	NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NAME                        VARCHAR2(30)		 NOT NULL,
		CNT                         NUMBER(7)		 NOT NULL,
		RDATE                       DATE		 NOT NULL,
		UDATE                       DATE		 NULL ,
		SEQNO                       NUMBER(5)		 DEFAULT 0		 NOT NULL,
		VISIBLE                     CHAR(1)		 DEFAULT 'N'		 NOT NULL
);

COMMENT ON TABLE NOTICECATE is '공지사항 카테고리';
COMMENT ON COLUMN NOTICECATE.NOTICECATENO is '공지사항 카테고리번호';
COMMENT ON COLUMN NOTICECATE.NAME is '카테고리 이름';
COMMENT ON COLUMN NOTICECATE.CNT is '관련 자료수';
COMMENT ON COLUMN NOTICECATE.RDATE is '등록일';
COMMENT ON COLUMN NOTICECATE.UDATE is '수정일';
COMMENT ON COLUMN NOTICECATE.SEQNO is '출력 순서';
COMMENT ON COLUMN NOTICECATE.VISIBLE is '출력모드';

DROP SEQUENCE NOTICECATE_SEQ;
CREATE SEQUENCE NOTICECATE_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999       -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지


-- 등록: 1건 이상
INSERT INTO noticecate(noticecateno, name, cnt, rdate, udate, seqno, visible)
VALUES (noticecate_seq.nextval, '관리자', 0, sysdate, sysdate, 1, 'Y');

INSERT INTO noticecate(noticecateno, name, cnt, rdate, udate, seqno, visible)
VALUES (noticecate_seq.nextval, '회원', 0, sysdate, sysdate, 2, 'Y');

INSERT INTO noticecate(noticecateno, name, cnt, rdate, udate, seqno, visible)
VALUES (noticecate_seq.nextval, '전체', 0, sysdate, sysdate, 3, 'Y');

commit;

-- 전체 목록
SELECT noticecateno, name, cnt, rdate, udate, seqno, visible
FROM noticecate
ORDER BY noticecateno ASC;

NOTICECATENO NAME                                  CNT RDATE               UDATE                    SEQNO V
------------ ------------------------------ ---------- ------------------- ------------------- ---------- -
           1 관리자                                  0 2022-11-14 12:38:01 2022-11-14 12:38:01          1 Y
           2 회원                                    0 2022-11-14 12:38:01 2022-11-14 12:38:01          2 Y
           3 전체                                    0 2022-11-14 12:38:01 2022-11-14 12:38:01          3 Y

-- 조회
SELECT noticecateno, name, cnt, rdate, udate, seqno, visible
FROM noticecate
WHERE noticecateno=1;

NOTICECATENO NAME                                  CNT RDATE               UDATE                    SEQNO V
------------ ------------------------------ ---------- ------------------- ------------------- ---------- -
           1 개발팀                                  0 2022-11-15 12:38:01 2022-11-16 12:38:01          1 N

-- 수정
UPDATE noticecate
SET name='개발팀', RDATE='2022-11-15 12:38:01', UDATE='2022-11-16 12:38:01', visible='N'
WHERE noticecateno=1;

-- 삭제
DELETE FROM noticecate
WHERE noticecateno=3;

-- 레코드 갯수
SELECT COUNT(*) as cnt FROM noticecate;

-- FK 컬럼 기준 카운트, 특정 그룹에 속한 레코드 갯수 산출

-- FK 컬럼 기준 삭제, 특정 그룹에 속한 레코드 모두 삭제

-- 검색 목록(구현 권장)
SELECT noticecateno, name, cnt, rdate, udate, seqno, visible
FROM noticecate
WHERE name LIKE '%회원%'
ORDER BY noticecateno ASC;

NOTICECATENO NAME                                  CNT RDATE               UDATE                    SEQNO V
------------ ------------------------------ ---------- ------------------- ------------------- ---------- -
           2 회원                                    0 2022-11-14 12:38:01 2022-11-14 12:38:01          2 Y

-- 검색 + 페이징 목록(구현 권장)
-- 검색, 정렬 -> rownum -> 분할

SELECT noticecateno, name, cnt, rdate, udate, seqno, visible, r
FROM(
     SELECT noticecateno, name, cnt, rdate, udate, seqno, visible, rownum as r
     FROM (
          SELECT noticecateno, name, cnt, rdate, udate, seqno, visible 
          FROM noticecate
          WHERE name LIKE '%회원%'
          ORDER BY noticecateno ASC
     )  
)
WHERE r >= 1 AND r <= 3;

NOTICECATENO NAME                                  CNT RDATE               UDATE                    SEQNO V          R
------------ ------------------------------ ---------- ------------------- ------------------- ---------- - ----------
           2 회원                                    0 2022-11-14 12:38:01 2022-11-14 12:38:01          2 Y          1

commit;


