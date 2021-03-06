# [**Flutter #2 Advent Calendar 2020**](https://qiita.com/advent-calendar/2020/flutter-2)

### 12月01日 [Flutter 開発リポジトリにシークレット情報を保管させない。](https://cch-robo.github.io/memojudge_with_secret_consideration/index.html)

このリポジトリは、  
[Flutter Meetup Osaka #4 - 2020/11/27](https://flutter-jp.connpass.com/event/192795/) - LT発表 [フラッター開発でのシークレット情報取扱考察](https://www2.slideshare.net/cch-robo/ss-239527695) の [考察検証リポジトリ](https://github.com/cch-robo/memojudge_with_secret_consideration) です。  
GitHub **リポジトリに秘匿情報を commit させない** で、ビルド前に **ビルド環境内で秘匿情報ファイルを復元** させて、  
`$ flutter run` コマンド実行時に、復元した秘匿情報ファイルを伴なわせてビルドさせるためのサンプルを提供します。  

リポジトリの [GitHub Pages](https://docs.github.com/ja/free-pro-team@latest/github/working-with-github-pages/about-github-pages) で、  
Flutter開発における [リポジトリでのシークレット情報取扱考察](https://www2.slideshare.net/cch-robo/ss-239527695) の [考察検証](https://github.com/cch-robo/memojudge_with_secret_consideration) についてを説明しています。  

- *本当のシークレット情報をサンプルとして提供する訳には行きませんので、*  
*具体的には、 `$ flutter run` で実行した際のアプリ名 `memojudge` が、*  
*環境変数にパスワード内容等を設定すれば、*  
*リポジトリ内に存在しない別名称 `記憶力判定` などでビルドされるサンプルを提供します。*


- 考察検証リポジトリとシークレット情報取扱の資料について。  
考察検証リポジトリのコードやスクリプトおよびコンテンツは [BSD-3-Clause License ライセンス](https://github.com/cch-robo/memojudge_with_secret_consideration/blob/master/LICENSE) に則り、  
自由に御利用ください。  

  - [考察検証リポジトリ](https://github.com/cch-robo/memojudge_with_secret_consideration)  
  [https://github.com/cch-robo/memojudge_with_secret_consideration](https://github.com/cch-robo/memojudge_with_secret_consideration)

  - [リポジトリでのシークレット情報取扱考察](https://www2.slideshare.net/cch-robo/ss-239527695) テキスト  
  [https://www2.slideshare.net/cch-robo/ss-239527695](https://www2.slideshare.net/cch-robo/ss-239527695)

  - [リポジトリでのシークレット情報取扱考察検証](https://cch-robo.github.io/memojudge_with_secret_consideration/) テキスト  
  [https://cch-robo.github.io/memojudge_with_secret_consideration/](https://cch-robo.github.io/memojudge_with_secret_consideration/)


- サンプルアプリは、 [DevFest 2020 セッション](https://tokyo.gdgjapan.org/devfest2020/schedule/2/205) で発表したミニゲームをベースにしています。  
[リポジトリ](https://github.com/cch-robo/DevFest-Kyoto-2020) の GitHubページには、 [講座テキスト](https://cch-robo.github.io/DevFest-Kyoto-2020/index.html) もありますので、よろしければ こちらも御参照ください。  
　  
講座テキスト内容は、ステップごとにアプリのコードを追加改修していきながら、  
画面の部分更新やアニメーションやタイマーの使い方の基本を学ぶ形式になっています。  
ライブラリも使いますが、学んだ基本知識を応用して、ボタン操作のイベントやタイマーを使った自動処理で、  
アニメーションを伴ったリアクションを返す画面を作る考え方を伝え、最終的に簡単なゲームアプリを作ります。  
　  
このリポジトリのコードやスクリプトおよびコンテンツも [BSD-3-Clause License ライセンス](https://github.com/cch-robo/DevFest-Kyoto-2020/blob/master/LICENSE) に則り、  
自由に御利用ください。  

|![ミニゲーム・デモ](docs/images/minigame-demo.gif)|
|------------|

  - [Flutter初心者向け講座（ミニゲームを作ろう）](https://tokyo.gdgjapan.org/devfest2020/schedule/2/205)  
  [https://tokyo.gdgjapan.org/devfest2020/schedule/2/205](https://tokyo.gdgjapan.org/devfest2020/schedule/2/205)

  - [講座リポジトリ](https://github.com/cch-robo/DevFest-Kyoto-2020)  
  [https://github.com/cch-robo/DevFest-Kyoto-2020](https://github.com/cch-robo/DevFest-Kyoto-2020)

  - [講座テキスト](https://cch-robo.github.io/DevFest-Kyoto-2020/index.html)  
  [https://cch-robo.github.io/DevFest-Kyoto-2020/index.html](https://cch-robo.github.io/DevFest-Kyoto-2020/index.html)

