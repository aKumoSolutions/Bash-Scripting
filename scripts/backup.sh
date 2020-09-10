#!/bin/bash
# crontab command
# (Testing) */1 * * * * /home/oscadmin/pcf_backup/scripts/pcf_backup.sh "10.48.17.1" >> /home/oscadmin/pcf_backup/logs/pcf_backup.sh.log 2>&1
# (daily)
set -x

echo "-------------Started at: "`date`

HOME_DIR=$(echo ${HOME})
BACKUP_DIR="/backup/pcf/$(date +'%Y')/$(date +'%m')/$(date +'%d')"
MYSQL_USER='admin'
MYSQL_HOST=$1
MYSQL='/usr/bin/mysql'
MYSQLDUMP='/usr/bin/mysqldump'
KEY_DIR="${HOME_DIR}/pcf_backup/keys"
LOG_DIR="${HOME_DIR}/pcf_backup/logs"
DAY=$(date +"%Y%m%d%H%S")

# Public key file for encryption, private stored in regional PAM
KEY_FILE="${KEY_DIR}/mysqldump_openssl_key.pub.pem"

# Make the target directory if doesnt exist
[ -e ${BACKUP_DIR} ] || mkdir -p ${BACKUP_DIR}

fetch_dbs()
{
        # Fetch the database list first
        databases=`${MYSQL} --user=$MYSQL_USER -h ${MYSQL_HOST} -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema)"`
}

backup_encrypt_dbs()
{
        # Loop through the databased and download the databases from the target mysql server
        for db in ${databases}; do
          ${MYSQLDUMP} --force --opt --user=${MYSQL_USER} -h ${MYSQL_HOST} --skip-lock-tables --databases ${db} | \
          openssl smime -encrypt -binary -text -aes256 -out ${BACKUP_DIR}/${db}_${DAY}.sql.enc -outform DER ${KEY_FILE}
        done
}

zip_backup_files()
{
        # tar zip the files and remove the sql files
        cd ${BACKUP_DIR}
        tar -czf pcf_mysqldb_${DAY}.sql.enc.tgz *.sql.enc --remove-files
}

check_status()
{
        if [ $1 != 0 ]; then echo "Failed at $2"; exit $1; fi
}

clean_old_files()
{
        find /backup/pcf/* -type d -ctime +90 | xargs rm -rf;
}

#******  Main function starts Here!

fetch_dbs
check_status $? 'Getting db list from mysql server'

backup_encrypt_dbs
check_status $? 'Backup and Encrypt the downloaded db files'

zip_backup_files
check_status $? 'zip the downloaded db files'

clean_old_files
check_status $? 'cleanup the backup older than 90 days'

echo "Successfully backup taken"
echo "-------------Ended at: "`date`
