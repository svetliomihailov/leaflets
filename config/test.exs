import Config

config :domain, :ecto_repos, [Domain.Repo]

config :domain, Domain.Repo,
  database: "domain_test",
  hostname: "localhost",
  username: "postgres",
  password: "postgres"
