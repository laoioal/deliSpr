--delivery
CREATE TABLE member(
    mno NUMBER(4)
        CONSTRAINT MEMBER_MNO_PK PRIMARY KEY,
    name VARCHAR2(20 CHAR)
        CONSTRAINT MEMBER_NAME_NN NOT NULL,
    id VARCHAR2(10 CHAR)
        CONSTRAINT MEMBER_ID_NN NOT NULL
        CONSTRAINT MEMBER_ID_UK UNIQUE,
    kakaoid VARCHAR2(50 CHAR)
        CONSTRAINT MEMBER_KAKAOID_UK UNIQUE,
    pw VARCHAR2(15 CHAR)
        CONSTRAINT MEMBER_PW_NN NOT NULL,
    mail VARCHAR2(50 CHAR)
        CONSTRAINT MEMBER_MAIL_NN NOT NULL
        CONSTRAINT MEMBER_MAIL_UK UNIQUE,
    tel VARCHAR2(13 CHAR)
        CONSTRAINT MEMBER_TEL_NN NOT NULL
        CONSTRAINT MEMBER_TEL_UK UNIQUE,
    addr VARCHAR2(60 CHAR)
        CONSTRAINT MEMBER_ADDR_NN NOT NULL,
    jdate DATE DEFAULT sysdate
        CONSTRAINT MEMBER_JDATE_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT MEMBER_ISSHOW_NN NOT NULL
        CONSTRAINT MEMBER_ISSHOW_CK CHECK(isshow IN('Y','N')),
    esti NUMBER(3, 2) DEFAULT 2.5
        CONSTRAINT MEMBER_ESTI_NN NOT NULL,
    receive VARCHAR2(20 CHAR)
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '이용현', 'YHLEE', 'YHLEE12', '12345', 'YH@githrd.com', '010-0000-0000', '서울시 영등포구 신길동'
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '둘리', 'dool', 'dool12', '12345', 'dool@githrd.com', '010-1111-1111', '서울시 종로구 사직동'
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '희동이', 'hui', 'hui12', '12345', 'hui@githrd.com', '010-2222-2222', '서울시 종로구 무악동'
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '홍길동', 'HONG', 'HONG', '12345', 'HONG@githrd.com', '010-3333-3333', '서울시 중구 소공동'
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '마이콜', 'call', 'call12', '12345', 'call@githrd.com', '010-4444-4444', '서울시 용산구 후암동'
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '제니', 'jennie', 'jennie12', '12345', 'jennie@githrd.com', '010-5555-5555', '서울시 중구 다산동'
);

INSERT INTO
    member(mno, name, id, kakaoid, pw, mail, tel, addr)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member), '안은비', 'aeb320', '320aeb', '12345', 'dksdmsql320@gmail.com', '010-3232-3232', '서울시 영등포구 신길동'
);

commit;