defmodule MerchantBotWeb.Item do
  use MerchantBotWeb.Web, :model

  schema "items" do
    field :item_number, :string
    field :name, :string
    field :description, :string
    field :unit_price, :decimal
    field :msrp, :decimal
    field :length, :decimal
    field :width, :decimal
    field :height, :decimal
    belongs_to :user, MerchantBotWeb.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:item_number, :name, :description, :unit_price, :msrp, :length, :width, :height])
    |> validate_required([:item_number, :name, :description, :unit_price, :msrp, :length, :width, :height])
  end
end
