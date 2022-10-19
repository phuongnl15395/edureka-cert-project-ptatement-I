pipeline{
	
    // agent {label 'kslave1'}
	
    agent any
    stages{
        stage('Checkout...'){	    
            steps{
		        echo 'cloning..'
                git 'https://github.com/phuongnl15395/edureka-cert-project-statement-I.git'
            }
        }
        stage('Build......'){	    
            steps{
		        sh 'docker build -t phuongnl95/php-app:$BUILD_NUMBER .'
            }
        }
        stage('Docker login && push image ......'){	    
            steps{
		            
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'passwd', usernameVariable: 'user')]) {
       
                sh 'echo "${passwd} | docker login -u ${user} --password-stdin" && docker push phuongnl95/php-app:$BUILD_NUMBER'
                    
                }
            }
        }
        stage('Deploy...'){	    
            steps{
		        // sh 'cd ansible-deploy && ansible-playbook -i inventory playbook.yml --extra-vars "tag=$BUILD_NUMBER"'
                ansiblePlaybook installation: 'ansible-kslave1', inventory: './ansible-deploy/inventory', playbook: './ansible-deploy/playbook.yml', extras: '--extra-vars tag=$BUILD_NUMBER'
            }        
     
        }
    }

}