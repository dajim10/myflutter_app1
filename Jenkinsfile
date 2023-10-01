pipeline {
    agent any

    stages {
        stage('GIT PULL') {
            steps {
                git branch: "main", url: 'https://github.com/dajim10/myflutter_app1.git'
            }
        }

        stage('Install Flutter') {
            steps {
                // Download and install Flutter within the Jenkins workspace
                sh '''
                    mkdir -p ~/flutter
                    wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_2.2.3-stable.tar.xz -O ~/flutter/flutter.tar.xz
                    tar xf ~/flutter/flutter.tar.xz -C ~/flutter/
                    export PATH=$PATH:~/flutter/flutter/bin
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install Flutter and Dart dependencies
                sh 'flutter pub get'
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
