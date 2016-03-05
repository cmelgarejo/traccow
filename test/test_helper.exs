ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Traccow.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Traccow.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Traccow.Repo)

