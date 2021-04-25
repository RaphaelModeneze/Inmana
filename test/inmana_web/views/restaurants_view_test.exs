defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase, async: true

  import Phoenix.View

  alias InmanaWeb.RestaurantsView
  alias Inmana.Restaurant

  describe "render/2" do
    test "render create.json" do
      params = %{name: "Testee", email: "teste@#teste.com"}
      {:ok, restaurant} = Inmana.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurante created!",
               restaurant: %Restaurant{
                 email: "teste@#teste.com",
                 id: _id,
                 name: "Testee"
               }
             } = response
    end
  end
end
