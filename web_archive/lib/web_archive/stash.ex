defmodule WebArchive.Stash do

  def start_link do
    Agent.start_link(fn -> HashDict.new end)
  end

  def save_title(pid, url, title) do
    Agent.update pid, fn(dict) -> Dict.put(dict, url, title) end
  end

  def get_title(pid, url) do
    Agent.get pid, fn(dict) -> dict[url] end
  end
end
