defmodule FushichoTest do
  use ExUnit.Case
  doctest Fushicho

  setup_all do
    IO.puts "now setup_all"

   # テスト用フォルダ
    File.mkdir "web"
    File.mkdir "web/static"
    File.mkdir "web/static/js"

    on_exit fn ->
      IO.puts "finish"
      # 後始末
      # File.rm_rf "web"
    end
  end

  test "check Phoenix project" do
    IO.puts "check Phoenix project"
    assert Fushicho.checkPhoenix()
  end

  test "check scaffolding" do
    IO.puts "check scaffolding"
    name = "hoge"
    assert Fushicho.new(name)
    # assert Fushicho.sum(1, 1) == 2
  end
end
