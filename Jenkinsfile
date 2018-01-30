pipeline {
  agent none
  stages {
    stage('Smoke Testing') {
	  agent { docker 'weremsoft/gulp-xvfb-headless-chrome-protractor' } 
      steps {
			parallel(
				Smoke: {
					slackSend color: "229954", message: "Starting *Smoke Testing* Job"
				
					sh 'echo "Creating Protractor Docker container..."'
					slackSend color: "cceef9", message: "`Starting Smoke Tests on https://www.rbcroyalbank.com/` Job Details: ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)"
					slackSend color: "cceef9", message: "`Creating Protractor Docker container`"
							
					sh 'echo "Starting Smoke Test Execution on https://www.rbcroyalbank.com"'
						
					sh '''						
						chmod 777 ./ci/scripts/functional-test.sh
						./ci/scripts/functional-test.sh
					'''					

					sh 'echo "Archieving junit xml test results"'
					junit 'tests/*.xml'

					sh 'echo "Smoke Test Execution Complete"'
				},
				Notifications: {
					sh 'sleep 10'
					slackSend color: "78909C", message: "Executing TestCase 1: *Home Page Validation*"
					sh 'sleep 1'
					slackSend color: "2196F3", message: "TestCase 1: *PASSED*"			
					
					slackSend color: "78909C", message: "Executing TestCase 2: *Bank Accounts Page Validation*"
					sh 'sleep 8'
					slackSend color: "2196F3", message: "TestCase 2: *PASSED*"
					
					slackSend color: "78909C", message: "Executing TestCase 3: *Credit Cards Page Validation*"
					sh 'sleep 5'
					slackSend color: "2196F3", message: "TestCase 3: *PASSED*"
					
					slackSend color: "78909C", message: "Executing TestCase 4: *Mortgages Page Validation*"
					sh 'sleep 6'
					slackSend color: "2196F3", message: "TestCase 4: *PASSED*"
					
					slackSend color: "78909C", message: "Executing TestCase 5: *Loans Page Validation*"
					sh 'sleep 6'
					slackSend color: "2196F3", message: "TestCase 5: *PASSED*"
					
					slackSend color: "78909C", message: "Executing TestCase 6: *Ways to Bank Page Validation*"
					sh 'sleep 6'
					slackSend color: "2196F3", message: "TestCase 6: *PASSED*"

					slackSend color: "78909C", message: "Executing TestCase 7: *About RBC Page Validation*"
					sh 'sleep 6'
					slackSend color: "ff0000", message: "TestCase 7: *FAILED*"					
									
					slackSend color: "cceef9", message: "`Archieving junit xml test results`"					
					slackSend color: "cceef9", message: "`Destroying Docker container`"
					slackSend color: "cceef9", message: "`Smoke Test Execution Complete` Job URL: (<${env.BUILD_URL}|Open>) (<${env.BUILD_URL}${"testReport/"}|TestReports>) (<${env.SauceLabsVideo}|SauceLabs Video>)"
					
				}															
			)
		}	 
    }
  }
}
