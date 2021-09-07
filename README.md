
# api-ecs-demo-app
## CI/CD

I have used git actions for the CI/CD Pipeline, I Have a lot of knowledge related to Git Actions. 

## STEPS

First Step: 
* Build the docker image. 
* If the build was successful I am publishing it to Docker Hub.

Second Step (Terraform):
* This step must run after build step, I added a dependency to the build step (needs: build).
* I have added terraform format check step and also validation step to help us bad formatting and wrong 
  configuration settings.
* We will apply changes to terraform only if all steps finished successfully.

## Terraform apply / destroy only

I have added the ability to run terraform command as requested in the assignment.
my git action is checking inside the commit message.
**if commit message contains /apply**
* ci process will skip all other steps.
* ci will only trigger terraform apply for the current repository files.

**if commit message contains /destroy**
* ci process will skip all other steps.
* ci will only trigger terraform destroy.

Another way to trigger terraform apply / destroy is from the actions tab:
[actions](https://github.com/eyal-h/nimble/actions)
On the workflows side menu click on Nimble-Apply or Nimble-Destroy
then click on Run workflow and then click on the green Run workflow button.
![Actions Tab Example](https://github.com/eyal-h/nimble/blob/main/Actions.png)

## Note:
* I have no experience with AWS / TERRAFORM. 
   all the things I have implemented was from learning on the go.

* As an Improvement my suggestion is to Implement branch protection.
   all new code will be pushed to a feature branch after it passed tests / lint... the developer will be able to merge   
   it to master branch.

* I had some issue with go mod I have added "RUN go mod init example.com/m" to the Dockerfile to solve it.
