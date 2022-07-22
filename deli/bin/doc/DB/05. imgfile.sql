CREATE TABLE IMGFILE(
    ano NUMBER(6)
        CONSTRAINT IMGFILE_ANO_PK PRIMARY KEY,
    amno NUMBER(4)
        CONSTRAINT IMGFILE_amno_FK REFERENCES member(mno),
    oriname VARCHAR2(4000)
        CONSTRAINT IMGFILE_ORINAME_NN NOT NULL,
    dir VARCHAR2(100 CHAR)
        CONSTRAINT IMGFILE_URL_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT IMGFILE_ISSHOW_NN NOT NULL
        CONSTRAINT IMGFILE_ISSHOW_CK CHECK(isshow IN('Y','N')),
    sdate DATE DEFAULT sysdate
        CONSTRAINT IMGFILE_sdate_NN NOT NULL,
    savename VARCHAR2(4000)
        CONSTRAINT IMGFILE_SAVENAME_NN NOT NULL
);

INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1001,
    'img_avatar2.png', '/resources/upload', 'img_avatar2.png'
);

INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1002,
    'img_avatar2.png', '/resources/upload', 'img_avatar1.png'
);

INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1003,
    'img_avatar2.png', '/resources/upload', 'img_avatar4.png'
);

INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1004,
    'img_avatar2.png', '/resources/upload', 'img_avatar1.png'
);

INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1005,
    'img_avatar2.png', '/resources/upload', 'img_avatar5.png'
);

INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1006,
    'img_avatar2.png', '/resources/upload', 'img_avatar2.png'
);

INSERT INTO
    imgfile(ano, amno, oriname, dir, savename)
VALUES(
    (SELECT NVL(MAX(ano) + 1, 100000) FROM imgfile), 1007,
    'img_avatar2.png', '/resources/upload', 'img_avatar6.png'
);