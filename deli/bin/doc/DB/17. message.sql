CREATE TABLE message (
    msno NUMBER(4)
        CONSTRAINT MESSAGE_MSNO_PK PRIMARY KEY,
    writerno NUMBER(4)
        CONSTRAINT MESSAGE_WTNO_NN NOT NULL
        CONSTRAINT MESSAGE_WTNO_FK REFERENCES member(mno),
    myno NUMBER(4)
        CONSTRAINT MESSAGE_MYNO_NN NOT NULL
        CONSTRAINT MESSAGE_MYNO_FK REFERENCES member(mno),
    mstitle VARCHAR2(30 CHAR)
        CONSTRAINT MESSAGE_MSTITLE_NN NOT NULL,
    msbody VARCHAR2(4000)
        CONSTRAINT MESSAGE_MSBODY_NN NOT NULL,
    wdate DATE DEFAULT sysdate
        CONSTRAINT MESSAGE_WDATE_NN NOT NULL,
    mscheck CHAR(1) DEFAULT 'N'
        CONSTRAINT MESSAGE_CHECK_NN NOT NULL,
    rdate DATE,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT MESSAGE_ISSHOW_NOT NULL
        CONSTRAINT MESSAGE_ISSHOW_CK CHECK(isshow IN('Y', 'N'))
);