CREATE TABLE FAQ
(NO NUMBER CONSTRAINT NO_FAQ_PK PRIMARY KEY,
ID VARCHAR2(20 char) CONSTRAINT ID_FAQ_NN NOT NULL,
PW VARCHAR2(20 char) CONSTRAINT PW_FAQ_NN NOT NULL,
TITLE VARCHAR2(50 CHAR) CONSTRAINT TITLE_FAQ_NN NOT NULL,
CONTENT VARCHAR2(1000 CHAR) CONSTRAINT CONTENT_FAQ_NN NOT NULL,
WDATE DATE DEFAULT SYSDATE);

CREATE SEQUENCE FAQ_SEQ
START WITH 1
NOMAXVALUE
NOCYCLE;


Insert into FAQ (NO,ID,PW,TITLE,CONTENT,WDATE) values (FAQ_SEQ.NEXTVAL,'admin1','1111','배달 장소 선택 방법','배달 장소 선택 방법에 대해서 안내드립니다.<br> 메뉴>내위치 메뉴에서 정확한 위치정보를 입력 후 하단 카테고리를 선택바랍니다. <br>감사합니다.',to_date('22/07/18','RR/MM/DD'));
Insert into FAQ (NO,ID,PW,TITLE,CONTENT,WDATE) values (FAQ_SEQ.NEXTVAL,'admin1','1111','회원가입 하는 방법','회원가입 방법에 대해서 안내드립니다. <br>먼저 회원가입 페이지 접속>회원가입을 해주시면 됩니다.<br> 필히 현재 사는 주거지에 대한 정확한 정보를 기입 바랍니다.<br> 감사합니다.',to_date('22/07/17','RR/MM/DD'));
Insert into FAQ (NO,ID,PW,TITLE,CONTENT,WDATE) values (FAQ_SEQ.NEXTVAL,'admin1','1111','접속 오류시 방법','안녕하세요 접속오류시 방법에 대해서 설명드립니다.<br> 당사 cs팀에 연락(02-000-0000) 후 원격서비스를 신청하십시오. <br> 감사합니다. ',to_date('22/07/18','RR/MM/DD'));
