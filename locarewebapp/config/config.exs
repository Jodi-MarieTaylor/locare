# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :locarewebapp,
  ecto_repos: [Locarewebapp.Repo]

# Configures the endpoint
config :locarewebapp, Locarewebapp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aZ4HdX0wRueSVARjaKC5q2y+nPRgneQBgilf3+pQr+IWok1s245WIv/9pckzhsI2",
  render_errors: [view: Locarewebapp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Locarewebapp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
