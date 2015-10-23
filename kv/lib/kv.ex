defmodule KV do
  def start do
    pid = spawn_link(fn -> loop() end)
    Process.register pid, :kvs
  end

  def store(key, value) do
    rpc {:store, key, value}
  end

  def lookup(key) do
    rpc {:lookup, key}
  end

  def rpc(q) do
    send :kvs, {self(), q}
    receive do
      {:kvs, reply} -> reply
    end
  end

  def loop do
    receive do
      {from, {:store, key, value}} ->
        Process.put(key, {:ok, value})
        send from, {:kvs, true}
        loop()
      {from, {:lookup, key}} ->
        send from, {:kvs, Process.get(key)}
        loop()
    end
  end
end
