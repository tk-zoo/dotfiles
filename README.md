1. OSはアップデートして最新版にしておく
2. リポジトリを新しいMacにZipダウンロードする
	- curl -L -o main.zip https://github.com/tk-zoo/dotfiles/archive/refs/heads/main.zip
3. ダウンロードしたZipを好みのディレクトリに移動する
4. dotfile/.bin/以下の.shファイルに対して、chmod +xして実行権限をつける
	- chmod +x .bin/*.sh
5. dotfile/でmakeする
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