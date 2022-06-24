--delivery
CREATE TABLE ordermenu(
    omno NUMBER(6)
        CONSTRAINT OM_OMNO_PK PRIMARY KEY,
    olno NUMBER(6)
        CONSTRAINT OM_OLNO_FK REFERENCES orderlist(olno)
        CONSTRAINT OM_OLNO_NN NOT NULL,
    omenu VARCHAR2(20 CHAR)
        CONSTRAINT OM_MENU_NN NOT NULL,
    omprice NUMBER(6)
        CONSTRAINT OM_OMPR_NN NOT NULL,
    quantity NUMBER(4)
        CONSTRAINT OM_QT_NN NOT NULL,
    ono VARCHAR2(40CHAR)
        CONSTRAINT OM_ONO_NN NOT NULL
        CONSTRAINT OM_ONO_FK REFERENCES ordertask(ono)
);

