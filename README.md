# petclinic



TODO #1

Pipeline flows
Check https://github.com/marketplace/actions/setup-jfrog-cli 

0. Before builds - static security check =>           OK =====> DIRE que ya une command qui semble pouvoir faire ce que je veux ms parce que je ne passais par maven central mon jf audit qui a besoin de mvn dependency:tree was failing and i looked into jf mvn alternatives but could not find a smooth way to make it work from jf jwt token. Because i could issue jf command thanks oidc integration i hoped i could do jf mvn instead of having to create a default maven settings.xml.
    - SCA                                           
    - CVEs
    - (secret detection, IaC)
- Build, test (maven package)
- maven verify & deploy (=upload)


I THINK I NEED TO PROMOTE THE JAR, BEFORE creating the docker image
==> Docker does not have snapshot concept

so the dev jar should be the source to create the docker image
hence i need to go from snapshot jar to dev jar

Maybe I do mwn verify and if OK ==> i do promotion to dev repo (or for simplicity to release repo)

to docker image


Artifactory as proxy maven central                      OK

1. In artifactory
scan jars 
scan docker images

verify sing in download?


TODO #2

Artifactory as proxy to dockerhub

https://youtu.be/8uyCtNXEsrY?si=nKW3BDPC-NVa5C6C

TODO #3 
Sign artifacts

TODO #4 Repo management
https://github.com/jfrog/project-examples/tree/master/github-action-examples/repo-management-github-actions-example

BUILD NAME & BUILD NUMBER

SLSA 