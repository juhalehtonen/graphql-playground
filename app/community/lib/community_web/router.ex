defmodule CommunityWeb.Router do
  use CommunityWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end


  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: CommunityWeb.Schema,
      interface: :simple,
      context: %{pubsub: CommunityWeb.Endpoint}
  end

  scope "/", CommunityWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end
end
