# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MerchantBotWeb.Repo.insert!(%MerchantBotWeb.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
MerchantBotWeb.Repo.delete_all MerchantBotWeb.User

MerchantBotWeb.User.changeset(%MerchantBotWeb.User{},
                              %{name: "Test User",
                                email: "testuser@example.com",
                                password: "secret",
                                password_confirmation: "secret"})
|> MerchantBotWeb.Repo.insert!
|> Coherence.ControllerHelpers.confirm!
