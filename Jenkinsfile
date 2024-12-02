pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                withKubeConfig(credentialsId: 'kubeconfig') {
                    sh """
                    helm upgrade --install myapp ./helm-chart \
                      --namespace default \
                      --set image.repository=<your-docker-image> \
                      --set image.tag=latest
                    """
                }
            }
        }
    }
}
