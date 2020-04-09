use Mix.Config
config :current, ecto_repos: [Current.Test.Repo]

config :current, Current.Test.Repo,
  database: "current_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"
