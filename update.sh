git pull

rm -rf public/assets
rm -rf vendor/assets/bower_components
rm vendor/assets/bower.js

sudo -u app -H rake RAILS_ENV=production assets:precompile
sudo -u app -H RAILS_ENV=production bin/delayed_job restart

sudo -u app -H whenever --update-cron

touch tmp/restart.txt