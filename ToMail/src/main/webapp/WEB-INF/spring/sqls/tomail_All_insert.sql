--주소록
CREATE SEQUENCE address_customer_seq;

CREATE TABLE ADDRESS_TABLE(
	customer_seq NUMBER PRIMARY KEY,
	customer_name VARCHAR2(30),
	customer_email VARCHAR2(30),
    members_seq NUMBER NOT NULL,
	CONSTRAINT MEMBERS_PK_MEMBER_SEQ  FOREIGN KEY(MEMBERS_SEQ) REFERENCES members(MEMBERS_SEQ) 
);

insert into ADDRESS_table values(email_customer_seq.nextval, 'test', 'jea830@naver.com');
--회원가입 및 로그인
CREATE SEQUENCE members_SEQ
START WITH 1
INCREMENT BY 1;

CREATE TABLE members
(
    members_seq        INT             NOT NULL, 
    members_name       VARCHAR2(20)    NOT NULL, 
   	members_email      VARCHAR2(20)    NOT NULL,
    members_pw         VARCHAR2(20)    NOT NULL,
    members_EmailChecked    VARCHAR2(5),
    CONSTRAINT MEMBERS_PK PRIMARY KEY (members_seq)
);