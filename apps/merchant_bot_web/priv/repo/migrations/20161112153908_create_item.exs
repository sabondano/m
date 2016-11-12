defmodule MerchantBotWeb.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :item_number, :string
      add :name, :string
      add :description, :text
      add :unit_price, :decimal, scale: 2
      add :msrp, :decimal, scale: 2
      add :length, :decimal, scale: 2
      add :width, :decimal, scale: 2
      add :height, :decimal, scale: 2
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:items, [:user_id])

  end
end
