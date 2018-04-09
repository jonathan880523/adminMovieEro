-- 메인 화면 관리

-- 메인 비주얼 관리
drop SEQUENCE visual_sq
CREATE SEQUENCE visual_sq
START WITH 1 
INCREMENT BY 1 
MAXVALUE 100000
MINVALUE 1;

drop table admin_visual 
create table admin_visual( 
	seq_num PRIMARY KEY,
	movie_title varchar2(300),
	img_url varchar2(300),
	is_add varchar2(1)
)

-- 박스오피스 관리