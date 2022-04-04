defmodule LandingTest do
  use ExUnit.Case
  alias Nasa.Landing

  test "get total fuel for landing Apollo 11 on Earth" do
    weight_of_apollo11 = 28801
    earth_gravity = 9.807
    assert Landing.get_fuel(weight_of_apollo11, earth_gravity) == 13447
  end
end
