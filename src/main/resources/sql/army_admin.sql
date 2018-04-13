--테이블 삭제
DROP TABLE MOVIE_STILLCUT;
DROP TABLE MOVIE_TRAILER;
DROP TABLE MOVIE_INFO_DETAIL;
DROP TABLE ADMIN_MEMBER;
DROP TABLE MOVIE_REVIEW;
DROP TABLE MOVIE_INFO;
DROP SEQUENCE MOVIE_REVIEW_SEQ; 
DROP SEQUENCE MOVIE_DETAIL_SEQ; 
DROP SEQUENCE MOVIE_INFO_SEQ;
DROP SEQUENCE MOVIE_TRAILER_SEQ;
DROP SEQUENCE MOVIE_STILLCUT_SEQ;
 --시퀀스

 --영화 정보
 CREATE SEQUENCE MOVIE_INFO_SEQ;
  
 --영화 정보 디테일
 CREATE SEQUENCE MOVIE_DETAIL_SEQ;
  
 --스틸컷
 CREATE SEQUENCE MOVIE_STILLCUT_SEQ;
 
 --트레일러
 CREATE SEQUENCE MOVIE_TRAILER_SEQ;
 
 --한줄평
 CREATE SEQUENCE MOVIE_REVIEW_SEQ;


--테이블

--관리자 정보
CREATE TABLE ADMIN_MEMBER(
  ADMIN_ID  VARCHAR2(30),
  ADMIN_PW  VARCHAR2(30),
  POSITION  VARCHAR2(50)
);

--관리자 정보 입력
INSERT INTO ADMIN_MEMBER VALUES(
   'armyadmin', 'movie123admin', '관리자'
);

--영화정보
CREATE TABLE MOVIE_INFO(
  MV_INFO_SEQ   NUMBER  PRIMARY KEY,
  MV_TITLE  VARCHAR2(1000),
  MV_SUB_TITLE  VARCHAR2(2000),
  MV_PUB_DATE  VARCHAR2(50),
  MV_DIRECTOR  VARCHAR2(100),
  MV_ACTOR  VARCHAR2(1000),
  MV_USER_RATING  VARCHAR2(50),
  MV_LINK VARCHAR2(1000),
  MV_IMAGE VARCHAR2(2000)
  );
 
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '쓰리빌보드', 'Three Billboards Outside Ebbing, Missouri', '2017', '마틴 맥도나', '프란시스 맥도맨드,우디 해럴슨,샘 록웰', '8.93', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', 'imgmovie.naver.com');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '블랙 팬서 ', 'Black Panther', '2017', '마틴 맥도나', '프란시스 맥도맨드,우디 해럴슨,샘 록웰', '8.93', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', 'imgmovie.naver.com');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '맨 오브 마스크 ', 'See You Up There', '2017', '마틴 맥도나', '프란시스 맥도맨드,우디 해럴슨,샘 록웰', '8.93', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', 'imgmovie.naver.com');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '소공녀 ', 'Microhabitat', '2017', '마틴 맥도나', '프란시스 맥도맨드,우디 해럴슨,샘 록웰', '8.93', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', 'imgmovie.naver.com');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '지금 만나러 갑니다 ', 'Be With You', '2017', '마틴 맥도나', '프란시스 맥도맨드,우디 해럴슨,샘 록웰', '8.93', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', 'imgmovie.naver.com');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '레이디 버드 ', 'Lady Bird', '2017', '마틴 맥도나', '프란시스 맥도맨드,우디 해럴슨,샘 록웰', '8.93', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', 'imgmovie.naver.com');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '덕구 ', 'Stand by me', '2017', '마틴 맥도나', '프란시스 맥도맨드,우디 해럴슨,샘 록웰', '8.93', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', 'imgmovie.naver.com');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '머니백 ', 'Snatch Up', '2017', '마틴 맥도나', '프란시스 맥도맨드,우디 해럴슨,샘 록웰', '8.93', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', 'imgmovie.naver.com');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '곤지암 ', 'GONJIAM: Haunted Asylum', '2017', '마틴 맥도나', '프란시스 맥도맨드,우디 해럴슨,샘 록웰', '8.93', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', 'imgmovie.naver.com');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '바람 바람 바람 ', 'What a Man Wants', '2017', '마틴 맥도나', '프란시스 맥도맨드,우디 해럴슨,샘 록웰', '8.93', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', 'imgmovie.naver.com');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '콰이어트 플레이스 ', 'A Quiet Place', '2017', '마틴 맥도나', '프란시스 맥도맨드,우디 해럴슨,샘 록웰', '8.93', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', 'imgmovie.naver.com');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '레디 플레이어 원 ', 'Ready Player One', '2017', '마틴 맥도나', '프란시스 맥도맨드,우디 해럴슨,샘 록웰', '8.93', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', 'imgmovie.naver.com');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '그날, 바다 ', 'Intention', '2017', '마틴 맥도나', '프란시스 맥도맨드,우디 해럴슨,샘 록웰', '8.93', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', 'imgmovie.naver.com');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '어벤져스: 인피니티 워 ', 'Avengers: Infinity War', '2017', '마틴 맥도나', '프란시스 맥도맨드,우디 해럴슨,샘 록웰', '8.93', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', 'imgmovie.naver.com');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '램페이지 ', 'RAMPAGE', '2017', '마틴 맥도나', '프란시스 맥도맨드,우디 해럴슨,샘 록웰', '8.93', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', 'imgmovie.naver.com');
 
 
 --더미 데이터 입력
  
  --영화 디테일 정보
    CREATE TABLE MOVIE_INFO_DETAIL(
    MV_DETAIL_SEQ NUMBER PRIMARY KEY,
    MV_INFO_SEQ NUMBER REFERENCES MOVIE_INFO(MV_INFO_SEQ) ON DELETE CASCADE,
    MV_LINK VARCHAR2(1000),
    MV_TITLE VARCHAR2(1000),
    MV_GENRE VARCHAR2(500),
    MV_COUNTRY VARCHAR2(100),
    MV_RUNTIME VARCHAR2(100),
    MV_RELEASE_DATE VARCHAR2(100),
    MV_ACTOR VARCHAR2(1000),
    MV_DIRECTOR VARCHAR2(100),
    MV_GRADE VARCHAR2(100),
    MV_STORY VARCHAR2(4000)
  );

  --영화 사진 / 영상 아이템
  CREATE TABLE MOVIE_STILLCUT(
  MV_STILLCUT_SEQ   NUMBER,
  MV_INFO_SEQ  NUMBER  REFERENCES MOVIE_INFO(MV_INFO_SEQ) ON DELETE CASCADE,
  MV_TITLE VARCHAR2(100),
  MV_STILLCUT  VARCHAR2(1000)
  );
  
    CREATE TABLE MOVIE_TRAILER(
  MV_TRAILER_SEQ   NUMBER,
  MV_INFO_SEQ  NUMBER  REFERENCES MOVIE_INFO(MV_INFO_SEQ) ON DELETE CASCADE,
  MV_TITLE VARCHAR2(100),
  MV_TRAILER  VARCHAR2(1000)
  );
  
  
  --한줄평
  CREATE TABLE MOVIE_REVIEW(
  MV_RV_SEQ  NUMBER,
  USER_ID  VARCHAR2(100),
  MV_INFO_SEQ NUMBER REFERENCES MOVIE_INFO(MV_INFO_SEQ) ON DELETE CASCADE,
  MV_TITLE VARCHAR2(100),
  MV_RV_TITLE  VARCHAR2(1000) ,
  MV_RV_CONTENTS  VARCHAR2(4000),
  MV_RV_RATING  NUMBER
  );
  
  commit;