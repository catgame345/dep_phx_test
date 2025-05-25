defmodule Dep.Products.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :name, :string
    field :table, :integer
    field :order, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:name, :table, :order])
    |> validate_required([:name, :table, :order])
  end
end
