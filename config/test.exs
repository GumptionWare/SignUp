import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :sign_up, SignUp.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "sign_up_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sign_up, SignUpWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "i1K/NmvZaP6qqzr0Y1WI4yJ+8JnKVO0e/jfP4RJZ2QgdSAEl4b4V/VHcD0z+3X9L",
  server: false

# In test we don't send emails.
config :sign_up, SignUp.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
