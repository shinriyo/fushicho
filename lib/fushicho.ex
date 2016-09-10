defmodule Mix.Tasks.Fushicho do
  # for calling local methods
  use Mix.Task

  @moduledoc """
  Provides math-related functions.

  ## Examples

      iex> Mix.Tasks.Fushicho.sum(1, 2)
      3

   """

  @shortdoc "My mix command sample"

   @doc """
  Run task. 
   """
   def run(args) do
     IO.puts ("Scaffolding...")
     unless checkPhoenix() do
        IO.puts ("no phoenix project...")
     else
        name = Enum.at(args, 0)
        if name == "--init" do
          initReact()
        else
          create_html(name)
          create_js(name)
        end
     end
   end

  @doc """
  Initialization
  """
  def initReact() do
    IO.puts ("initialize...")
    contain = """
    /* This file is for your main application css. */
    @media (min-width: 550px) {
        .container  { max-width: 1400px; }
    }
    """
    css = "web/static/assets/css/app.css"
    {:ok, file} = File.open css, [:write]
    IO.binwrite file, contain

   # あとでファイルにしたい
   css_spinner = """
    /* Absolute Center CSS Spinner */
    .loading {
      position: fixed;
      z-index: 999;
      height: 2em;
      width: 2em;
      overflow: show;
      margin: auto;
      top: 0;
      left: 0;
      bottom: 0;
      right: 0;
    }

    /* Transparent Overlay */
    .loading:before {
      content: '';
      display: block;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0,0,0,0.3);
    }

    /* :not(:required) hides these rules from IE9 and below */
    .loading:not(:required) {
      /* hide "loading..." text */
      font: 0/0 a;
      color: transparent;
      text-shadow: none;
      background-color: transparent;
      border: 0;
    }

    .loading:not(:required):after {
      content: '';
      display: block;
      font-size: 10px;
      width: 1em;
      height: 1em;
      margin-top: -0.5em;
      -webkit-animation: spinner 1500ms infinite linear;
      -moz-animation: spinner 1500ms infinite linear;
      -ms-animation: spinner 1500ms infinite linear;
      -o-animation: spinner 1500ms infinite linear;
      animation: spinner 1500ms infinite linear;
      border-radius: 0.5em;
      -webkit-box-shadow: rgba(0, 0, 0, 0.75) 1.5em 0 0 0, rgba(0, 0, 0, 0.75) 1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) 0 1.5em 0 0, rgba(0, 0, 0, 0.75) -1.1em 1.1em 0 0, rgba(0, 0, 0, 0.5) -1.5em 0 0 0, rgba(0, 0, 0, 0.5) -1.1em -1.1em 0 0, rgba(0, 0, 0, 0.75) 0 -1.5em 0 0, rgba(0, 0, 0, 0.75) 1.1em -1.1em 0 0;
      box-shadow: rgba(0, 0, 0, 0.75) 1.5em 0 0 0, rgba(0, 0, 0, 0.75) 1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) 0 1.5em 0 0, rgba(0, 0, 0, 0.75) -1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) -1.5em 0 0 0, rgba(0, 0, 0, 0.75) -1.1em -1.1em 0 0, rgba(0, 0, 0, 0.75) 0 -1.5em 0 0, rgba(0, 0, 0, 0.75) 1.1em -1.1em 0 0;
    }

    /* Animation */

    @-webkit-keyframes spinner {
      0% {
        -webkit-transform: rotate(0deg);
        -moz-transform: rotate(0deg);
        -ms-transform: rotate(0deg);
        -o-transform: rotate(0deg);
        transform: rotate(0deg);
      }
      100% {
        -webkit-transform: rotate(360deg);
        -moz-transform: rotate(360deg);
        -ms-transform: rotate(360deg);
        -o-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }
    @-moz-keyframes spinner {
      0% {
        -webkit-transform: rotate(0deg);
        -moz-transform: rotate(0deg);
        -ms-transform: rotate(0deg);
        -o-transform: rotate(0deg);
        transform: rotate(0deg);
      }
      100% {
        -webkit-transform: rotate(360deg);
        -moz-transform: rotate(360deg);
        -ms-transform: rotate(360deg);
        -o-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }
    @-o-keyframes spinner {
      0% {
        -webkit-transform: rotate(0deg);
        -moz-transform: rotate(0deg);
        -ms-transform: rotate(0deg);
        -o-transform: rotate(0deg);
        transform: rotate(0deg);
      }
      100% {
        -webkit-transform: rotate(360deg);
        -moz-transform: rotate(360deg);
        -ms-transform: rotate(360deg);
        -o-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }
    @keyframes spinner {
      0% {
        -webkit-transform: rotate(0deg);
        -moz-transform: rotate(0deg);
        -ms-transform: rotate(0deg);
        -o-transform: rotate(0deg);
        transform: rotate(0deg);
      }
      100% {
        -webkit-transform: rotate(360deg);
        -moz-transform: rotate(360deg);
        -ms-transform: rotate(360deg);
        -o-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }
    """
    css_spinner_path = "web/static/assets/css/cssloader.css"
    {:ok, file} = File.open css_spinner_path, [:write]
    IO.binwrite file, css_spinner
    message = """
    you should add them to your app.html.eex,

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.2.0/normalize.min.css" integrity="sha256-K3Njjl2oe0gjRteXwX01fQD5fkk9JFFBdUHy/h38ggY=" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.min.css" integrity="sha256-2YQRJMXD7pIAPHiXr0s+vlRWA7GYJEK0ARns7k2sbHY=" crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css" href="/js/jquery-ui-1.10.3.custom/css/sunny/jquery-ui-1.10.3.custom.min.css" />
    <link rel="stylesheet" href="<%= static_path(@conn, "/css/cssloader.css") %>">
    """
    IO.puts(message)
  end

   @doc """
   Check  Phoenix file.
  """
  def checkPhoenix() do
     static = File.dir? "web/static/js"
     templates = File.dir? "web/templates"
     layout = File.dir? "web/templates/layout"
     controllers = File.dir? "web/controllers"
     models = File.dir? "web/models"
     # both
     static && templates && layout  && controllers && models
   end

  @doc """
   Create index.html.eex file.
   """
   def create_html(name) do
      path = "web/templates"
      # フォルダ作る
      # File.mkdir path <> "/" <> name
      # ファイル開く
      {:ok, file} = File.open path <> "/" <> name <> ".html.eex", [:write]
      # ~sの部分が置換される
      contain = """
      <script src="<%= static_path(@conn, "/js/~s.js") %>"></script>
      """
      # 修正
      fix = :io_lib.format(contain, [name])
      IO.binwrite file, fix
      true
   end

   @doc """
   Create React's js file.
   """
   def create_js(name) do
     # modelファイル確認
     model_file = "web/models/" <> name <> ".ex"
     is_file_exist = File.exists?(model_file)
     unless is_file_exist do
        IO.puts ("no model file...")
        IO.puts (model_file)
        false
     else
        contain = File.read! model_file
        # ex) field :title, :string
        reg = ~r/.*field :(.*),/U
        cap = Regex.scan(reg, contain)
        # 展開しながら
        named_reg = ~r/.*feld :(?<fiels>.*?),/U
        # fieldのキー
        # Enum.map(cap, fn(x) -> IO.puts Enum.at(x, 1)  end)
        list  = Enum.map(cap, fn(x) -> Enum.at(x, 1)  end)
        # filedのlistが生成される
        # これが実際のモデルのフィールドに相当する
        IO.inspect list

        # 実際にjs
        path = "web/static/js/"
        filename = path <> name <> ".js"
        # ファイル開く
        {:ok, file} = File.open filename, [:write]

        # Reactコードの中身
        # ~sの部分が置換される
        capitalized = String.capitalize(name)
        contain = """
        import React from 'react'
        import ReactDOM from 'react-dom'
        import request from 'superagent';

        class ~s extends React.Component {
        ~s
        }
        """
        # 修正
        fix = :io_lib.format(contain, [capitalized, name])
        # IO.binwrite file, fix
        IO.puts(fix)
        true
     end
    end

     def sum(a, b) do
        a + b
    end
end
