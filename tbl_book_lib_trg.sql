create or replace TRIGGER "TBL_BOOK_LIB_TRG"
BEFORE INSERT OR UPDATE OR DELETE ON "TBL_BOOK_LIB"
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    SELECT SEQ_LIBRARY.NEXTVAL
    INTO :NEW.BOOK_ID
    from TBL_BOOK_LIB;
  END IF;
END;
/