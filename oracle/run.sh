#!/bin/bash
LISTENERS_ORA=/u01/app/oracle/product/11.2.0/xe/network/admin/listener.ora

cp "${LISTENERS_ORA}.tmpl" "$LISTENERS_ORA" &&
sed -i "s/%hostname%/$HOSTNAME/g" "${LISTENERS_ORA}" &&
sed -i "s/%port%/1521/g" "${LISTENERS_ORA}" &&
service oracle-xe start &&
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe &&
echo "CREATE USER artifactory IDENTIFIED BY password;" | /u01/app/oracle/product/11.2.0/xe/bin/sqlplus SYSTEM/oracle@localhost &&
echo "grant dba to artifactory;" | /u01/app/oracle/product/11.2.0/xe/bin/sqlplus SYSTEM/oracle@localhost