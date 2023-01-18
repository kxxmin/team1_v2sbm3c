/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE ADMIN(
		ADMINNO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		ID                            		VARCHAR2(20)		 NOT NULL,
		PASSWD                        		VARCHAR2(15)		 NOT NULL,
		MNAME                         		VARCHAR2(20)		 NOT NULL,
		MDATE                         		DATE		 NOT NULL,
		GRADE                         		NUMBER(2)		 NOT NULL,
  CONSTRAINT SYS_C007459 UNIQUE (ID)
);

COMMENT ON TABLE ADMIN is '������';
COMMENT ON COLUMN ADMIN.ADMINNO is '������ ��ȣ';
COMMENT ON COLUMN ADMIN.ID is '���̵�';
COMMENT ON COLUMN ADMIN.PASSWD is '�н�����';
COMMENT ON COLUMN ADMIN.MNAME is '����';
COMMENT ON COLUMN ADMIN.MDATE is '������';
COMMENT ON COLUMN ADMIN.GRADE is '���';


/**********************************/
/* Table Name: �������� ī�װ� */
/**********************************/
CREATE TABLE NOTICECATE(
		NOTICECATENO                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NAME                          		VARCHAR2(50)		 NOT NULL,
		CNT                           		NUMBER(7)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		UDATE                         		DATE		 NULL ,
		SEQNO                         		NUMBER(5)		 DEFAULT 0		 NOT NULL,
		VISIBLE                       		CHAR(1)		 DEFAULT 'N'		 NOT NULL
);

COMMENT ON TABLE NOTICECATE is '�������� ī�װ�';
COMMENT ON COLUMN NOTICECATE.NOTICECATENO is '�������� ī�װ���ȣ';
COMMENT ON COLUMN NOTICECATE.NAME is 'ī�װ� �̸�';
COMMENT ON COLUMN NOTICECATE.CNT is '���� �ڷ��';
COMMENT ON COLUMN NOTICECATE.RDATE is '�����';
COMMENT ON COLUMN NOTICECATE.UDATE is '������';
COMMENT ON COLUMN NOTICECATE.SEQNO is '��� ����';
COMMENT ON COLUMN NOTICECATE.VISIBLE is '��¸��';


/**********************************/
/* Table Name: �������� */
/**********************************/
CREATE TABLE NOTICE(
		NOTICENO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		ADMINNO                       		NUMBER(10)		 NOT NULL,
		NOTICECATENO                  		NUMBER(10)		 NULL ,
		TITLE                         		VARCHAR2(300)		 NOT NULL,
		CONTENT                       		CLOB(4000)		 NOT NULL,
		CNT                           		NUMBER(7)		 NOT NULL,
		PASSWD                        		VARCHAR2(15)		 NOT NULL,
		WORD                          		VARCHAR2(300)		 NULL ,
		RDATE                         		DATE		 NOT NULL,
		FILE1                         		VARCHAR2(100)		 NULL ,
		FILE1SAVED                    		VARCHAR2(100)		 NULL ,
		THUMB1                        		VARCHAR2(100)		 NULL ,
		SIZE1                         		NUMBER(10)		 NULL ,
  FOREIGN KEY (NOTICECATENO) REFERENCES NOTICECATE (NOTICECATENO),
  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
);

COMMENT ON TABLE NOTICE is '��������';
COMMENT ON COLUMN NOTICE.NOTICENO is '�������� ��ȣ';
COMMENT ON COLUMN NOTICE.ADMINNO is '������ ��ȣ';
COMMENT ON COLUMN NOTICE.NOTICECATENO is '�������� ī�װ���ȣ';
COMMENT ON COLUMN NOTICE.TITLE is '����';
COMMENT ON COLUMN NOTICE.CONTENT is '����';
COMMENT ON COLUMN NOTICE.CNT is '��ȸ��';
COMMENT ON COLUMN NOTICE.PASSWD is '�н�����';
COMMENT ON COLUMN NOTICE.WORD is '�˻���';
COMMENT ON COLUMN NOTICE.RDATE is '�����';
COMMENT ON COLUMN NOTICE.FILE1 is '���� �̹���';
COMMENT ON COLUMN NOTICE.FILE1SAVED is '���� ����� ���� �̹���';
COMMENT ON COLUMN NOTICE.THUMB1 is '���� �̹��� Preview';
COMMENT ON COLUMN NOTICE.SIZE1 is '���� �̹��� ũ��';


/**********************************/
/* Table Name: ���� Ȯ�� ���̺� */
/**********************************/
CREATE TABLE TABLE_15(
		COLUMN_1                      		INTEGER(10)		 NULL ,
		COLUMN_2                      		INTEGER(10)		 NULL ,
		COLUMN_3                      		INTEGER(10)		 NULL ,
		COLUMN_4                      		INTEGER(10)		 NULL ,
		COLUMN_5                      		INTEGER(10)		 NULL 
);

COMMENT ON TABLE TABLE_15 is '���� Ȯ�� ���̺�';
COMMENT ON COLUMN TABLE_15.COLUMN_1 is 'Column1';
COMMENT ON COLUMN TABLE_15.COLUMN_2 is 'Column2';
COMMENT ON COLUMN TABLE_15.COLUMN_3 is 'Column3';
COMMENT ON COLUMN TABLE_15.COLUMN_4 is 'Column4';
COMMENT ON COLUMN TABLE_15.COLUMN_5 is 'Column5';


