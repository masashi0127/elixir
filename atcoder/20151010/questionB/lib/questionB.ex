defmodule QuestionB do
  def stdin() do
    case IO.gets("") do
      nm -> stdin([String.split(nm, " ")])
    end
  end

  def stdin(params) do
    case IO.gets("") do
      "\n" -> exec(params)
      st -> stdin(List.insert_at(params, -1, String.split(st, " ")))
    end
  end

  def exec(params) do
    IO.inspect params
  end
end
