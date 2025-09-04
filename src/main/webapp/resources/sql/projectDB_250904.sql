--------------------------------------------------------
--  ������ ������ - �����-9��-04-2025   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence COMMENT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."COMMENT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 13 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence NOTICE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."NOTICE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 105 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence RESERVE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."RESERVE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 20 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MEMBER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."MEMBER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table COMMENTTBL
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."COMMENTTBL" 
   (	"CNUM" NUMBER, 
	"MEMBERID" VARCHAR2(20 BYTE), 
	"CTEXT" VARCHAR2(100 BYTE), 
	"CDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"BNUM" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MEMBERSTBL
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MEMBERSTBL" 
   (	"MEMBERID" VARCHAR2(20 BYTE), 
	"MEMBERPW" VARCHAR2(20 BYTE), 
	"MEMBERNAME" VARCHAR2(20 BYTE), 
	"MEMBERPHONE" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table NOTICETBL
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."NOTICETBL" 
   (	"BNUM" NUMBER, 
	"BTITLE" VARCHAR2(20 BYTE), 
	"BCONTENT" VARCHAR2(20 BYTE), 
	"MEMBERID" VARCHAR2(20 BYTE), 
	"BHIT" VARCHAR2(20 BYTE) DEFAULT 0, 
	"BDATE" DATE DEFAULT sysdate
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table RESERVETBL
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."RESERVETBL" 
   (	"RID" NUMBER, 
	"MACHINE" VARCHAR2(20 BYTE), 
	"RDATETIME" TIMESTAMP (6), 
	"STATUS" VARCHAR2(20 BYTE) DEFAULT 'reserved', 
	"MEMBERID" VARCHAR2(20 BYTE), 
	"RESERVETIME" TIMESTAMP (6) DEFAULT sysdate
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.COMMENTTBL
SET DEFINE OFF;
Insert into SYSTEM.COMMENTTBL (CNUM,MEMBERID,CTEXT,CDATE,BNUM) values (9,'tiger','�ݰ���!��� ����!!!',to_timestamp('25/09/04 09:11:14.000000000','RR/MM/DD HH24:MI:SSXFF'),104);
Insert into SYSTEM.COMMENTTBL (CNUM,MEMBERID,CTEXT,CDATE,BNUM) values (10,'tiger','tiger�Դϴ�!!~',to_timestamp('25/09/04 09:13:16.000000000','RR/MM/DD HH24:MI:SSXFF'),104);
Insert into SYSTEM.COMMENTTBL (CNUM,MEMBERID,CTEXT,CDATE,BNUM) values (3,'ddu','�氡',to_timestamp('25/09/03 15:35:40.000000000','RR/MM/DD HH24:MI:SSXFF'),2);
Insert into SYSTEM.COMMENTTBL (CNUM,MEMBERID,CTEXT,CDATE,BNUM) values (4,'ddu','����',to_timestamp('25/09/03 15:41:14.000000000','RR/MM/DD HH24:MI:SSXFF'),0);
Insert into SYSTEM.COMMENTTBL (CNUM,MEMBERID,CTEXT,CDATE,BNUM) values (5,'ddu','�ȳ�!!����
',to_timestamp('25/09/03 15:44:35.000000000','RR/MM/DD HH24:MI:SSXFF'),2);
Insert into SYSTEM.COMMENTTBL (CNUM,MEMBERID,CTEXT,CDATE,BNUM) values (11,'tiger','����° ��� �Դϴ�!',to_timestamp('25/09/04 09:13:25.000000000','RR/MM/DD HH24:MI:SSXFF'),104);
REM INSERTING into SYSTEM.MEMBERSTBL
SET DEFINE OFF;
Insert into SYSTEM.MEMBERSTBL (MEMBERID,MEMBERPW,MEMBERNAME,MEMBERPHONE) values ('ddu','11111','�Ѽ���','01077027428');
Insert into SYSTEM.MEMBERSTBL (MEMBERID,MEMBERPW,MEMBERNAME,MEMBERPHONE) values ('tiger','11111','ȫ�浿','01012341234');
REM INSERTING into SYSTEM.NOTICETBL
SET DEFINE OFF;
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (3,'�ݰ���','�ݰ����ϴ�','ddu','33',to_date('25/09/03','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (2,'�� �ۼ��߾��','�ȳ�','ddu','274',to_date('25/09/03','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (4,'1����','1�� ����','tiger','1',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (5,'2����','2�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (6,'3����','3�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (7,'4����','4�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (8,'5����','5�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (9,'6����','6�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (10,'7����','7�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (11,'8����','8�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (12,'9����','9�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (13,'10����','10�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (14,'11����','11�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (15,'12����','12�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (16,'13����','13�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (17,'14����','14�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (18,'15����','15�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (19,'16����','16�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (20,'17����','17�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (21,'18����','18�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (22,'19����','19�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (23,'20����','20�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (24,'21����','21�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (25,'22����','22�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (26,'23����','23�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (27,'24����','24�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (28,'25����','25�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (29,'26����','26�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (30,'27����','27�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (31,'28����','28�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (32,'29����','29�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (33,'30����','30�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (34,'31����','31�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (35,'32����','32�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (36,'33����','33�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (37,'34����','34�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (38,'35����','35�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (39,'36����','36�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (40,'37����','37�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (41,'38����','38�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (42,'39����','39�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (43,'40����','40�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (44,'41����','41�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (45,'42����','42�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (46,'43����','43�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (47,'44����','44�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (48,'45����','45�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (49,'46����','46�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (50,'47����','47�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (51,'48����','48�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (52,'49����','49�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (53,'50����','50�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (54,'51����','51�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (55,'52����','52�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (56,'53����','53�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (57,'54����','54�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (58,'55����','55�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (59,'56����','56�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (60,'57����','57�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (61,'58����','58�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (62,'59����','59�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (63,'60����','60�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (64,'61����','61�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (65,'62����','62�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (66,'63����','63�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (67,'64����','64�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (68,'65����','65�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (69,'66����','66�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (70,'67����','67�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (71,'68����','68�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (72,'69����','69�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (73,'70����','70�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (74,'71����','71�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (75,'72����','72�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (76,'73����','73�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (77,'74����','74�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (78,'75����','75�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (79,'76����','76�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (80,'77����','77�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (81,'78����','78�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (82,'79����','79�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (83,'80����','80�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (84,'81����','81�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (85,'82����','82�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (86,'83����','83�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (87,'84����','84�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (88,'85����','85�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (89,'86����','86�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (90,'87����','87�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (91,'88����','88�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (92,'89����','89�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (93,'90����','90�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (94,'91����','91�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (95,'92����','92�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (96,'93����','93�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (97,'94����','94�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (98,'95����','95�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (99,'96����','96�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (100,'97����','97�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (101,'98����','98�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (102,'99����','99�� ����','tiger','0',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (103,'100����','100�� ����','tiger','1',to_date('25/09/04','RR/MM/DD'));
Insert into SYSTEM.NOTICETBL (BNUM,BTITLE,BCONTENT,MEMBERID,BHIT,BDATE) values (104,'����','�ȳ�!','tiger','30',to_date('25/09/04','RR/MM/DD'));
REM INSERTING into SYSTEM.RESERVETBL
SET DEFINE OFF;
Insert into SYSTEM.RESERVETBL (RID,MACHINE,RDATETIME,STATUS,MEMBERID,RESERVETIME) values (11,'��Ź��',to_timestamp('25/09/16 12:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'reserved','ddu',to_timestamp('25/09/03 11:12:46.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.RESERVETBL (RID,MACHINE,RDATETIME,STATUS,MEMBERID,RESERVETIME) values (13,'��Ź��',to_timestamp('25/09/03 14:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'reserved','ddu',to_timestamp('25/09/03 11:30:44.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.RESERVETBL (RID,MACHINE,RDATETIME,STATUS,MEMBERID,RESERVETIME) values (14,'��Ź��',to_timestamp('25/09/03 15:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'reserved','ddu',to_timestamp('25/09/03 11:30:57.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.RESERVETBL (RID,MACHINE,RDATETIME,STATUS,MEMBERID,RESERVETIME) values (5,'��Ź��',to_timestamp('25/09/23 13:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'reserved','ddu',to_timestamp('25/09/03 10:00:06.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.RESERVETBL (RID,MACHINE,RDATETIME,STATUS,MEMBERID,RESERVETIME) values (6,'Ż����',to_timestamp('25/09/03 12:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'reserved','ddu',to_timestamp('25/09/03 10:44:19.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.RESERVETBL (RID,MACHINE,RDATETIME,STATUS,MEMBERID,RESERVETIME) values (15,'��Ź��',to_timestamp('25/09/03 16:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'reserved','ddu',to_timestamp('25/09/03 12:49:12.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.RESERVETBL (RID,MACHINE,RDATETIME,STATUS,MEMBERID,RESERVETIME) values (17,'��Ź��',to_timestamp('25/09/03 11:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'reserved','ddu',to_timestamp('25/09/03 12:54:05.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.RESERVETBL (RID,MACHINE,RDATETIME,STATUS,MEMBERID,RESERVETIME) values (18,'��Ź��',to_timestamp('25/09/13 12:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'reserved','ddu',to_timestamp('25/09/03 13:34:46.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SYSTEM.RESERVETBL (RID,MACHINE,RDATETIME,STATUS,MEMBERID,RESERVETIME) values (19,'������',to_timestamp('25/09/03 12:00:00.000000000','RR/MM/DD HH24:MI:SSXFF'),'reserved','ddu',to_timestamp('25/09/03 13:48:13.000000000','RR/MM/DD HH24:MI:SSXFF'));
