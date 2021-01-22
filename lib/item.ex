defmodule ShoppingList.Item do
  @moduledoc """
  ShoppingList.Item is a struct that represents a shopping list.
  """

  @required_keys [:name, :price, :quantity]

  @enforce_keys @required_keys
  defstruct @required_keys
end
