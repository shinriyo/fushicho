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
    css = "web/static/css/app.css"
    {:ok, file} = File.open css, [:write]
    IO.binwrite file, contain
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
