defmodule Dep.ProductsTest do
  use Dep.DataCase

  alias Dep.Products

  describe "orders" do
    alias Dep.Products.Order

    import Dep.ProductsFixtures

    @invalid_attrs %{name: nil, table: nil, order: nil}

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Products.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Products.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      valid_attrs = %{name: "some name", table: 42, order: "some order"}

      assert {:ok, %Order{} = order} = Products.create_order(valid_attrs)
      assert order.name == "some name"
      assert order.table == 42
      assert order.order == "some order"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      update_attrs = %{name: "some updated name", table: 43, order: "some updated order"}

      assert {:ok, %Order{} = order} = Products.update_order(order, update_attrs)
      assert order.name == "some updated name"
      assert order.table == 43
      assert order.order == "some updated order"
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_order(order, @invalid_attrs)
      assert order == Products.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Products.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Products.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Products.change_order(order)
    end
  end
end
