--system에서 진행
CREATE USER delivery IDENTIFIED BY 12345 ACCOUNT UNLOCK;
GRANT resource, connect To delivery;
GRANT UNLIMITED TABLESPACE, CREATE SESSION, connect, resource TO delivery;
ALTER USER delivery DEFAULT TABLESPACE USERs;