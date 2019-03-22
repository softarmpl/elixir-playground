defmodule TestAppWeb.DrinkController do
  use TestAppWeb, :controller

  alias TestApp.Elixirbridge
  alias TestApp.Elixirbridge.Drink

  def index(conn, _params) do
    drinks = Elixirbridge.list_drinks()
    render(conn, "index.html", drinks: drinks)
  end

  def new(conn, _params) do
    changeset = Elixirbridge.change_drink(%Drink{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"drink" => drink_params}) do
    case Elixirbridge.create_drink(drink_params) do
      {:ok, drink} ->
        conn
        |> put_flash(:info, "Drink created successfully.")
        |> redirect(to: drink_path(conn, :show, drink))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    drink = Elixirbridge.get_drink!(id)
    render(conn, "show.html", drink: drink)
  end

  def edit(conn, %{"id" => id}) do
    drink = Elixirbridge.get_drink!(id)
    changeset = Elixirbridge.change_drink(drink)
    render(conn, "edit.html", drink: drink, changeset: changeset)
  end

  def update(conn, %{"id" => id, "drink" => drink_params}) do
    drink = Elixirbridge.get_drink!(id)

    case Elixirbridge.update_drink(drink, drink_params) do
      {:ok, drink} ->
        conn
        |> put_flash(:info, "Drink updated successfully.")
        |> redirect(to: drink_path(conn, :show, drink))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", drink: drink, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    drink = Elixirbridge.get_drink!(id)
    {:ok, _drink} = Elixirbridge.delete_drink(drink)

    conn
    |> put_flash(:info, "Drink deleted successfully.")
    |> redirect(to: drink_path(conn, :index))
  end
end
