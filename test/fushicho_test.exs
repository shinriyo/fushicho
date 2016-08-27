defmodule FushichoTest do
  use ExUnit.Case
  doctest Fushicho

  setup_all do
    IO.puts "now setup_all"
  end

  test "the truth" do
    assert Fushicho.sum(1, 1) == 2
  end
end
