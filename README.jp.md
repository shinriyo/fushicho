# Fushicho

**Phoenix用scaffoldingシステム**

## インストール

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. インストールコマンド`mix archive.install`を実行

 例) `mix archive.install https://github.com/shinriyo/fushicho/releases/download/v0.1.0/fushicho_new-0.1.0.ez`

## 使用方法

 1. 対応するAPIを作成しておく

 例) titleとbodyがある
 `mix phoenix.gen.json Post posts title:string body:text`

 2. fushichoを実行

## 貢献

  1. テストするのは`mix test`

  `web/static/js/`のフォルダが一瞬作られて後で消してくれます。
  必ず一回通してください。

 初期化は`--init`
  `mix fushicho --init`

 nameはmodelの単数形である。
 実際の実行は引数`name`
  `mix fushicho name`

 2. ビルドするのは`mix archive.build`で、インストールは`mix archive.install`

 ezファイルを作成される。
 例) `fushicho-0.1.0.ez`が生成される。

  `mix archive.install`する。
 例) `mix archive.install fushicho-0.1.0.ez`

 3. アンインストールするのは`mix archive.uinstall`

 バージョン指定必須。コマンド後に`Y`を選択。
 例) `mix archive.uninstall fushicho-0.1.0`

## ライセンス

 MITライセンスに従います
