SET LINESIZE 200  
SET PAGESIZE 50   
SET FEEDBACK OFF
set heading off	
 set serveroutput on 
  set trimspool on
  spool data1.json;
  DECLARE 
ctxh            dbms_xmlgen.ctxhandle;

xslt_tranfsorm  XMLTYPE;

l_mail_body     CLOB;

BEGIN

 ctxh:= dbms_xmlgen.newcontext(' select name, cnt  from (
select  1 sno , ''Customer Account'' Name, 1200 CNT from dual
union all
select   3 sno , ''Contact'', 1243 CNT from dual
union all 
select  2 sno , ''Billing Account'', 1222 CNT from dual
union all
select  4 sno , ''Address'', 1000 CNT from dual
union all
select  5 sno , ''Asset'', 123 CNT from dual) order by sno' );
xslt_tranfsorm := NEW XMLTYPE('<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" indent="yes"/>
    
    <!-- Template to match the root element -->
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

dbms_xmlgen.setnullhandling(ctxh, dbms_xmlgen.empty_tag);

dbms_xmlgen.setxslt(ctxh, xslt_tranfsorm);

l_mail_body := dbms_xmlgen.getxml(ctxh);

dbms_xmlgen.closecontext(ctxh);


dbms_output.put_line ( l_mail_body );

end ;
/
 spool off ;
 
 
   spool data2.json;
  DECLARE 
ctxh            dbms_xmlgen.ctxhandle;

xslt_tranfsorm  XMLTYPE;

l_mail_body     CLOB;

BEGIN

 ctxh:= dbms_xmlgen.newcontext(' select name, cnt  from (
select  1 sno , ''Customer Account'' Name, 1200 CNT from dual
union all
select   3 sno , ''Contact'', 1243 CNT from dual
union all 
select  2 sno , ''Billing Account'', 1222 CNT from dual
union all
select  4 sno , ''Address'', 1000 CNT from dual
union all
select  5 sno , ''Asset'', 123 CNT from dual) order by sno' );
xslt_tranfsorm := NEW XMLTYPE('<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" indent="yes"/>
    
    <!-- Template to match the root element -->
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

dbms_xmlgen.setnullhandling(ctxh, dbms_xmlgen.empty_tag);

dbms_xmlgen.setxslt(ctxh, xslt_tranfsorm);

l_mail_body := dbms_xmlgen.getxml(ctxh);

dbms_xmlgen.closecontext(ctxh);


dbms_output.put_line ( l_mail_body );

end ;
   /
   
 spool off ;
 exit;
 
 
 
   spool spd3.txt;
  DECLARE 
ctxh            dbms_xmlgen.ctxhandle;

xslt_tranfsorm  XMLTYPE;

l_mail_body     CLOB;

BEGIN

 ctxh:= dbms_xmlgen.newcontext( 'select name, cnt  from (
select  1 sno , ''Customer Account'' Name, 1200 CNT from dual
union all
select   3 sno , ''Contact'', 1243 CNT from dual
union all 
select  2 sno , ''Billing Account'', 1222 CNT from dual
union all
select  4 sno , ''Address'', 1000 CNT from dual
union all
select  5 sno , ''Asset'', 123 CNT from dual) order by sno' );
xslt_tranfsorm := NEW XMLTYPE('<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" indent="yes"/>
    
    <!-- Template to match the root element -->
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

dbms_xmlgen.setnullhandling(ctxh, dbms_xmlgen.empty_tag);

dbms_xmlgen.setxslt(ctxh, xslt_tranfsorm);

l_mail_body := dbms_xmlgen.getxml(ctxh);

dbms_xmlgen.closecontext(ctxh);


dbms_output.put_line ( l_mail_body );

end ;
   /
   
 spool off ;
 exit;