defmodule CommunityWeb.Schema do
  use Absinthe.Schema
  alias CommunityWeb.NewsResolver

  @moduledoc """
  The GraphQL API is how we’re going to expose our data to the web, so we're going
  to place the code for the schema in the web context of our application.

  Note: thanks to Absinthe we can write things like `:all_links` (idiomatic Elixir)
  even when idiomatic GraphQL would expect `allLinks` instead. The conversion is
  done for us.
  """

  # Adding a :link object to the schema
  object :link do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :description, non_null(:string)
  end

  # This is the query entry point to our app
  query do
    # Here we specify the field for a resolver by using the resolve macro and passing it a function:
    field :all_links, non_null(list_of(non_null(:link))) do
      resolve &NewsResolver.all_links/3
    end
  end
end
