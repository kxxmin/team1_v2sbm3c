DROP TABLE attachfile;
DROP TABLE contents CASCADE CONSTRAINTS;
DROP TABLE contents;

CREATE TABLE contents(
        contentsno                            NUMBER(10)         NOT NULL         PRIMARY KEY,
        adminno                              NUMBER(10)     NOT NULL , -- FK
        cateno                                NUMBER(10)         NOT NULL , -- FK
        title                                 VARCHAR2(100)         NOT NULL,
        content                               CLOB                  NOT NULL,
        recom                                 NUMBER(7)         DEFAULT 0         NOT NULL,
        cnt                                   NUMBER(7)         DEFAULT 0         NOT NULL,
        replycnt                              NUMBER(7)         DEFAULT 0         NOT NULL,
        passwd                                VARCHAR2(15)         NOT NULL,
        word                                  VARCHAR2(100)         NULL ,
        rdate                                 DATE               NOT NULL,
        file1                                   VARCHAR(100)          NULL,  -- 원본 파일명 image
        file1saved                            VARCHAR(100)          NULL,  -- 저장된 파일명, image
        thumb1                              VARCHAR(100)          NULL,   -- preview image
        size1                                 NUMBER(10)      DEFAULT 0 NULL,  -- 파일 사이즈
        price                                 NUMBER(10)      DEFAULT 0 NULL,  
        dc                                    NUMBER(10)      DEFAULT 0 NULL,  
        saleprice                            NUMBER(10)      DEFAULT 0 NULL,  
        point                                 NUMBER(10)      DEFAULT 0 NULL,  
        salecnt                               NUMBER(10)      DEFAULT 0 NULL,
        map                                   VARCHAR2(1000)            NULL,
        youtube                               VARCHAR2(1000)            NULL,
  FOREIGN KEY (adminno) REFERENCES admin (adminno),
  FOREIGN KEY (cateno) REFERENCES cate (cateno)
);

COMMENT ON TABLE contents is '컨텐츠 - 상품';
COMMENT ON COLUMN contents.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN contents.adminno is '관리자 번호';
COMMENT ON COLUMN contents.cateno is '카테고리 번호';
COMMENT ON COLUMN contents.title is '제목';
COMMENT ON COLUMN contents.content is '내용';
COMMENT ON COLUMN contents.recom is '추천수';
COMMENT ON COLUMN contents.cnt is '조회수';
COMMENT ON COLUMN contents.replycnt is '댓글수';
COMMENT ON COLUMN contents.passwd is '패스워드';
COMMENT ON COLUMN contents.word is '검색어';
COMMENT ON COLUMN contents.rdate is '등록일';
COMMENT ON COLUMN contents.file1 is '메인 이미지';
COMMENT ON COLUMN contents.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN contents.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN contents.size1 is '메인 이미지 크기';
COMMENT ON COLUMN contents.price is '정가';
COMMENT ON COLUMN contents.dc is '할인률';
COMMENT ON COLUMN contents.saleprice is '판매가';
COMMENT ON COLUMN contents.point is '포인트';
COMMENT ON COLUMN contents.salecnt is '수량';
COMMENT ON COLUMN contents.map is '지도';
COMMENT ON COLUMN contents.youtube is 'Youtube 영상';

DROP SEQUENCE contents_seq;

CREATE SEQUENCE contents_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- CATE, ADMIN 테이블에 레코드가 없는 경우, adminno: 1, cateno: 1값을 이용할 수가 없음. 등록(X)
-- ORA-02291: integrity constraint (AI8.SYS_C007066) violated - parent key not found
--INSERT INTO contents(contentsno, adminno, cateno, title, content, recom, cnt, replycnt, passwd, word, rdate,
--                              file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt)
--VALUES(contents_seq.nextval, 1, 1, '인터스텔라', '앤헤서웨이 주연', 0, 0, 0, '123', '우주', sysdate,
--            'space.jpg', 'space_1.jpg', 'space_t.jpg', 1000, 2000, 10, 1800, 100, 500);

-- 등록 화면 유형 1: 커뮤니티(공지사항, 게시판, 자료실, 갤러리,  Q/A...)글 등록
INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
                                 file1, file1saved, thumb1, size1, rdate)
VALUES(contents_seq.nextval, 1, 1, 'AI', '주드로 주연', '123', '로봇,인공지능', 
            'space.jpg', 'space_1.jpg', 'space_t.jpg', 1000, sysdate);

-- 유형 1 전체 목록
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, passwd, word, rdate,
           file1, file1saved, thumb1, size1
FROM contents
ORDER BY contentsno ASC;

-- 등록 화면 유형 2 관련 입력 컬럼: 정가, 할인률, 판매가, 포인트, 재고수량
-- 쇼핑몰의 상품 정보 등록
INSERT INTO contents(contentsno, adminno, cateno, title, content, recom, cnt, replycnt, passwd, word, rdate,
                              file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt)
VALUES(contents_seq.nextval, 1, 1, '마션', '멧데이먼 주연 화성 탈출', 0, 0, 0, '123', '우주', sysdate,
            'space.jpg', 'space_1.jpg', 'space_t.jpg', 1000, 2000, 10, 1800, 100, 500);
            
INSERT INTO contents(contentsno, adminno, cateno, title, content, recom, cnt, replycnt, passwd, word, rdate,
                              file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt)
VALUES(contents_seq.nextval, 1, 1, 'AI', '주드로', 0, 0, 0, '123', '로봇,인공지능', sysdate,
            'space.jpg', 'space_1.jpg', 'space_t.jpg', 1000, 2000, 10, 1800, 100, 500);
COMMIT;

-- 유형 2 전체 목록
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, passwd, word, rdate,
           file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt, map, youtube
FROM contents
ORDER BY contentsno ASC;

-- 모든 레코드 삭제
DELETE FROM contents;
commit;

-- 삭제
DELETE FROM contents
WHERE contentsno = 25;
commit;

DELETE FROM contents
WHERE cateno=12 AND contentsno <= 41;

commit;


-- ----------------------------------------------------------------------------------------------------
-- 검색, cateno별 검색 목록
-- ----------------------------------------------------------------------------------------------------
-- 모든글
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, word, rdate,
       file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt, map, youtube
FROM contents
ORDER BY contentsno ASC;

-- 카테고리별 목록
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, word, rdate,
       file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt, map, youtube
FROM contents
WHERE cateno=2
ORDER BY contentsno ASC;

-- 1) 검색
-- ① cateno별 검색 목록
-- word 컬럼의 존재 이유: 검색 정확도를 높이기 위하여 중요 단어를 명시
-- 글에 'swiss'라는 단어만 등장하면 한글로 '스위스'는 검색 안됨.
-- 이런 문제를 방지하기위해 'swiss,스위스,스의스,수의스,유럽' 검색어가 들어간 word 컬럼을 추가함.
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, word, rdate,
           file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt, map, youtube
FROM contents
WHERE cateno=2 AND word LIKE '%부대찌게%'
ORDER BY contentsno DESC;

-- title, content, word column search
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, word, rdate,
           file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt, map, youtube
FROM contents
WHERE cateno=2 AND (title LIKE '%부대찌게%' OR content LIKE '%부대찌게%' OR word LIKE '%부대찌게%')
ORDER BY contentsno DESC;

-- ② 검색 레코드 갯수
-- 전체 레코드 갯수, 집계 함수
SELECT COUNT(*)
FROM contents
WHERE cateno=2;

  COUNT(*)  <- 컬럼명
----------
         5
         
SELECT COUNT(*) as cnt -- 함수 사용시는 컬럼 별명을 선언하는 것을 권장
FROM contents
WHERE cateno=2;

       CNT <- 컬럼명
----------
         5

-- cateno 별 검색된 레코드 갯수
SELECT COUNT(*) as cnt
FROM contents
WHERE cateno=2 AND word LIKE '%부대찌게%';

SELECT COUNT(*) as cnt
FROM contents
WHERE cateno=2 AND (title LIKE '%부대찌게%' OR content LIKE '%부대찌게%' OR word LIKE '%부대찌게%');

-- SUBSTR(컬럼명, 시작 index(1부터 시작), 길이), 부분 문자열 추출
SELECT contentsno, SUBSTR(title, 1, 4)
FROM contents
WHERE cateno=2 AND (content LIKE '%부대%');

-- 대소문자를 구분하여 검색
SELECT contentsno, title, word
FROM contents
WHERE cateno=2 AND (word LIKE '%FOOD%');

SELECT contentsno, title, word
FROM contents
WHERE cateno=2 AND (word LIKE '%food%'); -- 대소문자 구분으로 검색 안됨.

SELECT contentsno, title, word
FROM contents
WHERE cateno=2 AND (LOWER(word) LIKE '%food%'); -- 대소문자를 일치 시켜서 검색

SELECT contentsno, title, word
FROM contents
WHERE cateno=2 AND (UPPER(word) LIKE '%' || UPPER('FOOD') || '%'); -- 대소문자를 일치 시켜서 검색

SELECT contentsno, title, word
FROM contents
WHERE cateno=2 AND (LOWER(word) LIKE '%' || LOWER('Food') || '%'); -- 대소문자를 일치 시켜서 검색

SELECT contentsno || '. ' || title || ' 태그: ' || word as title -- 컬럼의 결합, ||
FROM contents
WHERE cateno=2 AND (LOWER(word) LIKE '%' || LOWER('Food') || '%'); -- 대소문자를 일치 시켜서 검색


SELECT UPPER('한글') FROM dual; -- dual: 오라클에서 SQL 형식을 맞추기위한 시스템 테이블

-- ----------------------------------------------------------------------------------------------------
-- cate + contents INNER JOIN
-- ----------------------------------------------------------------------------------------------------
-- 모든글
SELECT c.name,
       t.contentsno, t.adminno, t.cateno, t.title, t.content, t.recom, t.cnt, t.replycnt, t.word, t.rdate,
       t.file1, t.file1saved, t.thumb1, t.size1, t.price, t.dc, t.saleprice, t.point, t.salecnt, t.map, t.youtube
FROM cate c, contents t
WHERE c.cateno = t.cateno
ORDER BY t.contentsno DESC;

NAME                           CONTENTSNO    ADMINNO     CATENO TITLE                                                                                                                                                                                                                                                                                                        CONTENT                                                                               RECOM        CNT   REPLYCNT WORD                                                                                                                                                                                                                                                                                                         RDATE               FILE1                                                                                                FILE1SAVED                                                                                           THUMB1                                                                                                    SIZE1      PRICE         DC  SALEPRICE      POINT    SALECNT MAP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      YOUTUBE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
------------------------------ ---------- ---------- ---------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -------------------------------------------------------------------------------- ---------- ---------- ---------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ------------------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ---------- ---------- ---------- ---------- ---------- ---------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
부대찌게                                4          1          2 부대찌게                                                                                                                                                                                                                                                                                                     가을 단풍보며 짜장면 먹기                                                                 0          0          0 월터,벤 스틸러,크리스튼위그,휴먼,도전                                                                                                                                                                                                                                                                        2022-09-15 05:15:39 budae01.jpg                                                                                          budae01_1.jpg                                                                                        budae01_1_t.jpg                                                                                          233874       6000          5       5700        300       9999                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
부대찌게                                5          1          2 오늘 저녁은 부대찌게                                                                                                                                                                                                                                                                                         가을 단풍보며 짜장면 먹기                                                                 0          0          0 월터,벤 스틸러,크리스튼위그,휴먼,도전                                                                                                                                                                                                                                                                        2022-09-15 05:16:47 budae02.jpg                                                                                          budae02_1.jpg                                                                                        budae02_1_t.jpg                                                                                          119832       6000          5       5700        300       9999                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
부대찌게                                6          1          2 나는 외식이 좋아                                                                                                                                                                                                                                                                                             가을 단풍보며 짜장면 먹기                                                                 0          0          0 부대찌게                                                                                                                                                                                                                                                                                                     2022-09-15 05:17:33 budae03.jpg                                                                                          budae03_1.jpg                                                                                        budae03_1_t.jpg                                                                                          178896       6000          5       5700        300       9999                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
부대찌게                                7          1          2 라면                                                                                                                                                                                                                                                                                                         가을 단풍보며 짜장면 먹기                                                                 0          0          0 월터,벤 스틸러,크리스튼위그,휴먼,도전                                                                                                                                                                                                                                                                        2022-09-15 05:21:48 food24.jpg                                                                                           food24.jpg                                                                                           food24_t.jpg                                                                                             397483       6000          5       5700        300       9999                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  



-- ----------------------------------------------------------------------------------------------------
-- 검색 + 페이징 + 메인 이미지, 정렬 -> rownum -> 분할
-- ----------------------------------------------------------------------------------------------------
-- step 1
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, rdate,
           file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt, map, youtube
FROM contents
WHERE cateno=1 AND (title LIKE '%단풍%' OR content LIKE '%단풍%' OR word LIKE '%단풍%')
ORDER BY contentsno DESC;

-- step 2
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, rdate,
           file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt, map, youtube, rownum as r
FROM (
          SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, rdate,
                     file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt, map, youtube
          FROM contents
          WHERE cateno=1 AND (title LIKE '%단풍%' OR content LIKE '%단풍%' OR word LIKE '%단풍%')
          ORDER BY contentsno DESC
);

-- step 3, 1 page
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, rdate,
           file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt, map, youtube, r
FROM (
           SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, rdate,
                      file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt, map, youtube, rownum as r
           FROM (
                     SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, rdate,
                                file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt, map, youtube
                     FROM contents
                     WHERE cateno=1 AND (title LIKE '%단풍%' OR content LIKE '%단풍%' OR word LIKE '%단풍%')
                     ORDER BY contentsno DESC
           )          
)
WHERE r >= 1 AND r <= 3;

-- step 3, 2 page
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, rdate,
           file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt, map, youtube, r
FROM (
           SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, rdate,
                      file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt, map, youtube, rownum as r
           FROM (
                     SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, rdate,
                                file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt, map, youtube
                     FROM contents
                     WHERE cateno=1 AND (title LIKE '%단풍%' OR content LIKE '%단풍%' OR word LIKE '%단풍%')
                     ORDER BY contentsno DESC
           )          
)
WHERE r >= 4 AND r <= 6;

-- ----------------------------------------------------------------------------
-- 조회
-- ----------------------------------------------------------------------------
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, passwd, word, rdate,
           file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt, map, youtube
FROM contents
WHERE contentsno = 1;

-- ----------------------------------------------------------------------------
-- 다음 지도, MAP, 먼저 레코드가 등록되어 있어야함.
-- map                                   VARCHAR2(1000)         NULL ,
-- ----------------------------------------------------------------------------
-- MAP 등록/수정
UPDATE contents SET map='카페산 지도 스크립트' WHERE contentsno=1;

-- MAP 삭제
UPDATE contents SET map='' WHERE contentsno=1;

commit;

-- ----------------------------------------------------------------------------
-- Youtube, 먼저 레코드가 등록되어 있어야함.
-- youtube                                   VARCHAR2(1000)         NULL ,
-- ----------------------------------------------------------------------------
-- youtube 등록/수정
UPDATE contents SET youtube='Youtube 스크립트' WHERE contentsno=1;

-- youtube 삭제
UPDATE contents SET youtube='' WHERE contentsno=1;

commit;

-- ----------------------------------------------------------------------------
-- 글 수정
-- ----------------------------------------------------------------------------
-- 텍스트 수정: 예외 컬럼: 추천수, 조회수, 댓글 수
UPDATE contents
SET title='기차를 타고', content='계획없이 여행 출발',  word='나,기차,생각', 
    price=10000, dc=5, saleprice=9500, point=500, salecnt=100
WHERE contentsno = 22;

commit;

-- ERROR, SQL 오류: ORA-00904: "계획없이 '여행' 출발": invalid identifier
UPDATE contents
SET title='기차를 타고', content="계획없이 '여행' 출발",  word='나,기차,생각', 
      price=10000, dc=5, saleprice=9500, point=500, salecnt=100
WHERE contentsno = 22;

-- ERROR, SQL 오류: ORA-00933: SQL command not properly ended
UPDATE contents
SET title='기차를 타고', content='계획없이 \'여행\' 출발',  word='나,기차,생각', 
      price=10000, dc=5, saleprice=9500, point=500, salecnt=100
WHERE contentsno = 22;

-- SUCCESS
UPDATE contents
SET title='가을 만항재', content='태백의 ''가을'' 여행',  word='나,기차,생각', 
    price=10000, dc=5, saleprice=9500, point=500, salecnt=100
WHERE contentsno = 22;

commit;

-- SUCCESS
UPDATE contents
SET title='미시령의 가을', content='드라이브시 "미시령 옛길" 이용',  word='나,기차,생각', 
    price=10000, dc=5, saleprice=9500, point=500, salecnt=100
WHERE contentsno = 22;

commit;

-- ----------------------------------------------------------------------------
-- 파일 수정
-- ----------------------------------------------------------------------------
-- 파일 수정
UPDATE contents
SET file1='train.jpg', file1saved='train.jpg', thumb1='train_t.jpg', size1=5000
WHERE contentsno = 1;

commit;


-- 삭제
DELETE FROM contents
WHERE contentsno = 15;

commit;

SELECT * FROM contents;

-- 추천
UPDATE contents
SET recom = recom + 1
WHERE contentsno = 1;

-- 특정 카테고리에 속한 레코드 갯수 산출
SELECT COUNT(*) as cnt 
FROM contents 
WHERE cateno=1;

-- 특정 관리자에 속한 레코드 갯수 산출
SELECT COUNT(*) as cnt 
FROM contents 
WHERE adminno=1;

-- 특정 그룹에 속한 레코드 모두 삭제
DELETE FROM contents
WHERE cateno=1;

-- 특정 관리자에 속한 레코드 모두 삭제
DELETE FROM contents
WHERE adminno=1;

-- 다수의 카테고리에 속한 레코드 갯수 산출: IN
SELECT COUNT(*) as cnt
FROM contents
WHERE cateno IN(1,2,3);

-- 다수의 카테고리에 속한 레코드 모두 삭제: IN
SELECT contentsno, adminno, cateno, title
FROM contents
WHERE cateno IN(1,2,3);

CONTENTSNO    ADMINNO     CATENO TITLE                                                                                                                                                                                                                                                                                                       
---------- ---------- ---------- ------------------------
         3             1                   1           인터스텔라                                                                                                                                                                                                                                                                                                  
         4             1                   2           드라마                                                                                                                                                                                                                                                                                                      
         5             1                   3           컨저링                                                                                                                                                                                                                                                                                                      
         6             1                   1           마션       
         
SELECT contentsno, adminno, cateno, title
FROM contents
WHERE cateno IN('1','2','3');

CONTENTSNO    ADMINNO     CATENO TITLE                                                                                                                                                                                                                                                                                                       
---------- ---------- ---------- ------------------------
         3             1                   1           인터스텔라                                                                                                                                                                                                                                                                                                  
         4             1                   2           드라마                                                                                                                                                                                                                                                                                                      
         5             1                   3           컨저링                                                                                                                                                                                                                                                                                                      
         6             1                   1           마션       
         
----------------------------------------------
-- 추천 시스템 관련
----------------------------------------------
INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(246, 1, 1, '코트 (1994)', 'Hoop Dreams (1994)', '123', '로봇,인공지능', 
'246.PNG', '246.PNG', '246.PNG', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(318, 1, 1, 'Shawshank Redemption, The (1994)', 'Shawshank Redemption, The (1994)', '123', '로봇,인공지능', 
'318.jpg', '318.jpg', '318.jpg', 1000, sysdate);

SET DEFINE OFF

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(720, 1, 1, 'Wallace & Gromit: The Best of Aardman Animation (1996)', 'Wallace & Gromit: The Best of Aardman Animation (1996)', '123', '로봇,인공지능', 
'720.jpg', '720.jpg', '720.jpg', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(741, 1, 1, 'Ghost in the Shell (Kôkaku kidôtai) (1995)', 'Ghost in the Shell (Kôkaku kidôtai) (1995)', '123', '로봇,인공지능', 
'741.jpg', '741.jpg', '741.jpg', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(750, 1, 1, 'Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb (1964)', 'Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb (1964)', '123', '로봇,인공지능', 
'750.jpg', '750.jpg', '750.jpg', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(260, 1, 1, 'Star Wars: Episode IV - A New Hope (1977)', 'Star Wars: Episode IV - A New Hope (1977)', '123', '로봇,인공지능', 
'260.jpg', '260.jpg', '260.jpg', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(858, 1, 1, 'Godfather, The (1972)', 'Godfather, The (1972)', '123', '로봇,인공지능', 
'858.jpg', '858.jpg', '858.jpg', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(1221, 1, 1, 'Godfather: Part II, The (1974)', 'Godfather: Part II, The (1974)', '123', '로봇,인공지능', 
'1221.jpg', '1221.jpg', '1221.jpg', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(475, 1, 1, 'In the Name of the Father (1993)', 'In the Name of the Father (1993)', '123', '로봇,인공지능', 
'475.jpg', '475.jpg', '475.jpg', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(1237, 1, 1, 'Seventh Seal, The (Sjunde inseglet, Det) (1957)', 'Seventh Seal, The (Sjunde inseglet, Det) (1957)', '123', '로봇,인공지능', 
'1237.jpg', '1237.jpg', '1237.jpg', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(3451, 1, 1, 'Guess Who''s Coming to Dinner (1967)', 'Guess Who''s Coming to Dinner (1967)', '123', '로봇,인공지능', 
'3451.jpg', '3451.jpg', '3451.jpg', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(4993, 1, 1, 'Lord of the Rings: The Fellowship of the Ring, The (2001)', 'Lord of the Rings: The Fellowship of the Ring, The (2001)', '123', '로봇,인공지능', 
'4993.jpg', '4993.jpg', '4993.jpg', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(48516, 1, 1, 'Departed, The (2006)', 'Departed, The (2006)', '123', '로봇,인공지능', 
'48516.jpg', '48516.jpg', '48516.jpg', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(1196, 1, 1, 'Star Wars: Episode V - The Empire Strikes Back (1980)', 'Star Wars: Episode V - The Empire Strikes Back (1980)', '123', '로봇,인공지능', 
'1196.jpg', '1196.jpg', '1196.jpg', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(1233, 1, 1, 'Boot, Das (Boat, The) (1981)', 'Boot, Das (Boat, The) (1981)', '123', '로봇,인공지능', 
'1233.jpg', '1233.jpg', '1233.jpg', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(3972, 1, 1, 'Boot, Das (Boat, The) (1981)', 'Boot, Das (Boat, The) (1981)', '123', '로봇,인공지능', 
'3972.jpg', '3972.jpg', '3972.jpg', 1000, sysdate);

-- 유형 1 전체 목록
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1
FROM contents
ORDER BY contentsno ASC;

commit;

-- 추천 상품 목록 읽기
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1
FROM contents
WHERE contentsno IN (246, 318, 720, 741, 750)
ORDER BY contentsno ASC;

------------------------------------
-- 추천시스템 종료
------------------------------------

------------------------------------
-- 관심분야 추천 받기 상의
------------------------------------
INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(1, 1, 1, '수아레 워셔블 하찌 니트', '수아레 워셔블 하찌 니트', '1234', 'knit', 
'1.png', '1.png', '1.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(2, 1, 1, '테이크이지 램스울 크루넥 오버니트 블랙', '테이크이지 램스울 크루넥 오버니트(블랙)', '123', 'knit', 
'2.png', '2.png', '2.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(3, 1, 1, '엘무드 화란 세미오버 니트 블랙', '엘무드 화란 세미오버 니트 블랙', '1234', 'knit', 
'3.png', '3.png', '3.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(4, 1, 1, '트릴리온 워셔블 하프 집업 카라넥 하찌 니트 CURRENT NAVY', '트릴리온 워셔블 하프 집업 카라넥 하찌 니트 CURRENT NAVY', '1234', 'knit', 
'4.png', '4.png', '4.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(5, 1, 1, '드로우핏 모크넥 니트 티셔츠', '드로우핏 모크넥 니트 티셔츠', '1234', 'knit', 
'5.png', '5.png', '5.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(6, 1, 1, '쿠어 탑필 울 라운드 니트 블랙', '쿠어 탑필 울 라운드 니트블랙', '1234', 'knit', 
'6.png', '6.png', '6.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(7, 1, 1, '블론드나인 크루넥 리브 니트 스웨터_모카', '블론드나인 크루넥 리브 니트 스웨터_모카', '1234', 'knit', 
'7.png', '7.png', '7.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(8, 1, 1, '스파오 반집업 스웨터', '스파오 반집업 스웨터', '1234', 'knit', 
'8.png', '8.png', '8.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(9, 1, 1, '수아레 하프 터틀넥 슬리브 니트 세트', '수아레 하프 터틀넥 슬리브 니트 세트', '1234', 'knit', 
'9.png', '9.png', '9.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(10, 1, 1, '메종미네드 MIXED BOUCLE KNIT LONG SLEEVE BLACK', '메종미네드 MIXED BOUCLE KNIT LONG SLEEVE BLACK', '1234', 'knit', 
'10.png', '10.png', '10.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(61, 1, 1, '라퍼지스토어 시티보이 빅오버 옥스포드 셔츠_Royal Blue', '라퍼지스토어 시티보이 빅오버 옥스포드 셔츠_Royal Blue', '1234', 'shirt', 
'61.png', '61.png', '61.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(62, 1, 1, '베이식 옥스포드 셔츠', '베이식 옥스포드 셔츠', '1234', 'shirt', 
'62.png', '62.png', '62.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(63, 1, 1, '아노블리어 루즈핏 오픈카라 텐셀 린넨 셔츠', '아노블리어 루즈핏 오픈카라 텐셀 린넨 셔츠', '1234', 'shirt', 
'63.png', '63.png', '63.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(64, 1, 1, '어반드레스 UNISEX FLEX CHECK SHIRT BLUE', '어반드레스 UNISEX FLEX CHECK SHIRT BLUE', '1234', 'shirt', 
'64.png', '64.png', '64.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(65, 1, 1, '필루미네이트 옵티멀 베이직 셔츠-화이트', '필루미네이트 옵티멀 베이직 셔츠-화이트', '1234', 'shirt', 
'65.png', '65.png', '65.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(66, 1, 1, '테이크이지 솔리드 옥스포드 오버셔츠', '테이크이지 솔리드 옥스포드 오버셔츠', '1234', 'shirt', 
'66.png', '66.png', '66.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(67, 1, 1, '파르티멘토 오버사이즈 스톤 워싱 데님 셔츠 블루', '파르티멘토 오버사이즈 스톤 워싱 데님 셔츠 블루', '1234', 'shirt', 
'67.png', '67.png', '67.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(68, 1, 1, '토피 오버핏 옥스퍼드 셔츠', '토피 오버핏 옥스퍼드 셔츠', '1234', 'shirt', 
'68.png', '68.png', '68.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(69, 1, 1, '폴로랄프로렌 커스텀핏 옥스포드 셔츠', '폴로랄프로렌 커스텀핏 옥스포드 셔츠', '1234', 'shirt', 
'69.png', '69.png', '69.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(70, 1, 1, '토마스모어 TC5-SH08 프렌치 스트라이프 셔츠', '토마스모어 TC5-SH08 프렌치 스트라이프 셔츠', '1234', 'shirt', 
'70.png', '70.png', '70.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(71, 1, 1, '리 빅 트위치 로고 티셔츠 화이트', '리 빅 트위치 로고 티셔츠 화이트', '1234', 'short', 
'71.png', '71.png', '71.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(72, 1, 1, '예일 (23SS) 2 TONE ARCH TEE WHITE', '예일 (23SS) 2 TONE ARCH TEE WHITE', '1234', 'short', 
'72.png', '72.png', '72.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(73, 1, 1, '트래블 미시간 울버린 피그먼트 반팔티 블랙차콜', '트래블 미시간 울버린 피그먼트 반팔티 블랙차콜', '1234', 'short', 
'73.png', '73.png', '73.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(74, 1, 1, '커버낫 어센틱 로고 티셔츠 화이트', '커버낫 어센틱 로고 티셔츠 화이트', '1234', 'short', 
'74.png', '74.png', '74.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(75, 1, 1, '코드그라피 [쿨코튼] CGP 아치 로고 티셔츠', '코드그라피 [쿨코튼] CGP 아치 로고 티셔츠', '1234', 'short', 
'75.png', '75.png', '75.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(76, 1, 1, '이벳필드 EBFD 베츠 반팔 티셔츠 블루', '이벳필드 EBFD 베츠 반팔 티셔츠 블루', '1234', 'short', 
'76.png', '76.png', '76.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(77, 1, 1, '예일 (23SS) UNIVERSITY DAN TEE', '예일 (23SS) UNIVERSITY DAN TEE', '1234', 'short', 
'77.png', '77.png', '77.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(78, 1, 1, '와릿이즌 플로리 로고 반팔 티셔츠 화이트', '와릿이즌 플로리 로고 반팔 티셔츠 화이트', '1234', 'short', 
'78.png', '78.png', '78.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(79, 1, 1, '챔피온 T425 티셔츠', '챔피온 T425 티셔츠', '1234', 'short', 
'79.png', '79.png', '79.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(80, 1, 1, '엠엠엘지 19MG HF-T (BLACK)', '엠엠엘지 19MG HF-T (BLACK)', '1234', 'short', 
'80.png', '80.png', '80.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(81, 1, 1, '예일 (23SS) 2 TONE ARCH HOODIE GRAY', '예일 (23SS) 2 TONE ARCH HOODIE GRAY', '1234', 'hood', 
'81.png', '81.png', '81.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(82, 1, 1, '토피 에센셜 후드 스웻 셔츠 MELANGE GREY', '토피 에센셜 후드 스웻 셔츠 MELANGE GREY', '1234', 'hood', 
'82.png', '82.png', '82.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(83, 1, 1, '리 빅 트위치 루즈핏 후드 네이비', '리 빅 트위치 루즈핏 후드 네이비', '1234', 'hood', 
'83.png', '83.png', '83.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(84, 1, 1, '엠엠엘지 19MG HOOD', '엠엠엘지 19MG HOOD', '1234', 'hood', 
'84.png', '84.png', '84.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(85, 1, 1, '코드그라피 CGP 아치 로고 트레이닝 셋업_네이비', '코드그라피 CGP 아치 로고 트레이닝 셋업_네이비', '1234', 'hood', 
'85.png', '85.png', '85.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(86, 1, 1, '디스이즈네버댓 Arch-Logo Hoodie Heather Grey', '디스이즈네버댓 Arch-Logo Hoodie Heather Grey', '1234', 'hood', 
'86.png', '86.png', '86.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(87, 1, 1, '마하그리드 COLLEGE LOGO HOODIE BLACK', '마하그리드 COLLEGE LOGO HOODIE BLACK', '1234', 'hood', 
'87.png', '87.png', '87.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(88, 1, 1, '이벳필드 베츠 어센틱 후드 그레이', '이벳필드 베츠 어센틱 후드 그레이', '1234', 'hood', 
'88.png', '88.png', '88.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(89, 1, 1, '리트리버클럽 RETRIEVER FRIENDS HOODIE', '리트리버클럽 RETRIEVER FRIENDS HOODIE', '1234', 'hood', 
'89.png', '89.png', '89.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(90, 1, 1, '제멋 하비스트 오버핏 기모 후드 블랙', '제멋 하비스트 오버핏 기모 후드 블랙', '1234', 'hood', 
'90.png', '90.png', '90.png', 1000, sysdate);

commit
------------------------------------
-- 관심분야 추천 받기 상의 끝
------------------------------------

------------------------------------
-- 관심분야 추천 받기 하의
------------------------------------

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(11, 1, 2, '토피 와이드 데님 팬츠', '토피 와이드 데님 팬츠', '1234', 'pants', 
'11.png', '11.png', '11.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(12, 1, 2, '86로드 BLACK NORMAL CHIP / CROP TAPERED', '86로드 BLACK NORMAL CHIP / CROP TAPERED', '1234', 'pants', 
'12.png', '12.png', '12.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(13, 1, 2, '트릴리온 바이오스톤 워싱 와이드 데님 팬츠', '트릴리온 바이오스톤 워싱 와이드 데님 팬츠', '1234', 'pants', 
'13.png', '13.png', '13.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(14, 1, 2, '무신사 스탠다드 스트레이트 데님 팬츠', '무신사 스탠다드 스트레이트 데님 팬츠', '1234', 'pants', 
'14.png', '14.png', '14.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(15, 1, 2, '오너  062 테이퍼드 핏 내츄럴크림 진', '오너  062 테이퍼드 핏 내츄럴크림 진', '1234', 'pants', 
'15.png', '15.png', '15.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(16, 1, 2, '브랜디드 1820 BLACK STANDARD4 JEANS', '브랜디드 1820 BLACK STANDARD4 JEANS', '1234', 'pants', 
'16.png', '16.png', '16.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(17, 1, 2, '플랙 스티즈 B31 인디고 로우', '플랙 스티즈 B31 인디고 로우', '1234', 'pants', 
'17.png', '17.png', '17.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(18, 1, 2, '페이탈리즘 #0237 trabus paint jeans', '페이탈리즘 #0237 trabus paint jeans', '1234', 'pants', 
'18.png', '18.png', '18.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(19, 1, 2, '모드나인 Teenager Cowboy - MOD1w', '모드나인 Teenager Cowboy - MOD1w', '1234', 'pants', 
'19.png', '19.png', '19.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(20, 1, 2, '밀리언코르 [9307] MC 유니섹스 와이드 데님', '밀리언코르 [9307] MC 유니섹스 와이드 데님', '1234', 'pants', 
'20.png', '20.png', '20.png', 1000, sysdate);

------------------------------------
-- 관심분야 추천 받기 하의 끝
------------------------------------

------------------------------------
-- 관심분야 추천 받기 신발 시작
------------------------------------
INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(31, 1, 4, '로맨틱무브 베이스먼트 더비 R21M042', '로맨틱무브 베이스먼트 더비 R21M042', '1234', 'shoes', 
'31.png', '31.png', '31.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(32, 1, 4, '닥터마틴 1461 3홀 모노 블랙 14345001', '닥터마틴 1461 3홀 모노 블랙 14345001', '1234', 'shoes', 
'32.png', '32.png', '32.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(33, 1, 4, '무신사 스탠다드 세미 드레스 페니 로퍼', '무신사 스탠다드 세미 드레스 페니 로퍼', '1234', 'shoes', 
'33.png', '33.png', '33.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(34, 1, 4, '커스텀에이드 4cm 스웨이드 페니로퍼 피어슨', '커스텀에이드 4cm 스웨이드 페니로퍼 피어슨', '1234', 'shoes', 
'34.png', '34.png', '34.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(35, 1, 4, '컨버스 척 70 클래식 블랙', '컨버스 척 70 클래식 블랙', '1234', 'shoes', 
'35.png', '35.png', '35.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(36, 1, 4, '반스  올드스쿨 36 DX', '반스  올드스쿨 36 DX', '1234', 'shoes', 
'36.png', '36.png', '36.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(37, 1, 4, '슈펜 Seku-shi(세쿠시) 첼시 부츠', '슈펜 Seku-shi(세쿠시) 첼시 부츠', '1234', 'shoes', 
'37.png', '37.png', '37.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(38, 1, 4, '팀버랜드 남성 팀버랜드 6인치 프리미엄 부츠', '팀버랜드 남성 팀버랜드 6인치 프리미엄 부츠', '1234', 'shoes', 
'38.png', '38.png', '38.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(39, 1, 4, '우포스  OORIGINAL BLACK', '우포스  OORIGINAL BLACK', '1234', 'shoes', 
'39.png', '39.png', '39.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(40, 1, 4, '23.65 폴카1 패딩 방한 슬리퍼 블랙', '23.65 폴카1 패딩 방한 슬리퍼 블랙', '1234', 'shoes', 
'40.png', '40.png', '40.png', 1000, sysdate);

------------------------------------
-- 관심분야 추천 받기 신발 끝
------------------------------------
------------------------------------
-- 관심분야 추천 받기 가방 시작
------------------------------------
INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(41, 1, 5, '커버낫 어센틱 로고 백팩 27L 블랙', '커버낫 어센틱 로고 백팩 27L 블랙', '1234', 'bag', 
'41.png', '41.png', '41.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(42, 1, 5, '노스페이스 NM2DN51A_빅샷', '노스페이스 NM2DN51A_빅샷', '1234', 'bag', 
'42.png', '42.png', '42.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(43, 1, 5, '하 아카이브 아크 블랙 메신저백', '하 아카이브 아크 블랙 메신저백', '1234', 'bag', 
'43.png', '43.png', '43.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(44, 1, 5, '그레이버 화이트 플라워 자수 크로스 메신저백_블랙', '그레이버 화이트 플라워 자수 크로스 메신저백_블랙', '1234', 'bag', 
'44.png', '44.png', '44.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(45, 1, 5, '도프제이슨 카우하이드 토트백', '도프제이슨 카우하이드 토트백', '1234', 'bag', 
'45.png', '45.png', '45.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(46, 1, 5, '레더리 스퀘어 토트백', '레더리 스퀘어 토트백', '1234', 'bag', 
'46.png', '46.png', '46.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(47, 1, 5, '리 빅 트위치 로고 에코백 블랙', '리 빅 트위치 로고 에코백 블랙', '1234', 'bag', 
'47.png', '47.png', '47.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(48, 1, 5, '캉골 Eco Friendly Bag Juno 0011 DK.Navy', '캉골 Eco Friendly Bag Juno 0011 DK.Navy', '1234', 'bag', 
'48.png', '48.png', '48.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(49, 1, 5, '퀄백 커렌트 브리프케이스 510', '퀄백 커렌트 브리프케이스 510', '1234', 'bag', 
'49.png', '49.png', '49.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(50, 1, 5, '스위치 CITY BOYS BRIEFCASE 002 Black', '스위치 CITY BOYS BRIEFCASE 002 Black', '1234', 'bag', 
'50.png', '50.png', '50.png', 1000, sysdate);
------------------------------------
-- 관심분야 추천 받기 가방 끝
------------------------------------
------------------------------------
-- 관심분야 추천 받기 모자
------------------------------------

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(51, 1, 3, '밀로 홀리데이 시그니처 볼 캡', '밀로 홀리데이 시그니처 볼 캡', '1234', 'headwear', 
'51.png', '51.png', '51.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(52, 1, 3, '엠엘비 루키 언스트럭쳐 볼캡 NY', '엠엘비 루키 언스트럭쳐 볼캡 NY', '1234', 'headwear', 
'52.png', '52.png', '52.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(53, 1, 3, '우알롱 Signature Logo ball cap - NAVY', '우알롱 Signature Logo ball cap - NAVY', '1234', 'headwear', 
'53.png', '53.png', '53.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(54, 1, 3, '리 스몰 트위치로고 코튼 커브 볼캡 베이지', '리 스몰 트위치로고 코튼 커브 볼캡 베이지', '1234', 'headwear', 
'54.png', '54.png', '54.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(55, 1, 3, '반스 코어 베이직 비니 - 블랙', '반스 코어 베이직 비니 - 블랙', '1234', 'headwear', 
'55.png', '55.png', '55.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(56, 1, 3, '엠엘비 뉴 젤리 비니 LA', '엠엘비 뉴 젤리 비니 LA', '1234', 'headwear', 
'56.png', '56.png', '56.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(57, 1, 3, '리플레이컨테이너 RC newsboy cap', '리플레이컨테이너 RC newsboy cap', '1234', 'headwear', 
'57.png', '57.png', '57.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(58, 1, 3, '밀리어네어햇 Rugged fabric newsboy cap', '밀리어네어햇 Rugged fabric newsboy cap', '1234', 'headwear', 
'58.png', '58.png', '58.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(59, 1, 3, '루오에스팩 오버핏 버킷햇', '루오에스팩 오버핏 버킷햇', '1234', 'headwear', 
'59.png', '59.png', '59.png', 1000, sysdate);

INSERT INTO contents(contentsno, adminno, cateno, title, content, passwd, word,
file1, file1saved, thumb1, size1, rdate)
VALUES(60, 1, 3, '아디다스 아디컬러 버킷햇', '아디다스 아디컬러 버킷햇', '1234', 'headwear', 
'60.png', '60.png', '60.png', 1000, sysdate);

------------------------------------
-- 관심분야 추천 받기 모자 끝
------------------------------------

commit;



