CREATE SEQUENCE rental_movie_sq
START WITH 1 
INCREMENT BY 1 
MAXVALUE 100000
MINVALUE 0;

drop SEQUENCE rental_movie_sq

create table rental_movie( 
rental_service_info VARCHAR2(500), 
rental_service_position varchar2(300),
rental_service_price varchar2(300), 
rental_service_title varchar2(100), 
rental_service_no number PRIMARY KEY
) 

drop table rental_movie 