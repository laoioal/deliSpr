--delivery
CREATE TABLE orderlist(
    olno NUMBER(6)
        CONSTRAINT OL_OLNO_PK PRIMARY KEY,
    ono VARCHAR2(40CHAR)
        CONSTRAINT OL_ONO_FK REFERENCES ordertask(ono)
        CONSTRAINT OL_ONO_NN NOT NULL,
    rno NUMBER(4)
        CONSTRAINT OL_RNO_FK REFERENCES restaurant(restno)
        CONSTRAINT OL_MNO_NN NOT NULL,
    odate DATE DEFAULT sysdate
        CONSTRAINT OL_DATE_NN NOT NULL,
    oprice NUMBER(6)
        CONSTRAINT OL_PR_NN NOT NULL,
    paym VARCHAR2(10CHAR)
        CONSTRAINT OL_PM_NN NOT NULL,
    requests VARCHAR2(100CHAR)
);