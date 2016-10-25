# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :merchant_bot_web,
  ecto_repos: [MerchantBotWeb.Repo]

# Configures the endpoint
config :merchant_bot_web, MerchantBotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "O8oJiHkps8tfCraknBfMBzRD0FWZ9o+AVr4U4BkpBcpFbywdorsuihIIUSBCTllW",
  render_errors: [view: MerchantBotWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MerchantBotWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: MerchantBotWeb.User,
  repo: MerchantBotWeb.Repo,
  module: MerchantBotWeb,
  logged_out_url: "/",
  email_from: {"Your Name", "yourname@example.com"},
  opts: [:confirmable, :rememberable, :registerable, :invitable, :authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token]

config :coherence, MerchantBotWeb.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
