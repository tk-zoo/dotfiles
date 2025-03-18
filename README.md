## 事前準備
1. OSはアップデートして最新版にしておく
2. sudoがパスワード無しで通るようにする
	sudo visudo
	一番下に、
	user名	ALL = (ALL) NOPASSWD: ALLを追記
3. TouchIDを登録する

## 実施
1. mkdir ~/github
2. cd ~/github
3. git clone https://github.com/tk-zoo/dotfiles.git
	a. xcode developer toolのインストールを求められるので、インストール後に再度実行する
4. dotfile/でmakeする
	- make allで、init.sh　defaults.sh　brew.sh　setup.sh　other_apps.shが順次実行される
	- 以下で個別実行が可能
		- make init
		- make link
		- make defaults
		- make brew
		- make setup
		- make other_apps
	

- init・・・初期設定
- link・・・dotfilesをホームディレクトリにシンボリック張る
- defaults・・・Macのdefaultsコマンドでシステム設定をする
- brew・・・Brewfileに書いたコマンド・アプリをインストールする
- setup・・・コマンド・アプリの設定をする
- other_apps・・・上記で入らないコマンド・アプリをダウンロードしたりwebを開いたりする

## 後始末
1. sudoがパスワード要求されるよう戻す
	sudo visudo
	一番下の
	user名	ALL = (ALL) NOPASSWD: ALLを削除
2. 必要に応じて上記対応外のツール類を手動対応する