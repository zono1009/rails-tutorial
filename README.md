# README

## GitHub Codespaces
勉強会では開発環境としてGitHub Codespacesを使います。
https://github.com/codespaces/templates

## Webアプリケーションの大まかな仕組み
Webアプリケーションは、クライアント（ブラウザやモバイルアプリ）とサーバーの間でリクエストとレスポンスをやり取りすることで動作します。以下はその流れです。

### 1.クライアントからのリクエスト
ユーザーがブラウザでURLを入力したり、ボタンをクリックすると、HTTPリクエストがWebサーバーに送られます。

### 2.リクエストの処理
Webサーバー（例: Nginx, Puma）はリクエストを受け取り、アプリケーションサーバー（例: Railsアプリケーション）に渡します。アプリケーションサーバーはルーティングによって適切なコントローラーとアクションを特定します。

### 3.データベースへのアクセス
必要に応じてアクション内でモデルを通じてデータベース（例: MySQL, PostgreSQL）にアクセスし、データを取得または保存します。

### 4.レスポンスの生成
コントローラーは取得したデータをビュー（HTMLやJSONなど）に渡し、最終的なレスポンスを生成します。

### 5.クライアントへのレスポンス
送信サーバーが生成したレスポンスをクライアントに返し、ユーザーに結果が表示されます。

## 環境構築にDockerを使う理由

### 1.環境の統一
開発環境・テスト環境・本番環境で同じ環境を再現できるため、「動く環境が違う」という問題を防ぎます。

### 2.依存関係の管理
各アプリケーションの依存関係（ライブラリやツールのバージョン）をDockerイメージで固定することで、環境間の不整合を防ぎます。

### 3.セットアップの簡略化
複数のツールやソフトウェアをインストールする手間が不要になり、Dockerコンテナの起動だけで開発環境を構築できます。

### 4.隔離された環境
他のプロジェクトと独立した環境を構築できるため、異なるバージョンのライブラリやツールを使っても干渉しません。

## Dockerfileとdocker-compose.ymlの役割

Dockerfileは、Dockerイメージを作成するための設計図です。
Dockerイメージとは、Dockerコンテナを起動するための「テンプレート」のようなものです。アプリケーションを実行するために必要なファイルや設定がすべて含まれています。
以下のような内容を記述します。
- ベースとなるイメージ（例: ruby:3.2）
- 必要なパッケージやツールのインストール手順
- アプリケーションコードのコピー
- コマンドの実行（例: サーバーの起動）

docker-compose.ymlは、複数のDockerコンテナ（例: アプリケーション、データベースなど）をまとめて管理するための設定ファイルです。

## `docker-compose build`と`docker-compose up`コマンドの意味
### `docker-compose build`
docker-compose.ymlのbuildセクションに基づいて、Dockerイメージを作成します。

### `docker-compose up`
docker-compose.ymlの内容に基づいて、必要なコンテナを起動します。
指定されたサービス（例: web, db）をまとめて起動し、それらを連携させます。

## 勉強会で使用するコマンド
```
docker-compose build
docker-compose run --rm web bundle exec rails db:migrate
docker-compose run --rm web bundle exec rails db:seed
docker-compose up
docker-compose run --rm web bundle exec rails test
```