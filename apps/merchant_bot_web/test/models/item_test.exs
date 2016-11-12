defmodule MerchantBotWeb.ItemTest do
  use MerchantBotWeb.ModelCase

  alias MerchantBotWeb.Item

  @valid_attrs %{description: "some content", height: "120.5", item_number: "some content", length: "120.5", msrp: "120.5", name: "some content", unit_price: "120.5", width: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Item.changeset(%Item{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Item.changeset(%Item{}, @invalid_attrs)
    refute changeset.valid?
  end
end
