# NASA

  ## Examples

      iex> Nasa.get_fuel_for_travel(28801, [ [:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]])
      51898

      iex> Nasa.get_fuel_for_travel(14606, [[:launch, 9.807], [:land, 3.711], [:launch, 3.711], [:land, 9.807]])
      33388
      
      iex> Nasa.get_fuel_for_travel(75432, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 3.711], [:launch, 3.711], [:land, 9.807]])
      212161

