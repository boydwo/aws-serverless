# instalar
npm i -g serverless

# sls inicializar 
sls 

# sempre fazer deploy antes de tudo para verificar se está com ambiente ok
sls deploy

# invocar na AWS
sls invoke -f hello

# invocar local
sls invoke local -f hello -l

# logs
sls logs -f hello -t

# remove
sls remove