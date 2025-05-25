defmodule Dep.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :name, :string
      add :table, :integer
      add :order, :string

      timestamps(type: :utc_datetime)
    end
  end
end
