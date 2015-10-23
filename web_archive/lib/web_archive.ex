defmodule WebArchive do
  use Application
  
  def start(_type, _args) do
    WebArchive.Supervisor.start_link
  end
end
