# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_commerce,
  ecto_repos: [PhoenixCommerce.Repo]

# Configures the endpoint
config :phoenix_commerce, PhoenixCommerce.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sRQgaqMQ9uX5Y/LmOFX8wUgIr7p/cVBOUxwqdUPPh64bl6dFNO16WO4DEXr/iR7T",
  render_errors: [view: PhoenixCommerce.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixCommerce.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
