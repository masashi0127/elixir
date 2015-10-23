defmodule WebArchive.Fetcher do

  def fetch(url) do
    HTTPotion.start
    HTTPotion.get(url)
  end

  def process_response(%{status_code: 200, body: body}) do
    body
    |> to_string
  end

  def extract_title(url) do
    [{"title", [], [title]}] = fetch(url)
    |> process_response
    |> Floki.find "title"
    title
  end
end
