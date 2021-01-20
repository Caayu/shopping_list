defmodule ShoppingListTest do
  use ExUnit.Case
  doctest ShoppingList

  test "greets the world" do
    assert ShoppingList.hello() == :world
  end
end
