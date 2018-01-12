defmodule CommunityWeb.NewsResolver do
  alias Community.News

  @moduledoc """
  This is a RESOLVER, which are just functions mapped to GraphQL fields, with
  their actual behaviour.
  """

  @doc """
  Return all links.
  """
  def all_links(_root, _args, _info) do
    links = News.list_links()
    {:ok, links}
  end

  @doc """
  Create a new link through a mutation.
  """
  def create_link(_root, args, _info) do
    # TODO: add detailed error message handling later
    case News.create_link(args) do
      {:ok, link} ->
        {:ok, link}
      _error ->
        {:error, "could not create link"}
    end
  end

end
