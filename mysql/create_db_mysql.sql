CREATE DATABASE artdb CHARACTER SET utf8 COLLATE utf8_bin;
GRANT ALL ON artdb.* TO 'artifactory'@'%' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;