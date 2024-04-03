
  CREATE TABLE "TBL_MEMBER_LIB" 
   (	"MEMBER_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"MEMBER_NATIONAL_CODE" NUMBER(10,0) NOT NULL ENABLE, 
	"MEMBER_F_NAME" VARCHAR2(1000 CHAR) NOT NULL ENABLE, 
	"MEMBER_L_NAME" VARCHAR2(1000 CHAR) NOT NULL ENABLE, 
	"MEMBER_PIC" BLOB NOT NULL ENABLE, 
	"MEMBER_PHONE" NUMBER(11,0) NOT NULL ENABLE, 
	"MEMBER_ADDRESS" VARCHAR2(1000 CHAR) NOT NULL ENABLE, 
	 CONSTRAINT "TBL_MEMBER_LIB_PK" PRIMARY KEY ("MEMBER_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE OR REPLACE EDITIONABLE TRIGGER "TBL_MEMBER_LIB_TRG" 
BEFORE INSERT OR UPDATE OR DELETE ON "TBL_MEMBER_LIB"
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    SELECT SEQ_LIBRARY.NEXTVAL
    INTO :NEW.MEMBER_ID
    from TBL_MEMBER_LIB;
  END IF;
END;
/
ALTER TRIGGER "TBL_MEMBER_LIB_TRG" ENABLE;