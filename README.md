# edit_test
コミットメッセージ編集のためのテスト
その他なんでもテスト
git flowのテスト

Rails3.2.13ではrails newを実行した際に config/initializers/secret_token.rbが自動生成され、その中にシークレットトークンが最初から記述されていました。しかし、ソースに直に記述されたシークレットトークンが自動生成されるのは良くないという考えで、Rails4.1からは代わりに config/secrets.yml が自動生成されるようになりました。secrets.ymlでは今までと違い、下記のように環境ごとにシークレットトークンを設定します。
```
development:
  secret_key_base: 3d61a5e17e2e718816d54f7c942390f9745512bebadbe73b999125defa989b60fc13500b0c17080ae4b5377dd14517e11127b4d9b6592b34411eeb4a576b6d2e

test:
  secret_key_base: 9131ebe113458e57ee28a45f0a88e66b944df9262dd3bfb623169cd57aaa4cda54357c5cfed48e0c523fb5991ddfbfb0d4a5fcdbaf5949280b8c5879ada54c95

# Do not keep production secrets in the repository,
# instead read values from the environment.
production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
```
development: とtest: には自動でセキュアなシークレットキーが記述されているのでそのまま
rails serverが実行できますが、production: でアプリを起動するときには、環境変数 ENV[“SECRET_KEY_BASE”]を設定する必要があります。

更にRails4.2からはsecrets.ymlがデフォルトでgitigonreに記述されているので、リモートリポジトリには記録されなくなりました。
そのため、cloneしてきたソースにはconfig/secrets.ymlはありません。シークレットトークンがないので、rails serverの実行に失敗してしまいます。

解決策①　各自でsecrets.ymlを用意する。
　　　　　　　つまり、Rails4.2のデフォルトでは全てのアプリケーションサーバーに
　　　　　　　secrets.ymlが必要になっています。
　　　　　　　本体にあるsecrets.ymlを参考にして各自で作成する
　　　　　　　必要があります。

解決策②　.gitignoreからsecrets.ymlを外してしまう
　　　　　　　公式によるとsecrets.ymlは「秘密にしたい値をRails側から切り離すための
　　　　　　　機構は用意したから、運用の方法はユーザーに任せるよ」とのことです。
　　　　　　　なので戦獄スレイヤーと同様にシークレットトークンをGitで管理することも可能です。
　　　　　　　secrets.ymlにはシークレットトークンだけではなく公開したくないAPIキーなど
　　　　　　　の情報を置く場所としても利用できます。

今回は解決策②を採用しました。
