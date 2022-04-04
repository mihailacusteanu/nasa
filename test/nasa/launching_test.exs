defmodule LaunchingTest do
  use ExUnit.Case
  alias Nasa.Launching

  test "get total fuel for landing Apollo 11 on Earth" do
    weight_of_apollo11 = 28_801
    earth_gravity = 9.807
    assert Launching.get_fuel(weight_of_apollo11, earth_gravity) == 19_772
  end
end
