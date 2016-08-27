defmodule Fushicho do
    # Phoenixあるかチェック
    def checkPhoenix() do
        File.dir? "web/static/js"
    end

     def sum(a, b) do
        a + b
    end

   def new(name) do
      path = "web/static/js/"
      filename = path <> name <> ".js"
       # ファイル開く
       {:ok, file} = File.open filename, [:write]
        IO.binwrite file, "world"
        true
    end
end
