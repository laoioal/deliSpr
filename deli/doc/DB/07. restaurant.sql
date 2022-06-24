--delivery
CREATE TABLE restaurant(
    restno NUMBER(6)
        CONSTRAINT RS_NO_PK PRIMARY KEY,
    rname VARCHAR2(20 CHAR)
        CONSTRAINT RS_NAME_NN NOT NULL,
    cname NUMBER(4)
        CONSTRAINT RS_CTG_FK REFERENCES menucategory(code)
        CONSTRAINT RS_CTG_NN NOT NULL,
    addr VARCHAR2(60 CHAR)
        CONSTRAINT RS_ADDR_NN NOT NULL,
    tel VARCHAR2(13 CHAR)
        CONSTRAINT RS_TEL_UK UNIQUE
        CONSTRAINT RS_TEL_NN NOT NULL,
    rotime VARCHAR2(20CHAR)
        CONSTRAINT RS_ROTIME_NN NOT NULL,
    rctime VARCHAR2(20CHAR)
        CONSTRAINT RS_RCTIME_NN NOT NULL,
    esti NUMBER(2, 1) DEFAULT 0
        CONSTRAINT RS_ESTI_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT RS_SHOW_CK CHECK (isshow IN('Y','N'))
        CONSTRAINT RS_SHOW_NN NOT NULL,
    delpay NUMBER(6) DEFAULT 0
        CONSTRAINT RS_DEL_NN NOT NULL,
    minprice NUMBER(6) DEFAULT 0
        CONSTRAINT RS_MINP_NN NOT NULL,
    mcode
        CONSTRAINT RS_MCODE_FK REFERENCES middlearea(code)
        CONSTRAINT RS_MCODE_NN NOT NULL
);

INSERT INTO
    restaurant(restno, rname, cname, addr, tel, rotime, rctime, mcode)
VALUES(
    (SELECT NVL(MAX(restno) +1, 1) FROM restaurant),
    'a중국집', 1002, '서울특별시 관악구 남부순환로 1820', '02-6020-0052', 
    '10:00','21:00' ,21
);

INSERT INTO
    restaurant(restno, rname, cname, addr, tel, rotime, rctime, mcode)
VALUES(
    (SELECT NVL(MAX(restno) +1, 1) FROM restaurant),
    'b중국집', 1002, '서울특별시 관악구 남부순환로 1000', '02-1111-2222', 
    '10:00','21:30' ,21
);

INSERT INTO
    restaurant(restno, rname, cname, addr, tel, rotime, rctime, mcode)
VALUES(
    (SELECT NVL(MAX(restno) +1, 1) FROM restaurant),
    '안래홍', 1002, '서울특별시 종로구 종로7길 43', '02-739-8013', 
    '11:00','22:00' , 1
);

INSERT INTO
    restaurant(restno, rname, cname, addr, tel, rotime, rctime, mcode)
VALUES(
    (SELECT NVL(MAX(restno) +1, 1) FROM restaurant),
    '서호장', 1002, '서울특별시 종로구 관수동 수표로 91-1', '02-2265-5329', 
    '11:00','21:30' ,1
);

commit;