/**********************************/
/* Table Name: 상품후기 */
/**********************************/
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE review;

CREATE TABLE review(
		reviewno NUMERIC(10) NOT NULL PRIMARY KEY,
		title VARCHAR(300) NOT NULL,
		reviewcontent VARCHAR(2000) NOT NULL,
		contentsno NUMERIC(10) NOT NULL,
		memberno NUMERIC(10) NOT NULL,
		likes VARCHAR(10) NOT NULL,
        likescnt NUMERIC(10) NOT NULL,
		commentcnt NUMERIC(10) NOT NULL,
		commentno NUMERIC(10) NOT NULL,
		word VARCHAR(300) NOT NULL,
		rdate DATE NOT NULL,
		file1 VARCHAR(100) NOT NULL,
		size1 NUMERIC(10) NOT NULL,
  FOREIGN KEY (contentsno) REFERENCES contents (contentsno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE review is '상품후기';
COMMENT ON COLUMN review.reviewno is '상품후기번호';
COMMENT ON COLUMN review.title is '상품후기제목';
COMMENT ON COLUMN review.reviewcontent is '상품후기내용';
COMMENT ON COLUMN review.contentsno is '상품번호';
COMMENT ON COLUMN review.memberno is '회원번호';
COMMENT ON COLUMN review.likes is '좋아요';
COMMENT ON COLUMN review.likescnt is '좋아요수';
COMMENT ON COLUMN review.commentcnt is '댓글수';
COMMENT ON COLUMN review.commentno is '댓글번호';
COMMENT ON COLUMN review.word is '검색어';
COMMENT ON COLUMN review.rdate is '등록일';
COMMENT ON COLUMN review.file1 is '메인이미지';
COMMENT ON COLUMN review.size1 is '메인이미지크기';

DROP SEQUENCE review_seq;

CREATE SEQUENCE review_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  

-- CREATE
INSERT INTO review(reviewno, title, reviewcontent, contentsno, memberno, likescnt, commentcnt, 
                    commentno, rdate, file1, size1)
VALUES (review_seq.nextval, '니트후기', '따뜻합니다.', 1, 1, 10, 1, 1, sysdate, 'kneet.jpg', 1000);

commit;  

-- SELECT 조회
SELECT reviewNO, TITLE, reviewCONTENT, PRODUCTNO, MEMBERNO, LIKENO, COMMENTCNT, 
                    COMMENTNO, RDATE, FILE1, SIZE1
FROM review
WHERE reviewNO = 1;

-- UPDATE
-- 최초 등록 날짜 유지
UPDATE review
SET TITLE='니트후기', reviewCONTENT='색감이 별로네요'
WHERE reviewNO=1;

commit;

-- DELETE
DELETE FROM review
WHERE reviewno=2;

commit;

-- 모든 레코드 삭제
DELETE FROM review;
commit;























