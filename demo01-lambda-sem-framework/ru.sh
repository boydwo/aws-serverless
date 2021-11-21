#1 passo criar arquivo de politicas de segurança
#2 criar role de segurança AWS

aws iam create-role \
    --role-name lambda-exemplo \
    --assume-role-policy-document file://politicas.json \
    | tee logs/role.log


#3 criar arquivo com conteudo e zipa-lo 
zip function.zip index.js


aws lambda create-function \
  --function-name hello-cli \
  --zip-file fileb://function.zip \
  --handler index.handler \
  --runtime nodejs14.x \
  --role arn:aws:iam::189543651183:role/lambda-exemplo \
  | tee logs/lambda-create.log

#4 invoke lambada

aws lambda invoke \
  --function-name hello-cli \
  --log-type Tail \
  logs/lambda-exec.log

  # -- atualizar, zipar
  zip function.zip index.js

  # atualizar lambda
  aws lambda update-function-code \
    --zip-file fileb://function.zip \
    --function-name hello-cli \
    --publish \
    | tee logs/lambda-update.log

  # remover
  aws lambda delete-function \
    --function-name hello-cli 
  
  aws iam delete-role \
    --role-name lambda-exemplo