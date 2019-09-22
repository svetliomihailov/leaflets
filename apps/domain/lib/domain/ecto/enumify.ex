defmodule Domain.Ecto.Enumify do
  defmacro __using__(opts) do
    alias Domain.Ecto.Enumify

    Enumify.validate_input(__MODULE__, opts)

    quote bind_quoted: [opts: opts] do
      @behaviour Ecto.Type

      def type, do: :integer

      @string_keys Enum.map(Keyword.keys(opts), &Atom.to_string/1)

      def hr_keys, do: @string_keys

      # Provide custom casting rules.
      for {key, value} <- opts, input <- Enum.uniq([key, Atom.to_string(key), value]) do
        def cast(unquote(input)), do: {:ok, unquote(key)}
      end

      # Everything else is a failure though
      def cast(_), do: :error

      # When dumping data to the database, we *expect* only a key as an atom or a
      # string or the integer value at runtime.
      for {key, value} <- opts, input <- Enum.uniq([key, Atom.to_string(key), value]) do
        def dump(unquote(input)), do: {:ok, unquote(value)}
      end

      def dump(_), do: :error

      for {key, value} <- opts do
        def load(unquote(value)), do: {:ok, unquote(key)}
      end

      def equal?(term_a, term_b), do: equal_casts?(cast(term_a), cast(term_b))

      defp equal_casts?({:ok, value_a}, {:ok, value_b}), do: value_a == value_b
      defp equal_casts?(_, _), do: false

      # Can be :self or :dump.
      def embed_as(_), do: :self
    end
  end

  def validate_input(module, opts) do
    case Keyword.keyword?(opts) do
      false ->
        error(module)

      true ->
        Enum.all?(opts, fn {_key, value} -> is_integer(value) end) or error(module)
    end
  end

  defp error(module) do
    raise "The given options for #{module} must be a keyword list with integer values only"
  end
end
