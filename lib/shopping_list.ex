defmodule ShoppingList do
  alias ShoppingList.{Item, Result}

  def build(itens, emails) do
    itens
    |> total_itens
    |> sum_all_itens
    |> mean(emails)
    |> show_results(emails)
  end

  def show_results(result, emails) do
    emails
    |> Enum.map(&Result.build(&1, result))
  end

  def sum_total(%Item{price: price, quantity: quantity} = _result), do: price * quantity

  def total_itens(itens) do
    itens
    |> Enum.map(&sum_total/1)
  end

  def sum_all_itens(totals) do
    totals
    |> Enum.reduce(&+/2)
  end

  def mean(totais, emails) do
    div(totais, length(emails))
  end
end
