defmodule FushichoTest do
  use ExUnit.Case
  doctest Mix.Tasks.Fushicho

  setup_all do
    IO.puts "now setup_all"

   # テスト用フォルダ
    File.mkdir "web"
    File.mkdir "web/static"
    File.mkdir "web/static/js"
    File.mkdir "web/templates/"

    # 後始末
    on_exit fn ->
      IO.puts "finish"
      File.rm_rf "web"
    end
  end

  test "check Phoenix project" do
    assert Mix.Tasks.Fushicho.checkPhoenix()
  end

  test "check html scaffolding" do
    name = "hoge"
    assert Mix.Tasks.Fushicho.create_html(name)
  end

  test "check js scaffolding" do
    name = "hoge"
    assert Mix.Tasks.Fushicho.create_js(name)
    # assert Fushicho.sum(1, 1) == 2
  end
end
