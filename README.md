# edit_test
コミットメッセージ編集のためのテスト
その他なんでもテスト
git flowのテスト

# src
ツタヤ「おみせやさん」プロジェクトソースファイル

# 開発環境

* Ruby 2.2.1
* Rails 4.2.1

# Gitブランチのルール
* master （商用のソースが入ってるリポジトリ。ここにあるソースがリリースされるため常に安定版がプッシュされています）
* release （ステージング環境用。商用確認前のリリース候補版的な位置づけ）
* develop （開発用。ここが最新ソースのリポジトリ。ローカルブランチで作業したものはここにマージしておきます。また差分を取り込む場合もここから）
* feature （ローカルブランチで個人作業用。リモートにはプッシュしません。差分はdevelopからマージ／リベースで取り込みます）

# 管理画面へのアクセス方法
管理画面にログインするためのアカウント名とパスワードは config/settings.yml に書いてある文字列を分解したものになります。
```
(例)  dev-toadmin/A7sGvOtc1l@development:admin
```
アカウント名→dev-toadmin  
パスワード→A7sGvOtc1l  
環境→development(開発)  
権限→admin  
