--delivery
CREATE TABLE largearea(
    city VARCHAR2(10 CHAR)
        CONSTRAINT LARGEAREA_LCITY_NN NOT NULL,
    code NUMBER(8)
        CONSTRAINT LARGEAREA_CODE_PK PRIMARY KEY
);

CREATE TABLE middlearea(
    city VARCHAR2(10 CHAR)
        CONSTRAINT MIDDLEAREA_CITY_NN NOT NULL,
    lcode NUMBER(8)
        CONSTRAINT MIDDLEAREA_LCODE_NN NOT NULL
        CONSTRAINT MIDDLEAREA_LCODE_FK REFERENCES largearea(code),
    code NUMBER(8)
       CONSTRAINT MIDDLEAREA_CODE_PK PRIMARY KEY
);

CREATE TABLE smallarea(
    city VARCHAR2(16 CHAR)
        CONSTRAINT SMALLAREA_CITY_NN NOT NULL,
    lcode NUMBER(8)
        CONSTRAINT SMALLAREA_LCODE_NN NOT NULL
        CONSTRAINT SMALLAREA_LCODE_FK REFERENCES largearea(code),
    mcode NUMBER(8)
        CONSTRAINT SMALLAREA_MCODE_NN NOT NULL
        CONSTRAINT SMALLAREA_MCODE_FK REFERENCES middlearea(code),
    code NUMBER(8)
        CONSTRAINT SMALLAREA_CODE_PK PRIMARY KEY
);

INSERT INTO
    largearea
VALUES(
    '서울특별시', 1
);

INSERT INTO
    largearea
VALUES(
    '경기도', 10
);

INSERT INTO
    largearea
VALUES(
    '강원도', 20 
);

INSERT INTO
    largearea
VALUES(
    '충청북도', 30
);


INSERT INTO
    largearea
VALUES(
    '충청남도', 40
);

INSERT INTO
    largearea
VALUES(
    '경상남도', 50
);

INSERT INTO
    largearea
VALUES(
    '경상북도', 60
);

INSERT INTO
    largearea
VALUES(
    '전라북도', 70
);

INSERT INTO
    largearea
VALUES(
    '전라남도', 80
);

INSERT INTO
    largearea
VALUES(
    '제주도', 90
);

INSERT INTO
    middlearea
VALUES(
    '종로구', 1, 1 
);
INSERT INTO
    middlearea
VALUES(
    '중구', 1, 2
);
INSERT INTO
    middlearea
VALUES(
    '용산구', 1, 3
);
INSERT INTO
    middlearea
VALUES(
    '성동구', 1, 4
);
INSERT INTO
    middlearea
VALUES(
    '광진구', 1, 5
);
INSERT INTO
    middlearea
VALUES(
    '동대문구', 1, 6
);
INSERT INTO
    middlearea
VALUES(
    '중랑구', 1, 7
);
INSERT INTO
    middlearea
VALUES(
    '성북구', 1, 8
);
INSERT INTO
    middlearea
VALUES(
    '강북구', 1, 9
);
INSERT INTO
    middlearea
VALUES(
    '도봉구', 1, 10 
);
INSERT INTO
    middlearea
VALUES(
    '노원구', 1, 11 
);
INSERT INTO
    middlearea
VALUES(
    '은평구', 1, 12
);
INSERT INTO
    middlearea
VALUES(
    '서대문구', 1, 13
);
INSERT INTO
    middlearea
VALUES(
    '마포구', 1, 14
);
INSERT INTO
    middlearea
VALUES(
    '양천구', 1, 15
);
INSERT INTO
    middlearea
VALUES(
    '강서구', 1, 16
);
INSERT INTO
    middlearea
VALUES(
    '구로구', 1, 17
);
INSERT INTO
    middlearea
VALUES(
    '금천구', 1, 18
);
INSERT INTO
    middlearea
VALUES(
    '영등포구', 1, 19
);
INSERT INTO
    middlearea
VALUES(
    '동작구', 1, 20
);
INSERT INTO
    middlearea
VALUES(
    '관악구', 1, 21
);
INSERT INTO
    middlearea
VALUES(
    '서초구', 1, 22
);
INSERT INTO
    middlearea
VALUES(
    '강남구', 1, 23
);
INSERT INTO
    middlearea
VALUES(
    '강동구', 1, 24
);
INSERT INTO
    middlearea
VALUES(
    '송파구', 1, 25
);

INSERT INTO
    middlearea
VALUES(
    '오산시', 10, 100
);

INSERT INTO
    middlearea
VALUES(
    '처인구', 10, 101
);

INSERT INTO
    middlearea
VALUES(
    '춘천시', 20, 400
);

INSERT INTO
    middlearea
VALUES(
    '충주시', 30, 700
);

INSERT INTO
    middlearea
VALUES(
    '서북구', 40, 1000
);

INSERT INTO
    smallarea
VALUES(
    '청운효자동', 1, 1, 1
);
INSERT INTO
    smallarea
VALUES(
    '사직동', 1, 1, 2
);
INSERT INTO
    smallarea
VALUES(
    '삼청동', 1, 1, 3
);
INSERT INTO
    smallarea
VALUES(
    '부암동', 1, 1, 4
);
INSERT INTO
    smallarea
VALUES(
    '평창동', 1, 1, 5
);
INSERT INTO
    smallarea
VALUES(
    '무악동', 1, 1, 6
);
INSERT INTO
    smallarea
VALUES(
    '교남동', 1, 1, 7
);
INSERT INTO
    smallarea
VALUES(
    '가회동', 1, 1, 8
);
INSERT INTO
    smallarea
VALUES(
    '종로 1, 2, 3, 4 가동', 1, 1, 9
);
INSERT INTO
    smallarea
VALUES(
    '종로 5, 6 가동', 1, 1, 10
);
INSERT INTO
    smallarea
VALUES(
    '이화동', 1, 1, 11
);
INSERT INTO
    smallarea
VALUES(
    '혜화동', 1, 1, 12
);
INSERT INTO
    smallarea
VALUES(
    '창신제1동', 1, 1, 13
);
INSERT INTO
    smallarea
VALUES(
    '창신제2동', 1, 1, 14
);
INSERT INTO
    smallarea
VALUES(
    '창신제3동', 1, 1, 15
);
INSERT INTO
    smallarea
VALUES(
    '숭인제1동', 1, 1, 16
);
INSERT INTO
    smallarea
VALUES(
    '숭인제2동', 1, 1, 17
);



INSERT INTO
    smallarea
VALUES(
    '소공동', 1, 2, 20
);
INSERT INTO
    smallarea
VALUES(
    '회현동', 1, 2, 21
);
INSERT INTO
    smallarea
VALUES(
    '명동', 1, 2, 22
);
INSERT INTO
    smallarea
VALUES(
    '필동', 1, 2, 23
);
INSERT INTO
    smallarea
VALUES(
    '장충동', 1, 2, 24
);
INSERT INTO
    smallarea
VALUES(
    '광희동', 1, 2, 25
);
INSERT INTO
    smallarea
VALUES(
    '을지동', 1, 2, 26
);
INSERT INTO
    smallarea
VALUES(
    '신당동', 1, 2, 27
);
INSERT INTO
    smallarea
VALUES(
    '다산동', 1, 2, 28
);
INSERT INTO
    smallarea
VALUES(
    '약수동', 1, 2, 29
);
INSERT INTO
    smallarea
VALUES(
    '청구동', 1, 2, 30
);
INSERT INTO
    smallarea
VALUES(
    '신당제5동', 1, 2, 31
);
INSERT INTO
    smallarea
VALUES(
    '동화동', 1, 2, 32
);
INSERT INTO
    smallarea
VALUES(
    '황학동', 1, 2, 33
);
INSERT INTO
    smallarea
VALUES(
    '중림동', 1, 2, 34
);



INSERT INTO
    smallarea
VALUES(
    '후암동', 1, 3, 40
);
INSERT INTO
    smallarea
VALUES(
    '용산2가동', 1, 3, 41
);
INSERT INTO
    smallarea
VALUES(
    '남영동', 1, 3, 42
);
INSERT INTO
    smallarea
VALUES(
    '청파동', 1, 3, 43
);
INSERT INTO
    smallarea
VALUES(
    '원효로제1동', 1, 3, 44
);
INSERT INTO
    smallarea
VALUES(
    '원효로제2동', 1, 3, 45
);
INSERT INTO
    smallarea
VALUES(
    '효창동', 1, 3, 46
);
INSERT INTO
    smallarea
VALUES(
    '용문동', 1, 3, 47
);
INSERT INTO
    smallarea
VALUES(
    '한강로동', 1, 3, 48
);
INSERT INTO
    smallarea
VALUES(
    '이촌제1동', 1, 3, 49
);
INSERT INTO
    smallarea
VALUES(
    '이촌제2동', 1, 3, 50
);
INSERT INTO
    smallarea
VALUES(
    '이태원제1동', 1, 3, 51
);
INSERT INTO
    smallarea
VALUES(
    '이태원제2동', 1, 3, 52
);
INSERT INTO
    smallarea
VALUES(
    '한남동', 1, 3, 53
);
INSERT INTO
    smallarea
VALUES(
    '서빙고동', 1, 3, 54
);
INSERT INTO
    smallarea
VALUES(
    '보광동', 1, 3, 55
);

INSERT INTO
    smallarea
VALUES(
    '중앙동', 10, 100, 500
);

INSERT INTO
    smallarea
VALUES(
    '중앙동', 10, 101, 1000
);

commit;