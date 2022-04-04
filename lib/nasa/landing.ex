defmodule Nasa.Landing do
  @moduledoc """
  Helper module for working with landing
  """

  @spec get_fuel(integer(), float()) :: integer()
  def get_fuel(mass, gravity) do
    fuel = floor(mass * gravity * 0.033 - 42)

    if fuel <= 0 do
      0
    else
      fuel + get_fuel(fuel, gravity)
    end
  end
end
