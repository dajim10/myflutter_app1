pipeline {
    agent any
    environment {
        PATH = "$PATH:/var/jenkins_home"
    }

    stages {
        stage('GIT PULL') {
            steps {
                git branch: "main", url: 'https://github.com/dajim10/myflutter_app1.git'
            }
        }

        stage('Install flutter') {
            steps {
               
                // ดาวโหลดและ install Flutter 
                sh '''
                    pwd
                    mkdir -p ~/flutter
                    curl -o ~/flutter/flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.6-stable.tar.xz
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

        stage('Test Flutter doctor') { 
            steps {
                sh 'flutter doctor'
            }
        }

        stage('BUILD') {
            steps {
                sh 'flutter build web --debug'
            }
        }
       
    }
}
