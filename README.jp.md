# Fushicho

**Phoenix用scaffoldingシステム**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `fushicho` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:fushicho, "~> 0.1.0"}]
    end
    ```

  2. Ensure `fushicho` is started before your application:

    ```elixir
    def application do
      [applications: [:fushicho]]
    end
    ```

   mix archive.install https://github.com/shinriyo/fushicho/releases/download/v0.1.0/fushicho_new-0.1.0.ez

## 貢献

  1. テストするのは`mix test`

  `web/static/js/`のフォルダが一瞬作られて後で消してくれます。
  必ず一回通してください。

 2. ビルドするのは`mix archive.build`

 ezファイルを作成される。
 例) fushicho-0.1.0.ezが生成される。

 `mix archive.install`する。
例 ) mix archive.install fushicho-0.1.0.ez