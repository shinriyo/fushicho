defmodule FushichoTest do
  use ExUnit.Case
  doctest Mix.Tasks.Fushicho

  # 名前
  @name "post"

  setup_all do
    IO.puts "now setup_all"

    # テスト用フォルダ
    File.mkdir "web"
    File.mkdir "web/static"
    File.mkdir "web/static/js"
    File.mkdir "web/templates/"
    File.mkdir "web/templates/layout"
    File.mkdir "web/templates/"
    File.mkdir "web/controllers"
    model_path = "web/models"
    File.mkdir model_path
    # ファイル開く
    {:ok, file} = File.open model_path <> "/" <> @name <> ".ex", [:write]
    contain = """
    defmodule Blog.Post do
      use Blog.Web, :model

      schema "posts" do
        field :title, :string
        field :body, :string

        timestamps()
      end

      def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:title, :body])
        |> validate_required([:title, :body])
      end
    end
    """
    IO.binwrite file, contain

    # 後始末
    on_exit fn -> 
      IO.puts "finish"
      # 確認したいときは以下をコメントアウト
      File.rm_rf "web"
    end
  end

  test "check Phoenix project" do
    assert Mix.Tasks.Fushicho.checkPhoenix()
  end

  test "check html scaffolding" do
    assert Mix.Tasks.Fushicho.create_html(@name)
  end

  test "check js scaffolding" do
    assert Mix.Tasks.Fushicho.create_js(@name)
    # assert Fushicho.sum(1, 1) == 2
  end
end
