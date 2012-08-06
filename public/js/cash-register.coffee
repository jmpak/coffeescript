window.Dish = class Dish
  constructor: (rawDescription="") ->
    [all, @title, @price] = @parseRawDescription rawDescription

  parseRawDescription: (rawDescription) ->
    pattern = ///
      ([^$]+)
      (\$\d+\.\d+)
    ///
    result = rawDescription.match pattern
    r.trim() for r in result
