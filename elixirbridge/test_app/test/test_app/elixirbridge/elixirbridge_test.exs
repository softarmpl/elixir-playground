defmodule TestApp.ElixirbridgeTest do
  use TestApp.DataCase

  alias TestApp.Elixirbridge

  describe "drinks" do
    alias TestApp.Elixirbridge.Drink

    @valid_attrs %{name: "some name", temperature: "some temperature"}
    @update_attrs %{name: "some updated name", temperature: "some updated temperature"}
    @invalid_attrs %{name: nil, temperature: nil}

    def drink_fixture(attrs \\ %{}) do
      {:ok, drink} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Elixirbridge.create_drink()

      drink
    end

    test "list_drinks/0 returns all drinks" do
      drink = drink_fixture()
      assert Elixirbridge.list_drinks() == [drink]
    end

    test "get_drink!/1 returns the drink with given id" do
      drink = drink_fixture()
      assert Elixirbridge.get_drink!(drink.id) == drink
    end

    test "create_drink/1 with valid data creates a drink" do
      assert {:ok, %Drink{} = drink} = Elixirbridge.create_drink(@valid_attrs)
      assert drink.name == "some name"
      assert drink.temperature == "some temperature"
    end

    test "create_drink/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Elixirbridge.create_drink(@invalid_attrs)
    end

    test "update_drink/2 with valid data updates the drink" do
      drink = drink_fixture()
      assert {:ok, drink} = Elixirbridge.update_drink(drink, @update_attrs)
      assert %Drink{} = drink
      assert drink.name == "some updated name"
      assert drink.temperature == "some updated temperature"
    end

    test "update_drink/2 with invalid data returns error changeset" do
      drink = drink_fixture()
      assert {:error, %Ecto.Changeset{}} = Elixirbridge.update_drink(drink, @invalid_attrs)
      assert drink == Elixirbridge.get_drink!(drink.id)
    end

    test "delete_drink/1 deletes the drink" do
      drink = drink_fixture()
      assert {:ok, %Drink{}} = Elixirbridge.delete_drink(drink)
      assert_raise Ecto.NoResultsError, fn -> Elixirbridge.get_drink!(drink.id) end
    end

    test "change_drink/1 returns a drink changeset" do
      drink = drink_fixture()
      assert %Ecto.Changeset{} = Elixirbridge.change_drink(drink)
    end
  end
end
