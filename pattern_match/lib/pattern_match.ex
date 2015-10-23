defmodule PatternMatch do
  use HTTPotion.Base

  def fetch_titles(tag) do
    HTTPotion.start
    HTTPotion.get("https://qiita.com/api/v2/items?query=tag:" <> tag)
    |> process_response
  end

  def process_response(%{status_code: 200, body: body}) do
    body
    |> Poison.decode!
    |> extract_title
  end

  def extract_title(items), do: extract_title(items, [])

  defp extract_title([], res), do: res

  defp extract_title([%{"title" => title}|tail], res) do
    extract_title(tail, [title|res])
  end
end

PatternMatch.fetch_titles("elixir") |> Enum.each fn(title) ->
  IO.inspect title
end
