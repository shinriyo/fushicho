defmodule Fushicho do
  @moduledoc """
  Provides math-related functions.

  ## Examples

      iex> Fushicho.sum(1, 2)
      3

   """

   @doc """
   Check  Phoenix file.
   """
    def checkPhoenix() do
        File.dir? "web/static/js"
    end

     def sum(a, b) do
        a + b
    end

   @doc """
   Create React's js file.
   """
   def new(name) do
      path = "web/static/js/"
      filename = path <> name <> ".js"
       # ファイル開く
       {:ok, file} = File.open filename, [:write]
        IO.binwrite file, "world"
        true
    end
end
