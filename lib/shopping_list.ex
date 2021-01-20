defmodule ShoppingList do
  alias ShoppingList.Result

  def build(itens, emails) do
    itens
    |> total_itens
    |> sum_all_itens
    |> media(emails)
    |> show_result(emails)
  end

  def show_result(result, emails) do
    Enum.map(emails, fn email -> Result.build(email, result) end)
  end

  def total_itens(itens) do
    Enum.map(itens, fn item -> item[:price] * item[:quantity] end)
  end

  def sum_all_itens(totals) do
    Enum.reduce(totals, 0, fn value, acc -> value + acc end)
  end

  def media(totais, emails) do
    div(totais, length(emails))
  end
end
