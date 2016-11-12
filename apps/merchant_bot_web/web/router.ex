defmodule MerchantBotWeb.Router do
  use MerchantBotWeb.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  scope "/", MerchantBotWeb do
    pipe_through :browser
    coherence_routes
  end

  scope "/", MerchantBotWeb do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", MerchantBotWeb do
    pipe_through :browser
    get "/", PageController, :index
    # Add public routes below
  end

  scope "/", MerchantBotWeb do
    pipe_through :protected
    # Add protected routes below
    resources "/items", ItemController
  end
end
