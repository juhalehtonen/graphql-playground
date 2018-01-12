defmodule CommunityWeb.NewsResolver do
  alias Community.News

  @moduledoc """
  This is a RESOLVER, which are just functions mapped to GraphQL fields, with
  their actual behaviour.
  """

  def all_links(_root, _args, _info) do
    links = News.list_links()
    {:ok, links}
  end
end
