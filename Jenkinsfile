pipeline {
    agent any

    stages {
        stage('GIT PULL') {
            steps {
                git branch: "main", url: 'https://github.com/dajim10/myflutter_app1.git'
            }
        }

         stage('Install Dependencies') {
            steps {
                // Install Flutter and Dart dependencies
                script {
                    def flutterHome = tool name: 'Flutter', type: 'Tool'
                    def dartHome = tool name: 'Dart', type: 'Tool'
                    env.PATH = "${flutterHome}:${dartHome}:${env.PATH}"
                    sh 'flutter pub get'
                }
            }
        }

        stage('TEST') {
            steps {
                sh 'flutter test'
            }
        }

        stage('BUILD') {
            steps {
                sh 'flutter build apk --debug'
            }
        }
       
    }
}
