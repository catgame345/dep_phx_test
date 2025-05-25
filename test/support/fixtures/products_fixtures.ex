defmodule Dep.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Dep.Products` context.
  """

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{
        name: "some name",
        order: "some order",
        table: 42
      })
      |> Dep.Products.create_order()

    order
  end
end
