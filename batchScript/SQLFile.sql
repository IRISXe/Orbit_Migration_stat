-- Set SQL*Plus environment settings
SET LINESIZE 200  
SET PAGESIZE 50   
SET FEEDBACK OFF
SET HEADING OFF
SET SERVEROUTPUT ON 
SET TRIMSPOOL ON 

-- Spool output to data1.json
SPOOL data1.json

-- SQL Block to generate JSON for data1
DECLARE 
  ctxh            DBMS_XMLGEN.CTXHANDLE;
  xslt_transform  XMLTYPE;
  l_mail_body     CLOB;
BEGIN
  ctxh := DBMS_XMLGEN.NEWCONTEXT('
    SELECT name, cnt
    FROM (
      SELECT 1 sno, ''Customer Account'' Name, FLOOR(DBMS_RANDOM.VALUE(1,10000)) CNT FROM dual
      UNION ALL
      SELECT 3 sno, ''Contact'', FLOOR(DBMS_RANDOM.VALUE(1,10000)) CNT FROM dual
      UNION ALL
      SELECT 2 sno, ''Billing Account'', FLOOR(DBMS_RANDOM.VALUE(1,10000)) CNT FROM dual
      UNION ALL
      SELECT 4 sno, ''Address'', FLOOR(DBMS_RANDOM.VALUE(1,10000)) CNT FROM dual
      UNION ALL
      SELECT 5 sno, ''Asset'', FLOOR(DBMS_RANDOM.VALUE(1,10000)) CNT FROM dual
    ) ORDER BY sno
  ');
  
  xslt_transform := XMLTYPE('<?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" indent="yes"/>
      <xsl:template match="/ROWSET">
        {
          "ROWSET": {
            "ROW": [
              <xsl:for-each select="ROW">
                {
                  <xsl:for-each select="*">
                    "<xsl:value-of select="name()"/>": "<xsl:value-of select="."/>"
                    <xsl:if test="position() != last()">,</xsl:if>
                  </xsl:for-each>
                }
                <xsl:if test="position() != last()">,</xsl:if>
              </xsl:for-each>
            ]
          }
        }
      </xsl:template>
    </xsl:stylesheet>
  ');
  
  DBMS_XMLGEN.SETNULLHANDLING(ctxh, DBMS_XMLGEN.EMPTY_TAG);
  DBMS_XMLGEN.SETXSLT(ctxh, xslt_transform);
  l_mail_body := DBMS_XMLGEN.GETXML(ctxh);
  DBMS_XMLGEN.CLOSECONTEXT(ctxh);
  
  DBMS_OUTPUT.PUT_LINE(l_mail_body);
END;
/
SPOOL OFF

-- Spool output to data2.json
SPOOL data2.json

-- SQL Block to generate JSON for data2
DECLARE 
  ctxh            DBMS_XMLGEN.CTXHANDLE;
  xslt_transform  XMLTYPE;
  l_mail_body     CLOB;
BEGIN
  ctxh := DBMS_XMLGEN.NEWCONTEXT('
    SELECT name, cnt
    FROM (
      SELECT 1 sno, ''Customer Account'' Name, FLOOR(DBMS_RANDOM.VALUE(1,10000)) CNT FROM dual
      UNION ALL
      SELECT 3 sno, ''Contact'', FLOOR(DBMS_RANDOM.VALUE(1,10000)) CNT FROM dual
      UNION ALL
      SELECT 2 sno, ''Billing Account'', FLOOR(DBMS_RANDOM.VALUE(1,10000)) CNT FROM dual
      UNION ALL
      SELECT 4 sno, ''Address'', FLOOR(DBMS_RANDOM.VALUE(1,10000)) CNT FROM dual
      UNION ALL
      SELECT 5 sno, ''Asset'', FLOOR(DBMS_RANDOM.VALUE(1,10000)) CNT FROM dual
    ) ORDER BY sno
  ');
  
  xslt_transform := XMLTYPE('<?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" indent="yes"/>
      <xsl:template match="/ROWSET">
        {
          "ROWSET": {
            "ROW": [
              <xsl:for-each select="ROW">
                {
                  <xsl:for-each select="*">
                    "<xsl:value-of select="name()"/>": "<xsl:value-of select="."/>"
                    <xsl:if test="position() != last()">,</xsl:if>
                  </xsl:for-each>
                }
                <xsl:if test="position() != last()">,</xsl:if>
              </xsl:for-each>
            ]
          }
        }
      </xsl:template>
    </xsl:stylesheet>
  ');
  
  DBMS_XMLGEN.SETNULLHANDLING(ctxh, DBMS_XMLGEN.EMPTY_TAG);
  DBMS_XMLGEN.SETXSLT(ctxh, xslt_transform);
  l_mail_body := DBMS_XMLGEN.GETXML(ctxh);
  DBMS_XMLGEN.CLOSECONTEXT(ctxh);
  
  DBMS_OUTPUT.PUT_LINE(l_mail_body);
END;
/
SPOOL OFF

-- Spool output to spd3.txt
SPOOL data3.json

-- SQL Block to generate text for spd3
DECLARE 
  ctxh            DBMS_XMLGEN.CTXHANDLE;
  xslt_transform  XMLTYPE;
  l_mail_body     CLOB;
BEGIN
  ctxh := DBMS_XMLGEN.NEWCONTEXT('
    SELECT name, cnt
    FROM (
      SELECT 1 sno, ''Customer Account'' Name, FLOOR(DBMS_RANDOM.VALUE(1,10000)) CNT FROM dual
      UNION ALL
      SELECT 3 sno, ''Contact'', FLOOR(DBMS_RANDOM.VALUE(1,10000)) CNT FROM dual
      UNION ALL
      SELECT 2 sno, ''Billing Account'', FLOOR(DBMS_RANDOM.VALUE(1,10000)) CNT FROM dual
      UNION ALL
      SELECT 4 sno, ''Address'', FLOOR(DBMS_RANDOM.VALUE(1,10000)) CNT FROM dual
      UNION ALL
      SELECT 5 sno, ''Asset'', FLOOR(DBMS_RANDOM.VALUE(1,10000)) CNT FROM dual
    ) ORDER BY sno
  ');
  
  xslt_transform := XMLTYPE('<?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" indent="yes"/>
      <xsl:template match="/ROWSET">
        {
          "ROWSET": {
            "ROW": [
              <xsl:for-each select="ROW">
                {
                  <xsl:for-each select="*">
                    "<xsl:value-of select="name()"/>": "<xsl:value-of select="."/>"
                    <xsl:if test="position() != last()">,</xsl:if>
                  </xsl:for-each>
                }
                <xsl:if test="position() != last()">,</xsl:if>
              </xsl:for-each>
            ]
          }
        }
      </xsl:template>
    </xsl:stylesheet>
  ');
  
  DBMS_XMLGEN.SETNULLHANDLING(ctxh, DBMS_XMLGEN.EMPTY_TAG);
  DBMS_XMLGEN.SETXSLT(ctxh, xslt_transform);
  l_mail_body := DBMS_XMLGEN.GETXML(ctxh);
  DBMS_XMLGEN.CLOSECONTEXT(ctxh);
  
  DBMS_OUTPUT.PUT_LINE(l_mail_body);
END;
/
SPOOL OFF

EXIT
