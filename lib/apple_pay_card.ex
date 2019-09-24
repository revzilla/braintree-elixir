defmodule Braintree.ApplePayCard do
  @moduledoc """
  Find, update and delete Cards from ApplePay Accounts using PaymentMethod token
  """

  use Braintree.Construction

  @type t :: %__MODULE__{
        bin: String.t(),
        card_type: String.t(),
        cardholder_name: String.t(),
        created_at: String.t(),
        customer_id: String.t(),
        default?: boolean(),
        expiration_month: String.t(),
        expiration_year: String.t(),
        expired?: boolean(),
        image_url: String.t(),
        last_4: String.t(),
        payment_instrument_name: String.t(),
        source_description: String.t(),
        subscriptions: [any],
        token: String.t(),
        updated_at: String.t()
  }

  defstruct bin: nil,
            card_type: nil,
            cardholder_name: nil,
            created_at: nil,
            customer_id: nil,
            default?: false,
            expiration_month: nil,
            expiration_year: nil,
            expired?: false,
            image_url: nil,
            last_4: nil,
            payment_instrument_name: nil,
            source_description: nil,
            subscriptions: [],
            token: nil,
            updated_at: nil
end
