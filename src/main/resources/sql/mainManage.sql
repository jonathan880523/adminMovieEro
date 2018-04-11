-- 메인 화면 관리

-- 메인 비주얼 관리
drop SEQUENCE visual_sq;
CREATE SEQUENCE visual_sq
START WITH 1 
INCREMENT BY 1 
MAXVALUE 100000
MINVALUE 1;

drop table admin_visual;
create table admin_visual( 
	img_no number PRIMARY KEY,
	movie_title varchar2(300),
	img_url varchar2(300),
    reg_date date,
	is_add varchar2(1) DEFAULT 'n'
);

insert into admin_visual(img_no, movie_title, img_url, reg_date)
values(visual_sq.nextVal, 'test1', 'test url 1', sysdate);
insert into admin_visual(img_no, movie_title, img_url, reg_date)
values(visual_sq.nextVal, 'test2', 'test url 2', sysdate);
insert into admin_visual(img_no, movie_title, img_url, reg_date)
values(visual_sq.nextVal, 'test3', 'test url 3', sysdate);

select * from admin_visual;
-- 박스오피스 관리