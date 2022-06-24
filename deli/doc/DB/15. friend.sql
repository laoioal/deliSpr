CREATE TABLE friend(
    fno NUMBER(4)
        CONSTRAINT FRIEND_FNO_PK PRIMARY KEY,
    myno NUMBER(4)
        CONSTRAINT FRIEND_MYNO_NN NOT NULL
        CONSTRAINT FRIEND_MYNO_FK REFERENCES member(mno),
    frino NUMBER(4)
        CONSTRAINT FRIEND_FNO_NN NOT NULL
        CONSTRAINT FRIEND_FNO_FK REFERENCES member(mno),
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT FRIEND_ISSHOW_CK CHECK(isshow IN('Y','N'))
        CONSTRAINT FRIEND_ISSHOW_NN NOT NULL,
    fdate DATE  DEFAULT sysdate
        CONSTRAINT FRIEND_FDATE_NN NOT NULL,
    ddate DATE,
    agree CHAR(1) DEFAULT 'N'
        CONSTRAINT FRIEND_AGREE_NN NOT NULL,
    adate DATE
);

INSERT INTO
    friend(fno, myno, frino)
VALUES(
    (SELECT NVL(MAX(fno) +1, 1) FROM friend), (SELECT mno FROM member WHERE id = 'YHLEE'), 1006
);
INSERT INTO
    friend(fno, myno, frino)
VALUES(
    (SELECT NVL(MAX(fno) +1, 1) FROM friend), (SELECT mno FROM member WHERE id = 'YHLEE'), 1004
);

INSERT INTO
    friend(fno, myno, frino, agree, adate)
VALUES(
    (SELECT NVL(MAX(fno) +1, 1) FROM friend), (SELECT mno FROM member WHERE id = 'YHLEE'), 1003, 'Y', sysdate
);
INSERT INTO
    friend(fno, myno, frino, agree, adate)
VALUES(
    (SELECT NVL(MAX(fno) +1, 1) FROM friend), (SELECT mno FROM member WHERE id = 'hui'), 1001, 'Y', sysdate
);

commit;
