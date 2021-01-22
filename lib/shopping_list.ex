defmodule ShoppingList do
  alias ShoppingList.{Item, Result}

  @moduledoc """
  ShoppingList Module represents a shopping list
  """

  @doc """
  build takes a list of products, calculates the total to pay and divides it among friends and
  returns a List of ShoppingList.Result that represents the bill.

  iex(1)> items = [
    %ShoppingList.Item{name: "Omo", price: 500, quantity: 1},
    %ShoppingList.Item{name: "Ariel", price: 500, quantity: 1}
  ]
  iex(2)> emails = ["naruto@mail.com", "luffy@mail.com", "eren@mail.com"]
  iex(3)> ShoppingList.build(items, emails)
  [
  %ShoppingList.Result{email: "naruto@mail.com", total: 333},
  %ShoppingList.Result{email: "luffy@mail.com", total: 333},
  %ShoppingList.Result{email: "eren@mail.com", total: 334}
  ]
  """
  def build(items, emails) do
    items
    |> total_items
    |> full_price
    |> bill(emails)
  end

  defp sum_total(%Item{price: price, quantity: quantity} = _result), do: price * quantity

  defp total_items(items), do: Enum.map(items, &sum_total/1)

  defp full_price(total) do
    Enum.reduce(total, &+/2)
  end

  defp bill(total, emails) do
    email_length = length(emails)

    case rem(total, email_length) do
      1 ->
        total
        |> mean(emails, email_length)
        |> lack_money()

      _ ->
        mean(total, emails, email_length)
    end
  end

  defp mean(total, emails, email_length) do
    total
    |> div(email_length)
    |> build_results(emails)
  end

  defp lack_money(result) do
    List.update_at(result, -1, fn %Result{total: total} = el ->
      %Result{el | total: total + 1}
    end)
  end

  defp build_results(result, emails), do: Enum.map(emails, &Result.build(&1, result))
end
