defmodule Fushicho do
    # Phoenixあるかチェック
    def checkPhoenix() do
        File.dir? "web/static/js"
    end

     def sum(a, b) do
        a + b
    end
end
