defmodule Nasa do
  @moduledoc """
  Nasa top module that exposes methods for traveling and getting the fuel
  """

  @landing_module Application.compile_env(:nasa, :landing_module)
  @launching_module Application.compile_env!(:nasa, :launching_module)

  @type list_of_operations :: list(list(atom() | float()))

  @doc """
   Performs a list of landing and launching operations and returns the fuel needed.
   It starts with the fuel for the last operation and it goes backwards until determines total fuel needed

  ## Examples

      iex> Nasa.get_fuel_for_travel(28801, [ [:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]])
      51898

      iex> Nasa.get_fuel_for_travel(14606, [[:launch, 9.807], [:land, 3.711], [:launch, 3.711], [:land, 9.807]])
      33388

      iex> Nasa.get_fuel_for_travel(75432, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 3.711], [:launch, 3.711], [:land, 9.807]])
      212161
  """
  @spec get_fuel_for_travel(non_neg_integer(), list_of_operations) :: non_neg_integer()
  def get_fuel_for_travel(spaceship_mass, operations) do
    operations
    |> Enum.reverse()
    |> Enum.reduce(
      0,
      fn [operation, gravity], fuel_to_be_carried ->
        fuel_to_be_carried +
          apply_operation(spaceship_mass + fuel_to_be_carried, gravity, operation)
      end
    )
  end

  @spec apply_operation(non_neg_integer(), float(), atom()) :: non_neg_integer()
  defp apply_operation(mass, gravity, :land) do
    @landing_module.get_fuel(mass, gravity)
  end

  defp apply_operation(mass, gravity, :launch) do
    @launching_module.get_fuel(mass, gravity)
  end
end
