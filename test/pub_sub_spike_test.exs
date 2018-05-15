defmodule PubSubSpikeTest do
  use ExUnit.Case
  alias Event
  alias Phoenix.PubSub

  test "publish and receive" do
    {:ok, _pid} = EventSubscriber.Supervisor.start_link()

    # {:ok, _pid} = EventSubscriber.start_link([])     
    PubSub.subscribe(EventSubscriber.PubSub, "all")

    %Event{} |> Publisher.event()
    assert_received {"all", :completed, %Event{content: "something wonderful", name: "alert"}}
  end
end
