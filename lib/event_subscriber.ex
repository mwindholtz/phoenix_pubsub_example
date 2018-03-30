defmodule EventSubscriber do
  use GenServer
  alias Event
  alias Phoenix.PubSub

  def start_link(_, name \\ __MODULE__) do
    IO.inspect("EventSubscriber start_link")
    GenServer.start_link(__MODULE__, [], name: name)
  end

  def subscribe do
    IO.inspect("EventSubscriber subscribing")
    PubSub.subscribe(EventSubscriber.PubSub, "all")
    IO.inspect("EventSubscriber subscribed")
  end

  def init(state) do
    IO.inspect("EventSubscriber initing")
    IO.inspect(EventSubscriber.subscribe())
    IO.inspect("EventSubscriber inited")
    {:ok, state}
  end

  def handle_info({_topic, _name, %Event{} = event}, state) do
    IO.puts("EVENT RECEIVED #{inspect(event)}")
    {:noreply, state}
  end
end
