pipeline{
  agent { label 'jenkinworker2' }
  stages {
    stage ('Build') {
      steps {
        sh 'mvn package'
        sh 'ls'
      }
    }
    stage ('Deploy') {
      steps {
        sh 'sudo cp -R target/hello-world-war-1.0.0.war /opt/apache-tomcat-10.0.27/webapps'
        sh 'sudo sh /opt/apache-tomcat-10.0.27/bin/shutdown.sh'
        sh 'sleep 3'
        sh 'sudo sh /opt/apache-tomcat-10.0.27/bin/startup.sh'
      }  
    }
  }
}
