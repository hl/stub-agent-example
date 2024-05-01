defmodule StubTest do
  use ExUnit.Case

  setup do
    start_link_supervised!(Stub)
    :ok
  end

  test "call stub and return an empty result" do
    %{result: [], url: "/dummy"} = Stub.get("/dummy")
  end

  test "call stub and return a list as result" do
    list = [1, 2, 3]
    Stub.update_state(list)

    %{result: ^list} = Stub.get("/dummy")
  end

  test "call stub and return an empty result after a reset" do
    list = [1, 2, 3]
    Stub.update_state(list)
    Stub.reset_state()

    %{result: [], url: "/dummy"} = Stub.get("/dummy")
  end
end
