## 事前準備
1. OSはアップデートして最新版にしておく
2. sudoがパスワード無しで通るようにする
	sudo visudo
	一番下に、
	user名	ALL = (ALL) NOPASSWD: ALLを追記
3. TouchIDを登録する

## 実施
1. リポジトリを新しいMacにZipダウンロードする
	- curl -L -o main.zip https://github.com/tk-zoo/dotfiles/archive/refs/heads/main.zip
2. ダウンロードしたZipを好みのディレクトリに移動する
3. dotfile/.bin/以下の.shファイルに対して、chmod +xして実行権限をつける
	- chmod +x .bin/*.sh
4. dotfile/でmakeする
	- 初めてだと、xcode developer toolのインストールを求められるので、インストール後に再度makeする
	- make allで、init.sh　brew.sh　defaults.sh　setup.sh vscode.sh　other_apps.shが順次実行される
	- 以下で個別実行が可能
		- make init
		- make link
		- make brew
		- make defaults
		- make setup
		- make vscode
		- make other_apps
	

- init・・・初期設定
- link・・・dotfilesをホームディレクトリにシンボリック張る
- brew・・・Brewfileに書いたコマンド・アプリをインストールする
- defaults・・・Macのdefaultsコマンドでシステム設定をする
- setup・・・コマンド・アプリの設定をする
- vscode・・・Visual Studio Codeの設定をする
- other_apps・・・上記で入らないコマンド・アプリをダウンロードしたりwebを開いたりする

## 後始末
1. sudoがパスワード要求されるよう戻す
	sudo visudo
	一番下の
	user名	ALL = (ALL) NOPASSWD: ALLを削除
2. 以下は手動対応
	- システム環境設定
		- デスクトップとDock
			-　壁紙をクリックしてデスクトップを表示＞ステージマネージャ使用時のみ
	- Finder
		- サイドバー
			- 最近の項目	Off
			- Home	On
	- ウインドウ
		- リストカラムに追加日を追加
	- プリンタ
		- オフィス（物理）
		- オフィス（WeWork）
		- 自宅
	- chrome機能拡張
		- 1password	https://chrome.google.com/webstore/detail/aapbdbdomjkkjkaonfhkkikfgjllcleb
		- Authenticator	https://chromewebstore.google.com/detail/authenticator/bhghoamapcdpbohphigoooaddinpkbai
		- Checker Plus for Gmail	https://chromewebstore.google.com/detail/checker-plus-for-gmail/oeopbcgkkoapgobdbedcemjljbihmemj
		- Checker Plus for Google Calendar	https://chromewebstore.google.com/detail/checker-plus-for-google-c/hkhggnncdpfibdhinjiegagmopldibha
		- DeepL https://chromewebstore.google.com/detail/deepl%EF%BC%9Aai%E7%BF%BB%E8%A8%B3%E3%81%A8%E6%96%87%E7%AB%A0%E4%BD%9C%E6%88%90%E3%83%84%E3%83%BC%E3%83%AB/cofdbpoegempjloogbagkncekinflcnj
		- G-calize	https://chromewebstore.google.com/detail/g-calize/piiljfhidimfponnkjlkecnpjhdijfde
		- Google 翻訳	https://chromewebstore.google.com/detail/google-%E7%BF%BB%E8%A8%B3/aapbdbdomjkkjkaonfhkkikfgjllcleb
		- Keepa	https://chromewebstore.google.com/detail/keepa-amazon-price-tracke/neebplgakaahbhdphmkckjjcegoiijjo
		- Keeper	https://chromewebstore.google.com/detail/keeper%C2%AE-%E3%83%91%E3%82%B9%E3%83%AF%E3%83%BC%E3%83%89%E3%83%9E%E3%83%8D%E3%83%BC%E3%82%B8%E3%83%A3%E3%83%BC-%E3%83%87%E3%82%B8%E3%82%BF%E3%83%AB%E3%83%9C/bfogiafebfohielmmehodmfbbebbbpei
		- My Apps Secure Sign-in Extension	https://chromewebstore.google.com/detail/my-apps-secure-sign-in-ex/ggjhpefgjjfobnfoldnjipclpcfbgbhl
		- Neutral Face Emoji Tools	https://chromewebstore.google.com/detail/neutral-face-emoji-tools/anchoacphlfbdomdlomnbbfhcmcdmjej
		- Salesforce	https://chromewebstore.google.com/detail/salesforce/jjghhkepijgakdammjldcbnjehfkfmha
		- Salesforce DevTools	https://chromewebstore.google.com/detail/salesforce-devtools/ehgmhinnhggigkogkbhnbodhbfjgncjf
		- Slack Channels Grouping	https://chromewebstore.google.com/detail/slack-channels-grouping/lcbnhfianneihfgkmfncnhpkpghedbkm
		- uBlock Origin	https://chromewebstore.google.com/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
		- URL Shortener for Amazon	https://chromewebstore.google.com/detail/url-shortener-for-amazon/ipafcflbnpkfahilfblbenfabkoaaiid
		- Wayback Machine	https://chromewebstore.google.com/detail/wayback-machine/fpnmgdkabkmnadcjpehmlllkndpkmiak
		- その本、図書館にあります。	https://chromewebstore.google.com/detail/%E3%81%9D%E3%81%AE%E6%9C%AC%E3%80%81%E5%9B%B3%E6%9B%B8%E9%A4%A8%E3%81%AB%E3%81%82%E3%82%8A%E3%81%BE%E3%81%99%E3%80%82/ldidobiipljjgfaglokcehmiljadanle
		- FireShot	https://chromewebstore.google.com/detail/%E3%82%A6%E3%82%A7%E3%83%96%E3%83%9A%E3%83%BC%E3%82%B8%E5%85%A8%E4%BD%93%E3%82%92%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88-firesh/mcbpblocgmgfnpjjppndjkmgjaogfceg
		- 絵文字ジェネレーター	https://chromewebstore.google.com/detail/%E7%B5%B5%E6%96%87%E5%AD%97%E3%82%B8%E3%82%A7%E3%83%8D%E3%83%AC%E3%83%BC%E3%82%BF%E3%83%BC/ghbhakkknnmocmiilhneahbkiaegdnmf/related
		