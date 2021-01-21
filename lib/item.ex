defmodule ShoppingList.Item do
  @required_keys [:name, :price, :quantity]

  @enforce_keys @required_keys
  defstruct @required_keys
end
