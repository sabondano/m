defmodule MerchantBotWeb.PageController do
  use MerchantBotWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
