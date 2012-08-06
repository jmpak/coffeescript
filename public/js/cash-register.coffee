window.Dish = class Dish
  constructor: (rawDescription="") ->
    @title = rawDescription.match(/([^$]+)/)?[1]?.trim()
