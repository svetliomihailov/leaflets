import Config

config :domain, Domain.Repo,
  ecto_repos: [],
  database: "domain_development",
  hostname: "localhost",
  username: "postgres",
  password: "postgres"
