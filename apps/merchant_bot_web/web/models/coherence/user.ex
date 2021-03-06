defmodule MerchantBotWeb.User do
  use MerchantBotWeb.Web, :model
  use Coherence.Schema

  schema "users" do
    field :name, :string
    field :email, :string
    coherence_schema

    has_many :items, MerchantBotWeb.Item
    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :email] ++ coherence_fields)
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
    |> validate_coherence(params)
  end
end
