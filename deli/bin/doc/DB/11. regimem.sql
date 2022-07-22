--delivery
CREATE TABLE regimem (
    abno NUMBER(4)
        CONSTRAINT REGIMEM_ABNO_NN NOT NULL
        CONSTRAINT REGIMEM_ABNO_FK REFERENCES board(bno),
    aid VARCHAR2(10 CHAR)
        CONSTRAINT REGIMEM_AID_NN NOT NULL
        CONSTRAINT REGIMEM_AID_FK REFERENCES member(id),
    wdate DATE DEFAULT sysdate
        CONSTRAINT REGIMEM_wdate_NN NOT NULL,
    ddate DATE DEFAULT sysdate
        CONSTRAINT REGIMEM_DDATE_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT REGIMEM_ISSHOW_NN NOT NULL
        CONSTRAINT REGIMEM_ISSHOW_CK CHECK(isshow IN('Y','N')),
    estishow CHAR(1) DEFAULT 'Y'
        CONSTRAINT REGIMEM_ESTI_NN NOT NULL
        CONSTRAINT REGIMEM_ESTI_CK CHECK(estishow IN('Y','N'))
);

INSERT INTO
    regimem(abno, aid)
VALUES(
    2, 'hui'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    3, 'call'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    4, 'dool'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    5, 'HONG'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    6, 'jennie'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    7, 'YHLEE'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    8, 'hui'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    9, 'HONG'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    10, 'jennie'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    11, 'dool'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    12, 'hui'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    13, 'HONG'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    14, 'HONG'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    15, 'call'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    16, 'jennie'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    17, 'dool'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    18, 'YHLEE'
);
INSERT INTO
    regimem(abno, aid)
VALUES(
    19, 'YHLEE'
);

commit;