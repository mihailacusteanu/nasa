defmodule NasaTest do
  use ExUnit.Case
  doctest Nasa

  test "greets the world" do
    assert Nasa.get_fuel_for_travel(28_801, [
             [:launch, 9.807],
             [:land, 1.62],
             [:launch, 1.62],
             [:land, 9.807]
           ]) ==
             51_898
  end
end
