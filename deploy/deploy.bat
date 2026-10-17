set ip=10.0.0.40

docker save ghcr.io/gateway3b/gateway3-site:latest > ./gateway3-site.tar

scp gateway3-site.tar matthewweisfeld@%ip%:~/Documents/gateway3-site

@REM scp docker-compose.yml matthewweisfeld@%ip%:~/Documents/gateway3-site
@REM scp .env matthewweisfeld@%ip%:~/Documents/gateway3-site
@REM scp deploy/remoteDeploy.sh matthewweisfeld@%ip%:~/Documents/gateway3-site

@REM ssh matthewweisfeld@%ip% chmod +x /home/matthewweisfeld/Documents/gateway3-site/remoteDeploy.sh
ssh matthewweisfeld@%ip% /home/matthewweisfeld/Documents/gateway3-site/remoteDeploy.sh
