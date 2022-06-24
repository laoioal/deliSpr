--delivery
CREATE TABLE menucategory (
    foodtype VARCHAR2(10 CHAR)
        CONSTRAINT MENU_TYPE_PK PRIMARY KEY,
    code NUMBER(4)
        CONSTRAINT MENU_CODE_NN NOT NULL
        CONSTRAINT MENU_CODE_UK UNIQUE
);

INSERT INTO
    menucategory
VALUES(
    '돈까스·회·일식', 1001
);
INSERT INTO
    menucategory
VALUES(
    '중식', 1002
);
INSERT INTO
    menucategory
VALUES(
    '치킨', 1003
);
INSERT INTO
    menucategory
VALUES(
    '백반·죽·국수', 1004
);
INSERT INTO
    menucategory
VALUES(
    '카페·디저트', 1005
);
INSERT INTO
    menucategory
VALUES(
    '분식', 1006
);
INSERT INTO
    menucategory
VALUES(
    '찜·탕·찌개', 1007
);
INSERT INTO
    menucategory
VALUES(
    '피자', 1008
);
INSERT INTO
    menucategory
VALUES(
    '양식', 1009
);
INSERT INTO
    menucategory
VALUES(
    '고기·구이', 1010
);
INSERT INTO
    menucategory
VALUES(
    '족발·보쌈', 1011
);
INSERT INTO
    menucategory
VALUES(
    '아시안', 1012
);INSERT INTO
    menucategory
VALUES(
    '페스트푸드', 1013
);
INSERT INTO
    menucategory
VALUES(
    '도시락', 1014
);

commit;