import Config

config :domain, Domain.Repo,
  ecto_repos: [],
  database: "domain_test",
  hostname: "localhost",
  username: "postgres",
  password: "postgres"
