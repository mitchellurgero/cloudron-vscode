sudo docker build --no-cache -t mitchellurgero/org.urgero.codeserver:latest .
sudo docker push mitchellurgero/org.urgero.codeserver:latest
cloudron install --image mitchellurgero/org.urgero.codeserver:latest
