# カレントディレクトリを変更
cd ../..
# docker-composeのインストール
sudo curl -L https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# docker-composeのインストール確認(バージョンが表示されればOK)
docker-compose -v
# djangoのWebアプリ資材をダウンロード
git clone https://github.com/YuichiIto/ecs-django-sample.git
# クローンした資材フォルダに移動
cd ecs-django-sample/
# Cloud9上でWebアプリのコンテナを作成・起動する
docker-compose up --build
