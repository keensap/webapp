node{
    def Namespace = "default"
    def ImageName = "webapp-v1"
    def Creds = "2dfd9d0d-a300-49ee-aaaf-0a3efcaa5279"
    try{
        stage('Checkout'){
            git 'https://mAyman2612@bitbucket.org/mAyman2612/ci-cd-k8s.git'
            sh "git rev-parse --short HEAD > .git/commit-id"
            imageTag= readFile('.git/commit-id').trim()
        }
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