
DROP TABLE ADDRESS_TABLE;
CREATE SEQUENCE ADDRESS_customer_seq;

CREATE TABLE ADDRESS_TABLE(
	customer_seq NUMBER PRIMARY KEY,
	customer_name VARCHAR2(30),
	customer_email VARCHAR2(30),
	CONSTRAINT ADDRESS_FK_MEMBER_ID  FOREIGN KEY(MEMBERS_SEQ) REFERENCES MEMBERS(MEMBERS_SEQ) 
);

insert into ADDRESS_table values(email_customer_seq.nextval, 'test', 'jea830@naver.com');
select * from ADDRESS_table;
commit;