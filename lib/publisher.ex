defmodule Publisher do
  alias Event
  alias Phoenix.PubSub

  def event(%Event{} = event) do
    IO.inspect("Publisher broadcasting event")
    broadcast({"all", :completed, event})
    IO.inspect("Publisher event broadcasted")
    {:ok, event}
  end

  defp broadcast({topic, name, event}) do
    PubSub.broadcast(EventSubscriber.PubSub, "all", {topic, name, event})
  end
end
