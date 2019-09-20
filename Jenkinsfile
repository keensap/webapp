node{
  def Namespace = "default"
  def ImageName = "webapp-v1"
  def Creds = "2dfd9d0d-a300-49ee-aaaf-0a3efcaa5279"
  try{
  stage('Docker Build, Push'){
      sh "docker build -t ${ImageName} ."
    }
  stage('Deploy on K8s'){
      sh "kubectl create -f deployment.yaml"
    }
     } catch (err) {
      currentBuild.result = 'FAILURE'
    }
}