import Config

config :domain, :ecto_repos, [Domain.Repo]

config :domain, Domain.Repo,
  database: "domain_development",
  hostname: "localhost",
  username: "postgres",
  password: "postgres"
