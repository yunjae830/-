--회원가입 및 로그인
CREATE SEQUENCE members_SEQ
START WITH 1
INCREMENT BY 1;
--회원
CREATE TABLE members
(
    members_seq        INT             NOT NULL, 
    members_name       VARCHAR2(20)    NOT NULL, 
      members_email      VARCHAR2(20)    NOT NULL,
    members_pw         VARCHAR2(20)    NOT NULL,
    members_EmailChecked    VARCHAR2(5),
    CONSTRAINT MEMBERS_PK PRIMARY KEY (members_seq)
);

--그룹
CREATE SEQUENCE GROUP_ADDRESS_SEQ;

CREATE TABLE GROUP_ADDRESS_TABLE(
   group_seq NUMBER PRIMARY KEY,
   group_title   VARCHAR2(30),
   group_date DATE DEFAULT SYSDATE,
   members_seq NUMBER NOT NULL,
    cnt NUMBER NOT NULL,
   CONSTRAINT GROUP_MEMBER_SEQ  FOREIGN KEY(MEMBERS_SEQ) REFERENCES members(MEMBERS_SEQ)
);

CREATE SEQUENCE ADDRESS_SEQ;
CREATE TABLE GROUP_ADDRESS(
	group_address_seq NUMBER PRIMARY KEY,
	group_address_email VARCHAR2(40),
	members_seq NUMBER NOT NULL,
	group_seq NUMBER NOT NULL,
	CONSTRAINT GROUP_ADDR_SEQ  FOREIGN KEY(MEMBERS_SEQ) REFERENCES members(MEMBERS_SEQ)
);
--주소록
CREATE SEQUENCE address_customer_seq INCREMENT BY 1 START WITH 1;

CREATE TABLE ADDRESS_TABLE(
   customer_seq NUMBER PRIMARY KEY,
   customer_name VARCHAR2(30),
   customer_email VARCHAR2(30),
   group_seq NUMBER NOT NULL,
    members_seq NUMBER NOT NULL,
   CONSTRAINT admin_group_seq  FOREIGN KEY(group_seq) REFERENCES GROUP_ADDRESS_TABLE(group_seq),
   CONSTRAINT ADDRESS_FK_MEMBER_ID  FOREIGN KEY(MEMBERS_SEQ) REFERENCES MEMBERS(MEMBERS_SEQ) 
);
--도움말
CREATE SEQUENCE help_SEQ INCREMENT BY 1 START WITH 1;

CREATE TABLE HELP_TABLE(
   help_seq NUMBER primary key,
   help_title VARCHAR2(100),
   help_title_detail VARCHAR2(100),
   help_members_seq NUMBER NOT NULL,
   members_name VARCHAR2(20) NOT NULL
);

commit;