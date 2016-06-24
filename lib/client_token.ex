defmodule Braintree.ClientToken do
  @moduledoc """
  Generate a token required by the client SDK to communicate with Braintree.

  For additional reference see:
  https://developers.braintreepayments.com/reference/request/client-token/generate/ruby
  """

  alias Braintree.HTTP
  alias Braintree.ErrorResponse, as: Error

  @doc """
  Create a client token, or return an error response.

  ## Example

      {:ok, client_token} = Braintree.ClientToken.generate()

      client_token # A new client token
  """
  @spec generate(:empty | Map.t) :: {:ok, binary} | {:error, Error.t}
  def generate(params \\ :empty) do
    case HTTP.post("client_token", wrap_params(params)) do
      {:ok, %{"client_token" => client_token}} ->
        {:ok, construct(client_token)}
      {:error, %{"api_error_response" => error}} ->
        {:error, Error.construct(error)}
      {:error, _any} ->
        {:error, Error.construct(%{"message" => "An error occurred."})}
    end
  end

  defp construct(%{"value" => value}), do: value

  defp wrap_params(:empty), do: %{}
  defp wrap_params(params), do: %{client_token: params}
end
