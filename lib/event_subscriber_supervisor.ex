defmodule EventSubscriber.Supervisor do
  @moduledoc false

  use Supervisor

  #
  # client
  #

  def start_link() do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def start_link([]), do: start_link()

  #
  # callbacks
  #

  def init(:ok) do
    Supervisor.init(children(), strategy: :one_for_one)
  end

  #
  # private
  #

  defp children() do
    [
      supervisor(Phoenix.PubSub.PG2, [EventSubscriber.PubSub, []])
    ]
  end
end
