defmodule Event do
  defstruct name: "alert",
            content: "something wonderful"

  def new(name, content) do
    %Event{name: name, content: content}
  end
end
