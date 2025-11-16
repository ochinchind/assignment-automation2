pipeline {
    agent any
    environment {
        # These should be configured securely in Jenkins credentials and injected into the job
        BROWSERSTACK_USERNAME = credentials('BROWSERSTACK_USERNAME')
        BROWSERSTACK_ACCESS_KEY = credentials('BROWSERSTACK_ACCESS_KEY')
    }
    stages {
        stage('Chrome') {
            steps {
                withEnv(["BROWSER=Chrome", "BROWSERSTACK=True"]) {
                    sh 'mkdir -p results/chrome'
                    sh 'robot -d results/chrome testCases'
                }
            }
        }
        stage('Firefox') {
            steps {
                withEnv(["BROWSER=Firefox", "BROWSERSTACK=True"]) {
                    sh 'mkdir -p results/firefox'
                    sh 'robot -d results/firefox testCases'
                }
            }
        }
        stage('Safari') {
            steps {
                withEnv(["BROWSER=Safari", "BROWSERSTACK=True"]) {
                    sh 'mkdir -p results/safari'
                    sh 'robot -d results/safari testCases'
                }
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'results/**/output.xml', fingerprint: true
            publishHTML(target: [allowMissing: true, alwaysLinkToLastBuild: true, keepAll: true, reportDir: 'results', reportFiles: 'report.html', reportName: 'Robot Report'])
        }
    }
}
