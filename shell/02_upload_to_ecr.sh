# 環境変数を設定(環境変数の値は自分の名前(ローマ字)を設定)
USER_NAME=$1

# ECRにログインする
$(aws ecr get-login --no-include-email)

# WebアプリのDockerイメージをECRにアップロードするためにタグ付けを行う
docker tag web-django:latest $(aws sts get-caller-identity --query 'Account' --output text).dkr.ecr.ap-northeast-1.amazonaws.com/ecr-$USER_NAME-web:latest
docker tag postgres:latest $(aws sts get-caller-identity --query 'Account' --output text).dkr.ecr.ap-northeast-1.amazonaws.com/ecr-$USER_NAME-postgres:latest

# docker-composeのインストール確認(バージョンが表示されればOK)
docker push $(aws sts get-caller-identity --query 'Account' --output text).dkr.ecr.ap-northeast-1.amazonaws.com/ecr-$USER_NAME-postgres:latest
docker push $(aws sts get-caller-identity --query 'Account' --output text).dkr.ecr.ap-northeast-1.amazonaws.com/ecr-$USER_NAME-web:latest
