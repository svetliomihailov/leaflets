import Config

config :domain, Domain.Repo,
  ecto_repos: [],
  database: "domain_production",
  hostname: "localhost",
  username: "postgres",
  password: "postgres"
