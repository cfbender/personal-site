import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :personal_site, PersonalSiteWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "0Ho3Si79CMhY/L9F3r0mLJn69v73o8viJATVCcEOXE9Orh6fR/uY+HQXqma+inaw",
  server: false

# In test we don't send emails.
config :personal_site, PersonalSite.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
