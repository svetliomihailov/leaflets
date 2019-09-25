import Config
config :domain, :ecto_repos, [Domain.Repo]

config :domain, Domain.Repo,
  database: "domain_production",
  hostname: System.get_env("DOMAIN_DB_HOST"),
  username: System.get_env("DOMAIN_DB_USERNAME"),
  password: System.get_env("DOMAIN_DB_PASSWORD")
