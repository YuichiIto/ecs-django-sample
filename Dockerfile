# pthon 3.7 + alpine(軽量Linux)のDockerイメージを取得
FROM python:3.7-alpine

# バイナリレイヤ下での標準出力とエラー出力を抑制
ENV PYTHONUNBUFFERED 1

# Dockerコンテナ内に/codeを作成
RUN mkdir /code

# Dockerコンテナ内のワーキングディレクトリを/codeに変更
WORKDIR /code

# Dockerコンテナ内のワーキングディレクトリに必須pythonライブラリをまとめたファイルをコピー
ADD requirements.txt /code/

# ①pip(pythonのライブラリ管理ソフト)の最新化
# ②postgresqlクライアントライブラリのインストール
# ③pythonライブラリのインストール
RUN \
 pip install --upgrade pip && \
 apk add --no-cache postgresql-libs && \
 apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
 python3 -m pip install -r requirements.txt --no-cache-dir && \
 apk --purge del .build-deps

# カレントディレクトリのファイル/フォルダをDockerコンテナへコピー
ADD . /code/