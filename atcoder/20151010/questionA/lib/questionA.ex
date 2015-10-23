defmodule QuestionA do
  def start() do
    case IO.gets("") do
      s -> transcate(s)
    end
  end

  defp transcate(s) when is_binary(s) do
    s_list = String.split(s, " ")
    transcate(s_list, [])
  end

  defp transcate([], res) do
    Enum.reduce(res, fn(a, b) -> b <> " " <> a end)
  end

  defp transcate([head|tail], res) do
    target = String.replace(head, "\n", "")
    case target do
      "Left" -> transcate(tail, List.insert_at(res, -1, "<"))
      "Right" -> transcate(tail, List.insert_at(res, -1, ">"))
      "AtCoder" -> transcate(tail, List.insert_at(res, -1, "A"))
    end
  end
end
