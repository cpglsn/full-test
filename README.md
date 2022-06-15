## Overview

This repo is meant to give an idea regarding how to deploy an application automatically using pull systems (in this case argocd) rather than push systems.
The repo also include an implementation of kaniko which will build and push the container to dockerhub. The same container will be used by the deployment.

## Before you start

Please be aware that some of the sensitive data (credentials mostly) have been moved out from the repo. To apply your own, modify all the lines you see after running:
```
grep -ri CHANGE_HERE /path/of/the/local/cloned/repo
```

## Get started

Follow the numbers to apply sequentially the commands starting from 1 to 5
There are two number 1 which does the same thing but with different tools.
For each dir you may find a README inside which will guide you through the usage of that specific tool/step 

1. 1eksctl - a minimal cluster defined using eksctl. To run such file you need to have aws account set up locally with right perm.
1. 1terraform - a minimal cluster defined using terraform. To run such file you need to have aws account set up locally with right perm.
2. 2argocd - argocd pre-installation and installation steps, plus steps on how to reach it
3. 3pre_helm - configuration to be run only once as per secret used in the next step by kaniko
4. 4helm - a helm chart monitored/synched by argocd. The sync will be recursive as the same argocd Application is present in such help repo
5. 5app - contains the dockerfile and potentially all the files needed to build the container


## To be fixed

- Kaniko run as pod which is not deleted after the task is completed. Its usage would probably makes more sense in a conventional pipeline (which can do more stuff) rather than in argo. As a result the pod has to be deleted after each usage as it is not possible to modify exiting pods in the way the definition would expect, trowing then an error.
- As a side note of the previous problem, dependencies can't be really set easily in here, as a result the deployment of the app will fail until the image is pushed to the repo (will probably lose 1/2 attempts but will eventually end up running).
