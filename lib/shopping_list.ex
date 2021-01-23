defmodule ShoppingList do
  alias ShoppingList.{Item, Result}

  @moduledoc """
  ShoppingList Module represents a shopping list
  """

  @doc """
  build takes a list of products, calculates the total to pay and divides it among friends and
  returns a List of ShoppingList.Result that represents the bill.

  iex(1)> items = [%ShoppingList.Item{name: "Omo", price: 500, quantity: 1}, %ShoppingList.Item{name: "Ariel", price: 500, quantity: 1}]
  iex(2)> emails = ["naruto@mail.com", "luffy@mail.com", "eren@mail.com"]
  iex(3)> ShoppingList.build(items, emails)
  iex(4) [
  %ShoppingList.Result{email: "naruto@mail.com", total: 333},
  %ShoppingList.Result{email: "luffy@mail.com", total: 333},
  %ShoppingList.Result{email: "eren@mail.com", total: 334}
  ]
  """

  @spec build(items :: list(%Item{}), emails :: list(String.t())) :: list(%Result{})
  def build(items, emails) do
    items
    |> total_items
    |> full_price
    |> bill(emails)
  end

  @spec sum_total(item :: %Item{}) :: integer()
  defp sum_total(%Item{price: price, quantity: quantity}), do: price * quantity

  @spec total_items(items :: list(%Item{})) :: [integer()]
  defp total_items(items), do: Enum.map(items, &sum_total/1)

  @spec full_price(total :: list(integer())) :: integer()
  defp full_price(total), do: Enum.reduce(total, &+/2)

  @spec bill(total :: integer(), email :: list(String.t())) :: list(%Result{})
  defp bill(total, emails) do
    email_length = length(emails)
    rest_money = rem(total, email_length)

    case rem(total, email_length) do
      0 ->
        mean(total, emails, email_length)

      _ ->
        total
        |> mean(emails, email_length)
        |> lack_money(rest_money)
    end
  end

  @spec mean(total :: integer(), email :: list(String.t()), email_length :: integer()) ::
          list(%Result{})
  defp mean(total, emails, email_length) do
    total
    |> div(email_length)
    |> build_results(emails)
  end

  @spec lack_money(result :: list(%Result{}), rest :: integer()) :: list(%Result{})
  defp lack_money(result, rest) do
    List.update_at(result, -1, fn %Result{total: total} = item ->
      %Result{item | total: total + rest}
    end)
  end

  @spec build_results(result :: integer(), emails :: list(String.t())) :: list(%Result{})
  defp build_results(result, emails), do: Enum.map(emails, &Result.build(&1, result))
end
