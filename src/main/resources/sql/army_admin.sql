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
  MV_IMAGE VARCHAR2(2000),
  MV_ISVIEW VARCHAR2(20)
  );
 
 --더미 데이터 입력
INSERT INTO MOVIE_INFO VALUES(
  	MOVIE_INFO_SEQ.NEXTVAL, '소공녀', 'Microhabitat', '2017', '전고운', '이솜,안재홍', '9.08', 
  	'http://movie.naver.com/movie/bi/mi/basic.nhn?code=159311', 
  	'http://imgmovie.naver.com/mdi/mit110/1593/159311_P35_104354.jpg', 'y'
  );
  
  INSERT INTO MOVIE_INFO VALUES(
  	MOVIE_INFO_SEQ.NEXTVAL, '레디 플레이어 원', 'Ready Player One', '2018', 
  	'스티븐 스필버그', '올리비아 쿡,벤 멘델슨,타이 쉐리던,사이먼 페그,마크 라이런스,T.J. 밀러', '8.83', 
  	'http://movie.naver.com/movie/bi/mi/basic.nhn?code=136898', 
  	'http://imgmovie.naver.com/mdi/mit110/1368/136898_P05_175007.jpg', 'y'
  );
  
    INSERT INTO MOVIE_INFO VALUES(
  	MOVIE_INFO_SEQ.NEXTVAL, '다크 나이트', 'The Dark Knight', '2008', 
  	'크리스토퍼 놀란', '크리스찬 베일,히스 레저,아론 에크하트', '9.32', 
  	'http://movie.naver.com/movie/bi/mi/basic.nhn?code=62586', 
  	'http://imgmovie.naver.com/mdi/mit110/0625/62586_P141_104552.jpg', 'y'
  );
  
    INSERT INTO MOVIE_INFO VALUES(
  	MOVIE_INFO_SEQ.NEXTVAL, '소공녀 ', 'Microhabitat', '2017', 
  	'전고운', '이솜,안재홍', '9.01', 
  	'http://movie.naver.com/movie/bi/mi/basic.nhn?code=159311', 
  	'http://imgmovie.naver.com/mdi/mit110/1593/159311_P35_104354.jpg', 'y'
  );
  
    INSERT INTO MOVIE_INFO VALUES(
  	MOVIE_INFO_SEQ.NEXTVAL, '어벤져스: 인피니티 워  ', 'Avengers: Infinity War', '2018', 
  	'안소니 루소|조 루소', '크리스 프랫,조 샐다나,브래들리 쿠퍼,빈 디젤,조슈 브롤린,엘리자베스 올슨,베네딕트 컴버배치,제레미 레너,스칼렛 요한슨,톰 홀랜드,로버트 다우니 주니어,크리스 헴스워스,크리스 에반스,폴 러드,마크 러팔로,안소니 마키,톰 히들스턴,기네스 팰트로,폴 베타니,돈 치들,카렌 길런,채드윅 보스만',
  	'9.57', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=136315', 
  	'http://imgmovie.naver.com/mdi/mit110/1363/136315_P16_142450.jpg', 'y'
  );
  
    INSERT INTO MOVIE_INFO VALUES(
  	MOVIE_INFO_SEQ.NEXTVAL, '달마야 놀자', 'Lets Play Dharma', '2001', 
  	'박철관', '박신양,정진영', '8.20',
	'http://movie.naver.com/movie/bi/mi/basic.nhn?code=31922', 
  	'http://imgmovie.naver.com/mdi/mit110/0319/C1922-00.jpg', 'y'
  );

	INSERT INTO MOVIE_INFO VALUES(
  	MOVIE_INFO_SEQ.NEXTVAL, '로건', 'Logan', '2017', '제임스 맨골드', '휴 잭맨', '9.05', 
  	'http://movie.naver.com/movie/bi/mi/basic.nhn?code=117787', 
  	'http://imgmovie.naver.com/mdi/mit110/1177/117787_P30_095926.jpg', 'y'
  );
  
  	INSERT INTO MOVIE_INFO VALUES(
  	MOVIE_INFO_SEQ.NEXTVAL, '레디 플레이어 원', 'Ready Player One', '2018', 
  	'스티븐 스필버그', '올리비아 쿡,벤 멘델슨,타이 쉐리던,사이먼 페그,마크 라이런스,T.J. 밀러', '8.83', 
  	'http://movie.naver.com/movie/bi/mi/basic.nhn?code=136898', 
  	'http://imgmovie.naver.com/mdi/mit110/1368/136898_P05_175007.jpg', 'y'
  );
  
    INSERT INTO MOVIE_INFO VALUES(
  	MOVIE_INFO_SEQ.NEXTVAL, '다크 나이트', 'The Dark Knight', '2008', 
  	'크리스토퍼 놀란', '크리스찬 베일,히스 레저,아론 에크하트', '9.32', 
  	'http://movie.naver.com/movie/bi/mi/basic.nhn?code=62586', 
  	'http://imgmovie.naver.com/mdi/mit110/0625/62586_P141_104552.jpg', 'y'
  );
  
    INSERT INTO MOVIE_INFO VALUES(
  	MOVIE_INFO_SEQ.NEXTVAL, '소공녀 ', 'Microhabitat', '2017', 
  	'전고운', '이솜,안재홍', '9.01', 
  	'http://movie.naver.com/movie/bi/mi/basic.nhn?code=159311', 
  	'http://imgmovie.naver.com/mdi/mit110/1593/159311_P35_104354.jpg', 'y'
  );
  
    INSERT INTO MOVIE_INFO VALUES(
  	MOVIE_INFO_SEQ.NEXTVAL, '어벤져스: 인피니티 워  ', 'Avengers: Infinity War', '2018', 
  	'안소니 루소|조 루소', '크리스 프랫,조 샐다나,브래들리 쿠퍼,빈 디젤,조슈 브롤린,엘리자베스 올슨,베네딕트 컴버배치,제레미 레너,스칼렛 요한슨,톰 홀랜드,로버트 다우니 주니어,크리스 헴스워스,크리스 에반스,폴 러드,마크 러팔로,안소니 마키,톰 히들스턴,기네스 팰트로,폴 베타니,돈 치들,카렌 길런,채드윅 보스만',
  	'9.57', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=136315', 
  	'http://imgmovie.naver.com/mdi/mit110/1363/136315_P16_142450.jpg', 'y'
  );
  
INSERT INTO MOVIE_INFO VALUES(
  	MOVIE_INFO_SEQ.NEXTVAL, '소공녀', 'Microhabitat', '2017', '전고운', '이솜,안재홍', '9.08', 
  	'http://movie.naver.com/movie/bi/mi/basic.nhn?code=159311', 
  	'http://imgmovie.naver.com/mdi/mit110/1593/159311_P35_104354.jpg', 'y'
  );  
  
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
  
  INSERT INTO MOVIE_STILLCUT 
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '12', '소공녀', 'images/poster/Item_SoGongNyeu.jpg');
  
  INSERT INTO MOVIE_STILLCUT 
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '12', '소공녀', 'images/poster/item_sogongnyeu3..jpg');
  INSERT INTO MOVIE_STILLCUT 
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '12', '소공녀', 'images/poster/item_sogongnyeu4.jpg');
  INSERT INTO MOVIE_STILLCUT 
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '12', '소공녀', 'images/poster/itme_sogongnyeu2.jpg');
  INSERT INTO MOVIE_STILLCUT 
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '12', '소공녀', 'images/poster/item_sogongnyeu3..jpg');
  INSERT INTO MOVIE_STILLCUT 
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '12', '소공녀', 'images/poster/item_sogongnyeu3..jpg');
  
    CREATE TABLE MOVIE_TRAILER(
  MV_TRAILER_SEQ   NUMBER,
  MV_INFO_SEQ  NUMBER  REFERENCES MOVIE_INFO(MV_INFO_SEQ) ON DELETE CASCADE,
  MV_TITLE VARCHAR2(100),
  MV_TRAILER  VARCHAR2(1000)
  );
  
   INSERT INTO MOVIE_TRAILER 
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER) VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '12', '소공녀', 'https://youtu.be/CEWrdQpENJk');
     INSERT INTO MOVIE_TRAILER 
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER) VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '12', '소공녀', 'https://youtu.be/An85JnPi-8Y');
     INSERT INTO MOVIE_TRAILER 
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER) VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '12', '소공녀', 'https://youtu.be/2tXMAbbRX9A');
     INSERT INTO MOVIE_TRAILER 
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER) VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '12', '소공녀', 'https://youtu.be/jty4gkxU_vE');
     INSERT INTO MOVIE_TRAILER 
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER) VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '12', '소공녀', 'https://youtu.be/EHmE-4Aj-Qk');
  INSERT INTO MOVIE_TRAILER 
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER) VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '12', '소공녀', 'https://youtu.be/EHmE-4Aj-Qk');
  INSERT INTO MOVIE_TRAILER 
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER) VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '12', '소공녀', 'https://youtu.be/EHmE-4Aj-Qk');
  
  
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
  
  insert into MOVIE_REVIEW
  (MV_RV_SEQ, USER_ID, MV_INFO_SEQ, MV_TITLE, MV_RV_TITLE, MV_RV_CONTENTS)
  values(
    MOVIE_REVIEW_SEQ.nextval, 'sj', '12', '소공녀', '소공녀 정말 재미있었어요. ...', '소공녀 정말 재미있었어요. 특히 이솜이 너무 예뻤어요'
  );
  
  INSERT INTO MOVIE_INFO_DETAIL 
		(MV_DETAIL_SEQ, MV_INFO_SEQ, MV_LINK, MV_TITLE, MV_GENRE, MV_COUNTRY, MV_RUNTIME,
		MV_RELEASE_DATE, MV_ACTOR, MV_DIRECTOR, MV_GRADE, MV_STORY) VALUES(
		MOVIE_DETAIL_SEQ.NEXTVAL, '12', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=159311', '소공녀', '멜로/로맨스, 드라마',
		'한국', '106분', '2018 .03.22 개봉', '이솜(미소), 안재홍(한솔)', '전고운', '15세 관람가', '하루 한 잔의 위스키와 한 모금의 담배 그리고 사랑하는 남자친구만 있다면 더 바라는 것이 없는 3년 차 프로 가사도우미 ‘미소’. 새해가 되자 집세도 오르고 담배와 위스키 가격마저 올랐지만 일당은 여전히 그대로다. 좋아하는 것들이 비싸지는 세상에서 포기한 건 단 하나, 바로 ‘집’. 집만 없을 뿐 일도 사랑도 자신만의 방식대로 살아가는 사랑스러운 현대판 소공녀 ‘미소’의 도시 하루살이가 시작된다!'
		);
  commit;