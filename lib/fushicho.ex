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
        create_html(name)
        create_js(name)
     end
   end

   @doc """
   Check  Phoenix file.
   """
    def checkPhoenix() do
      static = File.dir? "web/static/js"
      template = File.dir? "web/templates"
      # both
      static && template
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
      contain = """
      <!-- React -->
      <div id="main"></div>
      """
       IO.binwrite file, contain
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
      contain = """
      import React from 'react'
      import ReactDOM from 'react-dom'
      import request from 'superagent';

      class Hoge extends React.Component {

      }
      """
       IO.binwrite file, contain
       true
    end

     def sum(a, b) do
        a + b
    end
end
