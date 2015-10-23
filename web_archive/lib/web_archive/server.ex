defmodule WebArchive.Server do
  use GenServer

  def start_link(stash_pid) do
    GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def extract_title(url) do
    GenServer.call __MODULE__, {:extract_title, url}
  end

  def handle_call({:extract_title, url}, _from, stash_pid) do
    {:reply, fetch_title(stash_pid, url), stash_pid}
  end

  defp fetch_title(stash_pid, url) do
    case WebArchive.Stash.get_title(stash_pid, url) do
      nil ->
        IO.inspect "--- get from web ---"
        title = WebArchive.Fetcher.extract_title(url)
        :ok = WebArchive.Stash.save_title(stash_pid, url, title)
        title
      title ->
        title
    end
  end

  def extract_titles(urls) when is_list(urls) do
    urls
    |> Enum.map(&(Task.async(fn -> extract_title(&1) end)))
    |> Enum.map(&(Task.await/1))
  end
end
