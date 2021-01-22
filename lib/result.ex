defmodule ShoppingList.Result do
  @moduledoc """
  ShoppingList.Result is a struct that represents the total to pay among friends.
  """

  @required_keys [:email, :total]

  @enforce_keys @required_keys
  defstruct @required_keys

  @doc """
  build takes a list of emails and total values of items and build a Map that represents the bill.
  """
  def build(email, total) do
    %ShoppingList.Result{
      email: email,
      total: total
    }
  end
end
