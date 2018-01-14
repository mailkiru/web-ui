#!/usr/bin/env bash
set -x

export DISPLAY=:99
chown cognizant:cognizant /etc/init.d/
bash /etc/init.d/xvfb start
ls -las

echo "Functional test cases..."

cd html-source

npm install grunt --save-dev
npm install jasmine-reporters --save-dev
#npm install

echo "Webdriver starting..."

nohup webdriver-manager start &
sleep 5

echo "Functional test cases execution staring ..."
protractor protractor.conf.js

if [ $? -ne 0 ]; then  
	TEST_FAILURE=1
fi

echo "Executing unit test cases..."
#grunt runee --force

#cd ../src/main/webapp/WEB-INF/static/resources/js/tests/e2e/testresults
#ls -ltr
#cp *.xml ../../../../../../../../../../../tests
ls -ltr

if [ "$TEST_FAILURE" -eq 1 ]; then
	echo "Exiting with exit code 1..."
	exit 1
fi
