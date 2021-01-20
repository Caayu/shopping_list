defmodule ShoppingList.Result do
  @required_keys [:email, :total]

  @enforce_keys @required_keys
  defstruct @required_keys

  def build(email, total) do
    %ShoppingList.Result{
      email: email,
      total: total
    }
  end
end
