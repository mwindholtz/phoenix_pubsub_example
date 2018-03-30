defmodule PubSubSpikeTest do
  use ExUnit.Case
  doctest PubSubSpike

  test "greets the world" do
    assert PubSubSpike.hello() == :world
  end
end
