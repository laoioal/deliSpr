--delivery
CREATE TABLE menuimg(
    mino NUMBER(4)
        CONSTRAINT MI_NO_PK PRIMARY KEY,
    miname VARCHAR2(20CHAR)
        CONSTRAINT MI_INAME_NN NOT NULL,
    sname VARCHAR2(20 CHAR)
        CONSTRAINT MI_SNAME_NN NOT NULL,
    dir VARCHAR2(60 CHAR)
        CONSTRAINT MI_DIR_NN NOT NULL
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg01', 'mimg01_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg02', 'mimg02_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg03', 'mimg03_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg04', 'mimg04_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg05', 'mimg05_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg06', 'mimg06_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg07', 'mimg07_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg08', 'mimg08_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg09', 'mimg09_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg10', 'mimg10_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg11', 'mimg11_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg12', 'mimg12_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg13', 'mimg13_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg14', 'mimg14_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg15', 'mimg15_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg16', 'mimg16_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg17', 'mimg17_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg18', 'mimg18_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg19', 'mimg19_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg20', 'mimg20_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg21', 'mimg21_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg22', 'mimg22_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg23', 'mimg23_1', 'deli\src\main\webapp\resources\img\mimg'
);

INSERT INTO 
    menuimg(mino, miname, sname, dir)
VALUES(
    (SELECT NVL(MAX(mino) +1, 1001) FROM menuimg),
    'mimg24', 'mimg24_1', 'deli\src\main\webapp\resources\img\mimg'
);

commit;