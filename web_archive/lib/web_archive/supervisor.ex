defmodule WebArchive.Supervisor do
  use Supervisor

  def start_link do
    res = {:ok, sup} = Supervisor.start_link(__MODULE__, [])
    {:ok, stash_pid} = Supervisor.start_child(sup, worker(WebArchive.Stash, []))
    Supervisor.start_child(sup, supervisor(WebArchive.SubSupervisor, [stash_pid]))
    res
  end

  def init(_) do
    supervise [], strategy: :one_for_one
  end
end
