事前準備
1. OSはアップデートして最新版にしておく
2. sudoがパスワード無しで通るようにする
	sudo visudo
	一番下に
	user名	ALL = (ALL) NOPASSWD: ALLを追記

実施
1. リポジトリを新しいMacにZipダウンロードする
	- curl -L -o main.zip https://github.com/tk-zoo/dotfiles/archive/refs/heads/main.zip
2. ダウンロードしたZipを好みのディレクトリに移動する
3. dotfile/.bin/以下の.shファイルに対して、chmod +xして実行権限をつける
	- chmod +x .bin/*.sh
4. dotfile/でmakeする
	- make allで、init.sh　brew.sh　defaults.sh　setup.sh　other_apps.shが順次実行される
	- 以下で個別実行が可能
		- make init
		- make link
		- make brew
		- make defaults
		- make setup
		- make other_apps

- init・・・初期設定
- link・・・dotfilesをホームディレクトリにシンボリック張る
- brew・・・Brewfileに書いたコマンド・アプリをインストールする
- defaults・・・Macのdefaultsコマンドでシステム設定をする
- setup・・・コマンド・アプリの設定をする
- other_apps・・・上記で入らないコマンド・アプリをダウンロードしたりwebを開いたりする

後始末
1. sudoがパスワード要求されるよう戻す
	sudo visudo
	一番下の
	user名	ALL = (ALL) NOPASSWD: ALLを削除
