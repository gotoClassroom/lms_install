Lms Install
===================


Script to install LMS on your own Server

----------


Get Lms install script
-------------

    $ sudo git clone https://github.com/afterclassroom/lms_install.git

Install
-------------



    $ cd lms_install

> Edit file webapp.conf change domain www.pesome.com with your Lms domain

> Insert Amazon S3 to files s3.yml and amzon_ses.rb

> Edit file fig.yml with HOST, PROTOCOL, EMAIL_FROM

Run file install.sh

    $ sudo chmod +x install.sh
    $ sudo ./install.sh
    $ sudo fig ps
    $ sudo docker-enter lmsinstall_web_1
    $ cd /home/app/webapp/go_to_classroom
    $ sudo -u app -H rake RAILS_ENV=production db:migrate assets:precompile
    $ sudo -u app -H RAILS_ENV=production bin/delayed_job start
    $ exit

Update code
-------------

    $ sudo fig ps
    $ sudo docker-enter lmsinstall_web_1
    $ cd /home/app/webapp/go_to_classroom
    $ sudo chmod +x update.sh
    $ ./update.sh
    $ exit
