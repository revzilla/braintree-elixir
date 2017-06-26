use Mix.Config

config :braintree,
  environment: :sandbox,
  endpoint: "https://api.sandbox.braintreegateway.com/merchants/",
  merchant_id: System.get_env("BRAINTREE_MERCHANT_ID"),
  public_key: System.get_env("BRAINTREE_PUBLIC_KEY"),
  private_key: System.get_env("BRAINTREE_PRIVATE_KEY")

if File.exists?(Path.join(__DIR__, "#{Mix.env}.exs")), do: import_config "#{Mix.env}.exs"

try do
  import_config "#{Mix.env}.secret.exs"
rescue
  Mix.Config.LoadError -> IO.puts "No secret file for #{Mix.env}"
end
