defmodule Nasa.Launching do
  @moduledoc """
  Helper module for working with landing
  """

  @spec get_fuel(integer(), float()) :: integer()
  def get_fuel(mass, gravity) do
    fuel = floor(mass * gravity * 0.042 - 33)

    case fuel <= 0 do
      true ->
        0

      _ ->
        fuel + get_fuel(fuel, gravity)
    end
  end
end
