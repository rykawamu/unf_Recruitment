# 写真管理アプリケーション（ツイート機能付き）の作成

## 作成機能の状況

- ログインページの作成: 実装済
- 写真一覧ページの作成:「写真アップロード画面への遷移」を除いて実装
- 写真アップロード画面: 未実装
- ログアウト機能: 実装済
- OAuth認可ページの表示: 未実装
- OAuthアクセストークンの取得: 未実装
- 連携アプリケーションへツイートを投稿: 未実装

## ローカルでの動かし方

### RubyとRailsのバージョン確認

作者のRuby／Ruby on Rails環境は、以下となる。

- Ruby  : ruby 2.7.2p137
- Ruby on Rails : Rails 5.2.4.5

バージョンの確認コマンドは以下となる。

```
$ruby -v
ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin18]

$rails -v
Rails 5.2.4.5
```

完全に一致する必要はないが、Railsは5.2系にすることを推奨する。

また、RubyとRailsのインストールについての説明は割愛する。

### リポジトリからのclone

任意のディレクトリに、リポジトリを`git clone`する。  
以下、ディレクトリ名を「kadai」とした場合の例


```
$ git clone https://github.com/rykawamu/unf_Recruitment.git kadai
```

cloneが成功したら、「kadai」ディレクトリ移動へ移動する。

```
cd kadai
```

### bundle installの実行

プロジェクトで利用しているgemをインストールするために、`bundle install`コマンドを実行する。

```
$ bundle install
``` 

### データベース作成／初期データ投入

動作確認をする前に、データベースの作成と初期データの投入を行う。  
データベースの作成と初期データの投入は`rails`コマンドで実施する。 
なお、データベースは、「SQLite」を利用している。


```
$ rails db:migrate
```

コマンドが成功したら、seedsのデータを投入する。

```
$ rails db:seed
```

コマンドが完了したら、rails consoleコマンドで、実際にデータが投入されているか確認する。
なお、投入されているデータは以下の通り。

- ユーザ（sers）: 4件
- 写真（photos）: 3件

```
$ rails console

irb(main)> User.count
   (0.2ms)  SELECT COUNT(*) FROM "users"
=> 4

irb(main):006:0> Photo.count
   (1.3ms)  SELECT COUNT(*) FROM "photos"
=> 3

```

確認したら、「CTRL + D」を入力して、rails consoleを終了する。

### rails testの実行

`rails test`を実行して、テストが通過することを確認する。  
以下は実行例。「0 failures, 0 errors」であることを確認する。

```
$ rails test

# Running:

.......................

Finished in 4.149419s, 5.5429 runs/s, 7.2299 assertions/s.
23 runs, 30 assertions, 0 failures, 0 errors, 0 skips
```

### アプリケーションの起動

`rails server`コマンドを実行する。

```
$ rails server
```

起動したら、「http://localhost:3000」にアクセスする。  
アクセスすると、「ログイン画面」に遷移する。


### 動作確認

#### ログイン方法

ログイン画面で、ユーザID／パスワードを入力して「ログインする」ボタンをクリックする。  

動作確認用データとして、以下のユーザID／パスワードが使える。

- taro / foobar
- jiro / foobar
- saburo / foobar
- photo / foobar

認証が完了すれば、「Photo List」（写真一覧）の画面に遷移する。

なお、初期データで写真一覧にデータがあるのは、「photo」ユーザのみである。


#### ログアウト方法

ログイン状態状態で、画面中の「Log out」をクリックする。

## 特記事項

- パスワードの暗号化のために、gem「bcrypt」のコメント解除を行なっている。
- 全体的に、画面に対してのスタイル適用は行なっていない。
- 現状では、ログイン画面で入力エラーとなった際には、ユーザIDとパスワードがクリアされてしまう
- ユーザの新規登録もできるが、エラーメッセージの表示が二重に表示される、などの不具合も残っている
