pipeline {
    agent any

    stages {
        stage('GIT PULL') {
            steps {
                git branch: "main", url: 'https://github.com/dajim10/myflutter_app1.git'
            }
        }
        stage('TEST') {
            steps {
                sh 'flutter test'
            }
        }
        stage('BUILD') {
            steps {
                sh '''
                  #!/bin/sh
                  flutter build apk --debug
                  '''
            }
        }
        // stage('DISTRIBUTE') {
        //     steps {
        //         appCenter apiToken: 'f51cd29ba6b2d34a84cd99bc37348db77624c614',
        //                 ownerName: 'dajim10@hotmail.com',
        //                 appName: 'Flutter-Starter',
        //                 pathToApp: 'build/app/outputs/apk/debug/app-debug.apk',
        //                 distributionGroups: 'AlphaTester'
        //     }
        // }
    }
}