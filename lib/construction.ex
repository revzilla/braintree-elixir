defmodule Braintree.Construction do
  defmacro __using__(_) do
    quote do
      import Braintree.Util, only: [atomize: 1]

      @doc """
      Convert a response into one or more typed structs.
      """
      @spec construct(Map.t | [Map.t]) :: t | [t]
      def construct(params) when is_map(params) do
        struct(__MODULE__, atomize(params))
      end
      def construct(params) when is_list(params) do
        Enum.map(params, &construct/1)
      end

      defoverridable [construct: 1]
    end
  end
end
