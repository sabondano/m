defmodule MerchantBotWeb.ItemController do
  use MerchantBotWeb.Web, :controller

  alias MerchantBotWeb.Item

  def index(conn, _params) do
    items =
      Coherence.current_user(conn)
      |> user_items()
      |> Repo.all()

    render(conn, "index.html", items: items)
  end

  def new(conn, _params) do
    changeset =
      Coherence.current_user(conn)
      |> build_assoc(:items)
      |> Item.changeset()

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"item" => item_params}) do
    changeset =
      Coherence.current_user(conn)
      |> build_assoc(:items)
      |> Item.changeset(item_params)

    case Repo.insert(changeset) do
      {:ok, _item} ->
        conn
        |> put_flash(:info, "Item created successfully.")
        |> redirect(to: item_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    item =
      Coherence.current_user(conn)
      |> user_items()
      |> Repo.get!(id)

    render(conn, "show.html", item: item)
  end

  def edit(conn, %{"id" => id}) do
    item = Coherence.current_user(conn)
      |> user_items()
      |> Repo.get!(id)

    changeset = Item.changeset(item)
    render(conn, "edit.html", item: item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item =
      Coherence.current_user(conn)
      |> user_items()
      |> Repo.get!(id)

    changeset = Item.changeset(item, item_params)

    case Repo.update(changeset) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item updated successfully.")
        |> redirect(to: item_path(conn, :show, item))
      {:error, changeset} ->
        render(conn, "edit.html", item: item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item =
      Coherence.current_user(conn)
      |> user_items()
      |> Repo.get!(id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(item)

    conn
    |> put_flash(:info, "Item deleted successfully.")
    |> redirect(to: item_path(conn, :index))
  end

  defp user_items(user) do
    assoc(user, :items)
  end
end
