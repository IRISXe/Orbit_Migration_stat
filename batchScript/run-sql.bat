@echo off
cd %cd%
echo I am loading the data.

set DB_USER=%1
set DB_PASSWORD=%2
set DB_CONNECT_STRING"="%3"
echo %DB_USER%/%DB_PASSWORD%@%DB_CONNECT_STRING% >>log.txt

sqlplus -s %DB_USER%/%DB_PASSWORD%@%DB_CONNECT_STRING% @SQLFile.sql 

