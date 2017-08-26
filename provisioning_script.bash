#!/usr/bin/env bash
yum update -y
yum install httpd24 git -y
chkconfig httpd on

cd ~/
git clone https://github.com/kjplunkett/ec2-flask.git

cd ~/ec2-flask
ln -s ~/ec2-flask /var/www/html/ec2-flask
mv /etc/httpd/conf/httpd.conf /etc/httpd/conf/backup_httpd.conf
mv ./httpd.conf /etc/httpd/conf/httpd.conf

virtualenv ~/.ec2-flask
source ~/.ec2-flask/bin/activate
pip install -r requirements.txt
python ec2-flask.py

service httpd restart

