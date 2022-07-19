--delivery
CREATE TABLE ordertask(
    ono VARCHAR2(40CHAR)
        CONSTRAINT OD_ONO_PK PRIMARY KEY,
    mno NUMBER(4)
        CONSTRAINT OD_MNO_FK REFERENCES member(mno)
        CONSTRAINT OD_MNO_NN NOT NULL
);


alter table ordertask add(
    isshow CHAR(1) DEFAULT 'Y'
    CONSTRAINT ODT_SHOW_CK CHECK (isshow IN('Y', 'N'))
    CONSTRAINT ODT_SHOW_NN NOT NULL
);
