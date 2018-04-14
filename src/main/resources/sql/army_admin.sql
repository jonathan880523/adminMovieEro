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
 (MOVIE_INFO_SEQ.NEXTVAL, '쓰리빌보드', 'Three Billboards Outside Ebbing, Missouri', '2017', '마틴 맥도나', '프란시스 맥도맨드,우디 해럴슨,샘 록웰', '8.93', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', 'http://imgmovie.naver.com/mdi/mit110/1586/158610_P05_112500.jpg');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '블랙 팬서', 'Black Panther', '2018', '라이언 쿠글러', '채드윅 보스만', '7.56', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=137326', 'http://imgmovie.naver.com/mdi/mit110/1373/137326_P09_113140.jpg');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '맨 오브 마스크', 'See You Up There', '2017', '알베르 뒤퐁텔', '알베르 뒤퐁텔,나우엘 페레즈 비스카야트', '9.37', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=163699', 'http://imgmovie.naver.com/mdi/mit110/1636/163699_P09_153151.jpg');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '소공녀 ', 'Microhabitat', '2017', '전고운', '이솜,안재홍', '9.09', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=159311', 'http://imgmovie.naver.com/mdi/mit110/1593/159311_P35_104354.jpg');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '지금 만나러 갑니다 ', 'Be With You', '2017', '이장훈', '소지섭,손예진', '8.77', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=168298', 'http://imgmovie.naver.com/mdi/mit110/1682/168298_P26_135156.jpg');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '레이디 버드 ', 'Lady Bird', '2018', '그레타 거윅', '시얼샤 로넌', '8.51', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158611', 'http://imgmovie.naver.com/mdi/mit110/1586/158611_P16_165703.jpg');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '덕구 ', 'Stand by me', '2017', '방수인', '이순재,정지훈', '9.60', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=154667', 'http://imgmovie.naver.com/mdi/mit110/1546/154667_P13_152551.jpg');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '머니백 ', 'Snatch Up', '2017', '허준형', '김무열,박희순,이경영,전광렬,임원희,오정세,김민교', '7.88', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=151241', 'http://imgmovie.naver.com/mdi/mit110/1512/151241_P60_115713.jpg');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '곤지암 ', 'GONJIAM: Haunted Asylum', '2017', '정범식', '위하준,박지현,오아연,문예원,박성훈,이승욱,유제윤', '6.86', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=172454', 'http://imgmovie.naver.com/mdi/mit110/1724/172454_P62_140358.jpg');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '바람 바람 바람 ', 'What a Man Wants', '2017', '이병헌', '이성민,신하균,송지효,이엘', '6.65', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=142739', 'http://imgmovie.naver.com/mdi/mit110/1427/142739_P33_104430.jpg');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '콰이어트 플레이스 ', 'A Quiet Place', '2018', '존 크래신스키', '존 크래신스키,에밀리 블런트,노아 주프,밀리센트 시몬스', '8.63', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=168011', 'http://imgmovie.naver.com/mdi/mit110/1680/168011_P15_154957.jpg');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '레디 플레이어 원 ', 'Ready Player One', '2018', '스티븐 스필버그', '올리비아 쿡,벤 멘델슨,타이 쉐리던,사이먼 페그,마크 라이런스,T.J. 밀러', '8.68', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=136898', 'http://imgmovie.naver.com/mdi/mit110/1368/136898_P05_175007.jpg');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '어벤져스: 인피니티 워 ', 'Avengers: Infinity War', '2018', '안소니 루소|조 루소', '크리스 프랫,조 샐다나,브래들리 쿠퍼,빈 디젤,조슈 브롤린,엘리자베스 올슨,베네딕트 컴버배치,제레미 레너,스칼렛 요한슨,톰 홀랜드,로버트 다우니 주니어,크리스 헴스워스,크리스 에반스,폴 러드,마크 러팔로,안소니 마키,톰 히들스턴,기네스 팰트로,폴 베타니,돈 치들,카렌 길런,채드윅 보스만,폼 클레멘티에프,데이브 바티스타,세바스찬 스탠', '9.58', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=136315', 'http://imgmovie.naver.com/mdi/mit110/1363/136315_P16_142450.jpg');
 INSERT INTO MOVIE_INFO
 (MV_INFO_SEQ, MV_TITLE, MV_SUB_TITLE, MV_PUB_DATE, MV_DIRECTOR, MV_ACTOR, MV_USER_RATING, MV_LINK, MV_IMAGE)
 VALUES
 (MOVIE_INFO_SEQ.NEXTVAL, '램페이지 ', 'RAMPAGE', '2018', '브래드 페이튼', '드웨인 존슨,제프리 딘 모건,말린 애커맨,나오미 해리스', '8.46', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=162249', 'http://imgmovie.naver.com/mdi/mit110/1622/162249_P12_113544.jpg');
 
 
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
  
  INSERT INTO MOVIE_INFO_DETAIL
  (MV_DETAIL_SEQ, MV_INFO_SEQ, MV_LINK, MV_TITLE, MV_GENRE, MV_COUNTRY, MV_RUNTIME, MV_RELEASE_DATE, MV_ACTOR, MV_DIRECTOR, MV_GRADE, MV_STORY)VALUES
  (MOVIE_DETAIL_SEQ.NEXTVAL, '1', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158610', '쓰리 빌보드', '코미디, 범죄, 드라마', '영국 , 미국', '115분', '2018 .03.15 개봉', '프란시스 맥도맨드(밀드레드), 우디 해럴슨(윌러비), 샘 록웰(딕슨)', '마틴 맥도나', '15세 관람가', '범인을 잡지 못한 딸의 살인 사건에 세상의 관심이 사라지자, 엄마 ‘밀드레드’(프란시스 맥도맨드)는 아무도 사용하지 않는 마을 외곽 대형 광고판에 도발적인 세 줄의 광고를 실어 메시지를 전한다. 광고가 세간의 주목을 끌며 마을의 존경 받는 경찰서장 ‘윌러비’(우디 헤럴슨)와 경찰관 ‘딕슨’은 무능한 경찰로 낙인찍히고, 조용한 마을의 평화를 바라는 이웃 주민들은 경찰의 편에 서서 그녀와 맞서기 시작하는데…');

  INSERT INTO MOVIE_INFO_DETAIL
  (MV_DETAIL_SEQ, MV_INFO_SEQ, MV_LINK, MV_TITLE, MV_GENRE, MV_COUNTRY, MV_RUNTIME, MV_RELEASE_DATE, MV_ACTOR, MV_DIRECTOR, MV_GRADE, MV_STORY)VALUES
  (MOVIE_DETAIL_SEQ.NEXTVAL, '2', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=137326', '블랙 팬서', '액션, 드라마, SF', '미국', '135분	', '2018 .02.14 개봉', '채드윅 보스만(티찰라 / 블랙 팬서)', '라이언 쿠글러', '12세 관람가', '‘시빌 워’ 이후 와칸다의 왕위를 계승한 티찰라(채드윅 보스만)는 와칸다에만 존재하는 최강 희귀 금속 ‘비브라늄’과 왕좌를 노리는 숙적들의 음모가 전세계적인 위협으로 번지자 세상을 구할 히어로 ‘블랙 팬서’로서 피할 수 없는 전쟁에 나서는데…');

    INSERT INTO MOVIE_INFO_DETAIL
  (MV_DETAIL_SEQ, MV_INFO_SEQ, MV_LINK, MV_TITLE, MV_GENRE, MV_COUNTRY, MV_RUNTIME, MV_RELEASE_DATE, MV_ACTOR, MV_DIRECTOR, MV_GRADE, MV_STORY)VALUES
  (MOVIE_DETAIL_SEQ.NEXTVAL, '3', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=163699', '맨 오브 마스크', '드라마', '프랑스', '117분', '2018 .04.12 개봉', '알베르 뒤퐁텔(알베르), 나우엘 페레즈 비스카야트(에두와르)', '알베르 뒤퐁텔', '12세 관람가', '1919년 프랑스 파리. 마스크를 절대 벗지 않는 신비로운 천재 화가와 국가의 막대한 예산이 투입된 기념비 사업의 기막힌 콜라보! 이 대담하고 발칙한 사기극의 윤곽이 점점 드러나는데...! 자, 우린 돈을 갖고 튀는 거야.');
  
    INSERT INTO MOVIE_INFO_DETAIL
  (MV_DETAIL_SEQ, MV_INFO_SEQ, MV_LINK, MV_TITLE, MV_GENRE, MV_COUNTRY, MV_RUNTIME, MV_RELEASE_DATE, MV_ACTOR, MV_DIRECTOR, MV_GRADE, MV_STORY)VALUES
  (MOVIE_DETAIL_SEQ.NEXTVAL, '4', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=159311', '소공녀', '멜로/로맨스, 드라마', '한국', '106분', '2018 .03.22 개봉', '이솜(미소), 안재홍(한솔)', '전고운', '15세 관람가', '하루 한 잔의 위스키와 한 모금의 담배 그리고 사랑하는 남자친구만 있다면 더 바라는 것이 없는 3년 차 프로 가사도우미 ‘미소’. 새해가 되자 집세도 오르고 담배와 위스키 가격마저 올랐지만 일당은 여전히 그대로다. 좋아하는 것들이 비싸지는 세상에서 포기한 건 단 하나, 바로 ‘집’. 집만 없을 뿐 일도 사랑도 자신만의 방식대로 살아가는 사랑스러운 현대판 소공녀 ‘미소’의 도시 하루살이가 시작된다!');
  
    INSERT INTO MOVIE_INFO_DETAIL
  (MV_DETAIL_SEQ, MV_INFO_SEQ, MV_LINK, MV_TITLE, MV_GENRE, MV_COUNTRY, MV_RUNTIME, MV_RELEASE_DATE, MV_ACTOR, MV_DIRECTOR, MV_GRADE, MV_STORY)VALUES
  (MOVIE_DETAIL_SEQ.NEXTVAL, '5', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=168298', '지금 만나러 갑니다', '멜로/로맨스', '한국', '131분', '2018 .03.14 개봉', '소지섭(우진), 손예진(수아)', '이장훈', '12세 관람가', '비가 오는 날 다시 돌아오겠다는 믿기 힘든 약속을 남기고 세상을 떠난 ‘수아’. 그로부터 1년 뒤 장마가 시작되는 어느 여름 날, 세상을 떠나기 전과 다름없는 모습의 ‘수아’가 나타난다. 하지만 ‘수아’는 ‘우진’이 누구인지조차도 기억하지 못한다. 난, 너와 다시 사랑에 빠졌어. 자신을 기억하지 못해도 그녀가 곁에 있다는 사실만으로 행복에 젖은 ‘우진’과 자신이 기억하지 못하는 그와의 이야기가 궁금한 ‘수아’. ‘우진’이 들려주는 첫 만남, 첫 사랑, 첫 데이트, 첫 행복의 순간을 함께 나누며 ‘수아’는 ‘우진’과 다시 사랑에 빠지는데… 기다려 주세요 지금 만나러 갑니다');
  
    INSERT INTO MOVIE_INFO_DETAIL
  (MV_DETAIL_SEQ, MV_INFO_SEQ, MV_LINK, MV_TITLE, MV_GENRE, MV_COUNTRY, MV_RUNTIME, MV_RELEASE_DATE, MV_ACTOR, MV_DIRECTOR, MV_GRADE, MV_STORY)VALUES
  (MOVIE_DETAIL_SEQ.NEXTVAL, '6', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=158611', '레이디 버드', '코미디, 드라마', '미국', '94분', '2018 .04.04 개봉', '시얼샤 로넌(크리스틴 "레이디 버드" 맥퍼슨)', '그레타 거윅', '15세 관람가', '안녕 내 이름은 "레이디 버드"라고 해 다른 이름이 있지만, 내가 나에게 이름을 지어줬지 모두가 나에게 잘 살아보라고 충고로 위장한 잔소리를 해 하지만 지금 이 모습이 내 최고의 모습이라면? 날 좀 그냥 내버려 둬!');
  
    INSERT INTO MOVIE_INFO_DETAIL
  (MV_DETAIL_SEQ, MV_INFO_SEQ, MV_LINK, MV_TITLE, MV_GENRE, MV_COUNTRY, MV_RUNTIME, MV_RELEASE_DATE, MV_ACTOR, MV_DIRECTOR, MV_GRADE, MV_STORY)VALUES
  (MOVIE_DETAIL_SEQ.NEXTVAL, '7', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=154667', '덕구', '드라마', '한국', '91분', '2018 .04.05 개봉', '이순재(덕구할배), 정지훈(덕구)', '방수인', '전체 관람가', '어린 손자와 살고 있는 일흔 살 덕구 할배는 자신에게 주어진 시간이 얼마 남지 않음을 알게 된다. 세상에 덩그러니 남겨질 두 아이들을 위해 할배는 자신을 대신할 사람을 찾아주기로 하고, 홀로 먼 길을 떠나 특별한 선물을 준비하는데..');
  
    INSERT INTO MOVIE_INFO_DETAIL
  (MV_DETAIL_SEQ, MV_INFO_SEQ, MV_LINK, MV_TITLE, MV_GENRE, MV_COUNTRY, MV_RUNTIME, MV_RELEASE_DATE, MV_ACTOR, MV_DIRECTOR, MV_GRADE, MV_STORY)VALUES
  (MOVIE_DETAIL_SEQ.NEXTVAL, '8', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=151241', '머니백', '액션, 드라마', '한국', '101분	', '2018 .04.12 개봉', '김무열(민재), 박희순(최형사), 이경영(킬러 박)', '허준형', '15세 관람가', '가진 거라고는 몸뚱이뿐인 ‘민재’(김무열)는 엄마 수술비를 위해 보증금까지 털었지만, 이마저도 ‘양아치’(김민교)에게 모두 뺏기고 만다. ‘양아치’는 사채업자 ‘백사장’(임원희)에게 뺏은 돈을 바치고, 이 돈은 고스란히 선거를 앞둔 ‘문의원’(전광렬)에게 돌아간다. 계속되는 적자 인생에 ‘백사장’은 ‘킬러’(이경영)를 고용해서 ‘문의원’을 처리할 계획을 세운다. ‘백사장’은 도박장에서 저당 잡은 ‘최형사’(박희순)의 총을 ‘킬러’에게 배달하지만, ‘택배기사’(오정세)가 실수로 ‘킬러’의 옆집 ‘민재’에게 맡기는데… 뺏고! 달리고! 쫓기는 ‘머니백’ 레이스가 시작된다!');
  
    INSERT INTO MOVIE_INFO_DETAIL
  (MV_DETAIL_SEQ, MV_INFO_SEQ, MV_LINK, MV_TITLE, MV_GENRE, MV_COUNTRY, MV_RUNTIME, MV_RELEASE_DATE, MV_ACTOR, MV_DIRECTOR, MV_GRADE, MV_STORY)VALUES
  (MOVIE_DETAIL_SEQ.NEXTVAL, '9', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=172454', '곤지암', '공포, 미스터리', '한국', '94분', '2018 .03.28 개봉', '위하준(하준), 박지현(지현), 오아연(아연)', '정범식', '15세 관람가', '1979년 환자 42명의 집단 자살과 병원장의 실종 이후, 섬뜩한 괴담으로 둘러싸인 곤지암 정신병원으로 공포체험을 떠난 7명의 멤버들 원장실, 집단 치료실, 실험실, 열리지 않는 402호… 괴담의 실체를 담아내기 위해 병원 내부를 촬영하기 시작하던 멤버들에게 상상도 못한 기이하고 공포스러운 일들이 실제로 벌어지기 시작 하는데… 가지 말라는 곳에는 반드시 이유가 있다. 소름 끼치는 ‘곤지암 정신병원’ 의 실체를 체험하라!');
  
    INSERT INTO MOVIE_INFO_DETAIL
  (MV_DETAIL_SEQ, MV_INFO_SEQ, MV_LINK, MV_TITLE, MV_GENRE, MV_COUNTRY, MV_RUNTIME, MV_RELEASE_DATE, MV_ACTOR, MV_DIRECTOR, MV_GRADE, MV_STORY)VALUES
  (MOVIE_DETAIL_SEQ.NEXTVAL, '10', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=142739', '바람 바람 바람', '코미디', '한국', '100분', '2018 .04.05 개봉', '이성민(석근), 신하균(봉수), 송지효(미영)', '이병헌', '청소년 관람불가', '"왜 사랑을 해도, 결혼을 해도 외로운 거죠?" 끝도 없이 사랑 받고 싶은 철부지 어른들이 온다! 20년 경력을 자랑하는 ‘바람’의 전설 석근(이성민)은 SNS와 사랑에 빠진 여동생 미영(송지효)의 남편 봉수(신하균)를 ‘바람’의 세계로 인도한다. 하지만 세 사람 앞에 나타난 치명적인 매력의 소유자 제니(이엘)의 등장으로 네 사람의 인생은 걷잡을 수 없이 꼬여만 가고... 갈수록 환장, 들키면 끝장 뭘해도 외로운 어른들을 위한 코미디가 온다!');
  
    INSERT INTO MOVIE_INFO_DETAIL
  (MV_DETAIL_SEQ, MV_INFO_SEQ, MV_LINK, MV_TITLE, MV_GENRE, MV_COUNTRY, MV_RUNTIME, MV_RELEASE_DATE, MV_ACTOR, MV_DIRECTOR, MV_GRADE, MV_STORY)VALUES
  (MOVIE_DETAIL_SEQ.NEXTVAL, '11', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=168011', '콰이어트 플레이스', '서스펜스, 공포', '미국', '90분', '2018 .04.12  개봉', '에밀리 블런트(에블린 애보트), 존 크래신스키(리 애보트), 노아 주프(마커스 애보트)', '존 크래신스키', '15세 관람가', '소리를 내는 순간 공격받는 극한의 상황 속에서 살아남기 위한 한 가족의 숨막히는 사투를 그린 이야기 < 생존 법칙 > 1. 어떤 소리도 내지 말 것 2. 아무 말도 하지 말 것 3. 붉은 등이 켜지면 무조건 도망갈 것');
  
    INSERT INTO MOVIE_INFO_DETAIL
  (MV_DETAIL_SEQ, MV_INFO_SEQ, MV_LINK, MV_TITLE, MV_GENRE, MV_COUNTRY, MV_RUNTIME, MV_RELEASE_DATE, MV_ACTOR, MV_DIRECTOR, MV_GRADE, MV_STORY)VALUES
  (MOVIE_DETAIL_SEQ.NEXTVAL, '12', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=136898', '레디 플레이어 원', '액션, SF, 모험', '미국', '140분', '2018 .03.28 개봉', '마크 라이런스(제임스 도노반 할리데이 / 아노락), 사이먼 페그(오르젠 모로우 / Og), 올리비아 쿡(사만다 에벨린 쿡 / 아르테미스)', '스티븐 스필버그', '12세 관람가', '2045년, 암울한 현실과 달리 가상현실 오아시스(OASIS)에서는 누구든 원하는 캐릭터로 어디든지 갈 수 있고, 뭐든지 할 수 있고 상상하는 모든 게 가능하다. 웨이드 와츠(타이 쉐리던) 역시 유일한 낙은 대부분의 사람들이 하루를 보내는 오아시스에 접속하는 것이다. 어느 날 오아시스의 창시자인 괴짜 천재 제임스 할리데이(마크 라이런스)는 자신이 가상현실 속에 숨겨둔 3개의 미션에서 우승하는 사람에게 오아시스의 소유권과 막대한 유산을 상속한다는 유언을 남기고, 그가 사랑했던 80년대 대중문화 속에 힌트가 있음을 알린다. 제임스 할리데이를 선망했던 소년 ‘웨이드 와츠’가 첫 번째 수수께끼를 푸는 데 성공하자 이를 저지하기 위해 현실에서 살인도 마다하지 않는 ‘IOI’라는 거대 기업이 뛰어든다. 모두의 꿈과 희망이 되는 오아시스를 지키기 위해서는 반드시 우승해야 한다! 그리고 우승을 위해서는 가상현실이 아닌 현실세계의 우정과 사랑의 힘이 필요하기만 한데…');
  
    INSERT INTO MOVIE_INFO_DETAIL
  (MV_DETAIL_SEQ, MV_INFO_SEQ, MV_LINK, MV_TITLE, MV_GENRE, MV_COUNTRY, MV_RUNTIME, MV_RELEASE_DATE, MV_ACTOR, MV_DIRECTOR, MV_GRADE, MV_STORY)VALUES
  (MOVIE_DETAIL_SEQ.NEXTVAL, '13', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=136315', '어벤져스: 인피니티 워', '액션, 모험, 판타지, SF', '미국', '149분', '2018 .04.25 개봉', '로버트 다우니 주니어(아이언맨 / 토니 스타크), 조슈 브롤린(타노스), 마크 러팔로(헐크 / 브루스 배너)', '조 루소', '12세 관람가', '새로운 조합을 이룬 어벤져스, 역대 최강 빌런 타노스에 맞서 세계의 운명이 걸린 인피니티 스톤을 향한 무한 대결이 펼쳐진다! 4월, 마블의 클라이맥스를 목격하라!');
  
    INSERT INTO MOVIE_INFO_DETAIL
  (MV_DETAIL_SEQ, MV_INFO_SEQ, MV_LINK, MV_TITLE, MV_GENRE, MV_COUNTRY, MV_RUNTIME, MV_RELEASE_DATE, MV_ACTOR, MV_DIRECTOR, MV_GRADE, MV_STORY)VALUES
  (MOVIE_DETAIL_SEQ.NEXTVAL, '14', 'http://movie.naver.com/movie/bi/mi/basic.nhn?code=162249', '램페이지', '액션, 모험', '미국', '107분', '2018 .04.12 개봉', '드웨인 존슨(데이비스 오코예), 제프리 딘 모건(러셀 요원), 나오미 해리스(케이트 칼드웰 의사)', '브래드 페이튼', '12세 관람가', '유인원 전문가 ‘데이비스(드웨인 존슨)’는 사람들은 멀리하지만, 어릴 때 구조해서 보살펴 온 영리한 알비노 고릴라 ‘조지’와는 특별한 감정을 공유한다. 어느 날, 유순하기만 하던 조지가 의문의 가스를 흡입하면서 엄청난 괴수로 변해 광란을 벌인다. 재벌기업이 우주에서 무단으로 감행한 ‘프로젝트 램페이지’라는 유전자 조작 실험이 잘못되면서 지구로 3개의 병원체가 추락했던 것. 조지뿐만 아니라 가스를 마신 늑대와 악어 역시 변이시키고 끝도 없이 거대해진 이들 포식자들이 도심을 파괴하며 미국 전역을 쑥대밭으로 만들어 놓는다. 데이비스는 괴수들을 상대로 전지구적인 재앙을 막고 변해버린 조지를 구하기 위한 해독제를 찾아야만 하는데…');

  --영화 사진 / 영상 아이템
  CREATE TABLE MOVIE_STILLCUT(
  MV_STILLCUT_SEQ   NUMBER,
  MV_INFO_SEQ  NUMBER  REFERENCES MOVIE_INFO(MV_INFO_SEQ) ON DELETE CASCADE,
  MV_TITLE VARCHAR2(100),
  MV_STILLCUT  VARCHAR2(1000)
  );
  
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '1', '쓰리 빌보드', 'images/poster/threeBillboardCoop.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '1', '쓰리 빌보드', 'images/poster/threeBillboardJacket.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '1', '쓰리 빌보드', 'images/poster/threeBillboardTitle.jpg');
  
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '2', '블랙 팬서', 'blackPanther.JPG');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '2', '블랙 팬서', 'images/poster/blackPanther3People.JPG');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '2', '블랙 팬서', 'images/poster/blackPantherHero.JPG');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '2', '블랙 팬서', 'images/poster/blackPantherTitle.JPG');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '2', '블랙 팬서', 'images/poster/blackPantherVilain.JPG');
  
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '3', '맨 오브 마스크', 'images/poster/manOfMask.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '3', '맨 오브 마스크', 'images/poster/manOfMask3people.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '3', '맨 오브 마스크', 'images/poster/manOfMaskOldman.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '3', '맨 오브 마스크', 'images/poster/manOfMaskWide.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '3', '맨 오브 마스크', 'images/poster/manOfMaskWoman.jpg');
  
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '4', '소공녀', 'images/poster/sogongMan.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '4', '소공녀', 'images/poster/sogongWide.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '4', '소공녀', 'images/poster/sogongWide2.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '4', '소공녀', 'images/poster/sogongWide2people.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '4', '소공녀', 'images/poster/sogongWide4cut.jpg');
  
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '5', '지금 만나러 갑니다', 'images/poster/nowWeMeetWoman.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '5', '지금 만나러 갑니다', 'images/poster/nowWeMeetTitle2.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '5', '지금 만나러 갑니다', 'images/poster/nowWeMeetTitle.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '5', '지금 만나러 갑니다', 'images/poster/nowWeMeet3people.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '5', '지금 만나러 갑니다', 'images/poster/nowWeMeet2people.jpg');
  
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '6', '레이디 버드', 'images/poster/nowWeMeetWoman.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '6', '레이디 버드', 'images/poster/nowWeMeetTitle2.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '6', '레이디 버드', 'images/poster/nowWeMeetTitle.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '6', '레이디 버드', 'images/poster/nowWeMeet3people.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '6', '레이디 버드', 'images/poster/nowWeMeet2people.jpg');
   INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '6', '레이디 버드', 'images/poster/ladyBirdMan.jpg');
  
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '7', '덕구', 'images/poster/dukoo2people.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '7', '덕구', 'images/poster/dukooActor.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '7', '덕구', 'images/poster/dukooActor2.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '7', '덕구', 'images/poster/dukooHigh.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '7', '덕구', 'images/poster/dukooTitle.jpg');
  
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '8', '머니백', 'images/poster/moneyBagActor.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '8', '머니백', 'images/poster/moneyBagActor2.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '8', '머니백', 'images/poster/moneyBagBig.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '8', '머니백', 'images/poster/moneyBagTitle.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '8', '머니백', 'images/poster/moneyBagVilain.jpg');
  
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '9', '곤지암', 'images/poster/gongiam4cut.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '9', '곤지암', 'images/poster/gongiamActor.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '9', '곤지암', 'images/poster/gongiamTitle.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '9', '곤지암', 'images/poster/gongiamTitle2.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '9', '곤지암', 'images/poster/gongiamWall.jpg');
  
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '10', '바람 바람 바람', 'images/poster/windActor.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '10', '바람 바람 바람', 'images/poster/wind4people.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '10', '바람 바람 바람', 'images/poster/wind4cut.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '10', '바람 바람 바람', 'images/poster/wind2people2.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '10', '바람 바람 바람', 'images/poster/wind2people.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '10', '바람 바람 바람', 'images/poster/windActor2.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '10', '바람 바람 바람', 'images/poster/windTitle.jpg');
  
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '11', '콰이어트 플레이스', 'images/poster/quietPlace2people.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '11', '콰이어트 플레이스', 'images/poster/quietPlaceActor.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '11', '콰이어트 플레이스', 'images/poster/quietPlaceActress.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '11', '콰이어트 플레이스', 'images/poster/quietPlaceTitle.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '11', '콰이어트 플레이스', 'images/poster/quietPlaceTitle2.jpg');
  
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '12', '레디 플레이어 원', 'images/poster/readyPlayerBig.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '12', '레디 플레이어 원', 'images/poster/readyPlayerRobot.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '12', '레디 플레이어 원', 'images/poster/readyPlayerTitle.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '12', '레디 플레이어 원', 'images/poster/readyPlayerWide.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '12', '레디 플레이어 원', 'images/poster/readyPlayerWide2.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '12', '레디 플레이어 원', 'images/poster/readyPlayerWide3.jpg');
  
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '13', '어벤져스: 인피니티 워', 'images/poster/infinityVilain.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '13', '어벤져스: 인피니티 워', 'images/poster/infinitySpiderMan.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '13', '어벤져스: 인피니티 워', 'images/poster/infinityMany2.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '13', '어벤져스: 인피니티 워', 'images/poster/infinityMany.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '13', '어벤져스: 인피니티 워', 'images/poster/infinityCaptian.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '13', '어벤져스: 인피니티 워', 'images/poster/infinity3people.jpg');
  
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '14', '램페이지', 'images/poster/rampagePoster.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '14', '램페이지', 'images/poster/rampageGori.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '14', '램페이지', 'images/poster/rampageBird.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '14', '램페이지', 'images/poster/rampage2people.jpg');
  INSERT INTO MOVIE_STILLCUT
  (MV_STILLCUT_SEQ, MV_INFO_SEQ, MV_TITLE, MV_STILLCUT) VALUES
  (MOVIE_STILLCUT_SEQ.NEXTVAL, '14', '램페이지', 'images/poster/rampage.jpg');
  
  
    CREATE TABLE MOVIE_TRAILER(
  MV_TRAILER_SEQ   NUMBER,
  MV_INFO_SEQ  NUMBER  REFERENCES MOVIE_INFO(MV_INFO_SEQ) ON DELETE CASCADE,
  MV_TITLE VARCHAR2(100),
  MV_TRAILER  VARCHAR2(1000),
  MV_DESC VARCHAR2(1000)
  );
  
  INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '1', '쓰리 빌보드', 'video/threeBillboardAnger.mp4', '화난 주인공');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '1', '쓰리 빌보드', 'video/threeBillboardMain.mp4', '메인 예고');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '1', '쓰리 빌보드', 'video/threeBillboardOfficial.mp4', '공식 예고');
  
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '2', '블랙 팬서', 'video/blackPantherBusan.mp4', '부산씬');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '2', '블랙 팬서', 'video/blackPantherMain.mp4', '메인 예고');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '2', '블랙 팬서', 'video/blackPantherTeaser.mp4', '티저 영상');
  
  INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '3', '맨 오브 마스크', 'video/manOfMaskSecret.mp4', '시크릿 영상');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '3', '맨 오브 마스크', 'video/manOfMaskMain.mp4', '메인 예고');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '3', '맨 오브 마스크', 'video/manOfMaskTeaser.mp4', '티저 영상');
  
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '4', '소공녀', 'video/sogongIntroduce.mp4', '주인공 소개');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '4', '소공녀', 'video/sogongMain.mp4', '메인 예고');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '4', '소공녀', 'video/sogongTeaser.mp4', '티저 영상');
  
  INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '5', '지금 만나러 갑니다', 'video/nowWeMeet.mp4', '공식 영상');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '5', '지금 만나러 갑니다', 'video/nowWeMeetMaking.mp4', '메이킹 필름');
  
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '6', '레이디 버드', 'video/ladyBirdMain.mp4', '메인 영상');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '6', '레이디 버드', 'video/ladyBirdPlayer.mp4', '인물 영상');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '6', '레이디 버드', 'video/ladyBirdTeaser.mp4', '티저 영상');
  
  INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '7', '덕구', 'video/dukkooMain.mp4', '메인 영상');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '7', '덕구', 'video/dukkooMakingFilm.mp4', '메이킹 필름');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '7', '덕구', 'video/dukkooNews.mp4', '뉴스 속 영화');
  
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '8', '머니백', 'video/moneyBagJob.mp4', '인물 소개');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '8', '머니백', 'video/moneyBagMain.mp4', '메인 영상');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '8', '머니백', 'video/monyBagTeaser.mp4', '티저 영상');
    
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '9', '곤지암', 'video/gongiamRealSound.mp4', '실제 관객들 소리');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '9', '곤지암', 'video/gongiamMain.mp4', '메인 영상');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '9', '곤지암', 'video/gongiamTeaser.mp4', '티저 영상');
  
      INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '10', '바람 바람 바람', 'video/windEl.mp4', '이엘 영상');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '10', '바람 바람 바람', 'video/windMain.mp4', '메인 영상');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '10', '바람 바람 바람', 'video/windTeaser.mp4', '티저 영상');
    
      INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '11', '콰이어트 플레이스', 'video/quietPlaceAmyInterview.mp4', '에이미 블런트');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '11', '콰이어트 플레이스', 'video/quietPlaceOfficial1st.mp4', '공식 영상');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '11', '콰이어트 플레이스', 'video/quietPlaceOfficial2nd.mp4', '공식 영상');
     
      INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '12', '레디 플레이어 원', 'video/readyPlayerChar.mp4', '인물 소개');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '12', '레디 플레이어 원', 'video/readyPlayerOfficial1st.mp4', '공식 영상');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '12', '레디 플레이어 원', 'video/readyPlayerOfficial2nd.mp4', '공식 영상');
       
      INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '13', '어벤져스: 인피니티 워', 'video/infinityBehindStory.mp4', '비하인드 스토리');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '13', '어벤져스: 인피니티 워', 'video/infinityMain.mp4', '메인 영상');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '13', '어벤져스: 인피니티 워', 'video/infinityTeaser.mp4', '티저 영상');
         
      INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '14', '램페이지', 'video/rampageOffcial1st.mp4', '공식 영상');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '14', '램페이지', 'video/rampageOffcial2nd.mp4', '공식 영상');
    INSERT INTO MOVIE_TRAILER
  (MV_TRAILER_SEQ, MV_INFO_SEQ, MV_TITLE, MV_TRAILER, MV_DESC)VALUES
  (MOVIE_TRAILER_SEQ.NEXTVAL, '14', '램페이지', 'video/rampageReview.mp4', '리뷰 영상');
  
  
  --한줄평
  CREATE TABLE MOVIE_REVIEW(
  MV_RV_SEQ  NUMBER,
  USER_ID  VARCHAR2(100),
  MV_INFO_SEQ NUMBER REFERENCES MOVIE_INFO(MV_INFO_SEQ) ON DELETE CASCADE,
  MV_TITLE VARCHAR2(100),
  MV_RV_TITLE  VARCHAR2(1000) ,
  MV_RV_CONTENTS  VARCHAR2(4000)
  );
  
  INSERT INTO MOVIE_REVIEW
  (MV_RV_SEQ, USER_ID, MV_INFO_SEQ, MV_TITLE, MV_RV_TITLE, MV_RV_CONTENTS)VALUES
  (MOVIE_REVIEW_SEQ.NEXTVAL, 'sj', '1', '쓰리 빌보드', '너무 재미 있었어요, 주인공의 분노를 느낄 수가 ....', '너무 재미 있었어요, 주인공의 분노를 느낄 수가 있었습니다.');
  
  commit;