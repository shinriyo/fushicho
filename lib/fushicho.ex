defmodule Mix.Tasks.Fushicho do
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
      IO.puts (inspect args)
   end

   @doc """
   Check  Phoenix file.
   """
    def checkPhoenix() do
        File.dir? "web/static/js"
    end

  @doc """
   Create index.html.eex file.
   """
   def create_html(name) do
      path = "web/templates"
      # フォルダ作る
      File.mkdir path <> "/" <> name
       # ファイル開く
      {:ok, file} = File.open path <> "/" <> name <> "/index.html.eex", [:write]
       IO.binwrite file, "htmlファイル"
      true
   end

   @doc """
   Create React's js file.
   """
   def create_js(name) do
      path = "web/static/js/"
      filename = path <> name <> ".js"
       # ファイル開く
       {:ok, file} = File.open filename, [:write]
        IO.binwrite file, "jsファイルだ"
        true
    end

     def sum(a, b) do
        a + b
    end
end
