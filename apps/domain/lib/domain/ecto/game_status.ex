defmodule Domain.Ecto.GameStatus do
  use Domain.Ecto.Enumify, new: 0, setup: 1, playing: 2, finished: 3
end
