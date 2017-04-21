defmodule PhoenixCommerce.Acceptance.ProductTest do
  use ExUnit.Case
  use PhoenixCommerce.IntegrationCase

  alias PhoenixCommerce.Product

  setup do
    Repo.delete_all(Product)
    {:ok, product} = %Product{
      name: "Some product",
      description: "Some product desctiption",
      price: Decimal.new("25.20")
    } |> Repo.insert


    {:ok, product: product}
  end


  @tag :integration
  test "/cart shows empty cart" do
    navigate_to "/cart"

    heading = find_element(:css, "h2")
    cart = find_element(:css, ".cart")
    cart_table = find_within_element(cart, :css, "table")
    cart_tbody = find_within_element(cart_table, :css, "tbody")
    line_items = find_all_within_element(cart_tbody, :css, "tr")

    assert visible_text(heading) == "Your cart"
    assrt length (line_items) == 0
  end

end
