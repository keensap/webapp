node{
    def Namespace = "default"
    def ImageName = "webapp-v1"
    def Creds = "2dfd9d0d-a300-49ee-aaaf-0a3efcaa5279"
    try{
        stage('Checkout'){
            git 'https://github.com/keensap/webapp.git'
            sh "git rev-parse --short HEAD > .git/commit-id"
            imageTag= readFile('.git/commit-id').trim()
        }
        stage('Docker'){
            sh "docker build -t ${ImageName} -f Dockerfile . "
        }
        stage('Deploy on K8s'){
            sh "kubectl create -f deployment.yaml"
        }
    } catch (err) {
      currentBuild.result = 'FAILURE'
    }
}