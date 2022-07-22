CREATE TABLE CHAT(
    cno NUMBER(5)
        CONSTRAINT CHAT_CNO_PK PRIMARY KEY,
    cmno NUMBER(4)
        CONSTRAINT CHAT_CMNO_NN NOT NULL
        CONSTRAINT CHAT_CMNO_FK REFERENCES member(mno),
    cbody VARCHAR2 (100 CHAR)
        CONSTRAINT CHAT_CBODY_NN NOT NULL,
    cdate DATE DEFAULT sysdate
        CONSTRAINT CHAT_CDATE_NN NOT NULL
);
ALTER TABLE chat
ADD(
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT CHAT_ISSHOW_NN NOT NULL
        CONSTRAINT CHAT_ISSHOW_CK CHECK(isshow IN('Y','N'))
);