defmodule Stub do
  use Agent

  # Client

  @spec start_link(term()) :: Agent.on_start()
  def start_link(init_arg) do
    Agent.start_link(fn -> init_arg end, name: __MODULE__)
  end

  # State

  @spec update_state(term()) :: :ok
  def update_state(state) do
    Agent.update(__MODULE__, fn _state ->
      state
    end)
  end

  @spec reset_state() :: :ok
  def reset_state do
    update_state([])
  end

  # API calls

  def get(url) do
    state =
      Agent.get(__MODULE__, fn state ->
        state
      end)

    %{url: url, result: state}
  end
end
