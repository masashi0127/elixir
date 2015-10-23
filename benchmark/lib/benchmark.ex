defmodule Benchmark do
  def benchmark(n, p) do
    loop(n, p - 1, 0, n)
  end

  defp loop(0, 0, v, _) do
    v
  end

  defp loop(0, p, v, m) when p > 0 do
    loop(m, p - 1, v, m)
  end

  defp loop(n, p, v, m) do
    loop(n - 1, p, v + 1, m)
  end
end
