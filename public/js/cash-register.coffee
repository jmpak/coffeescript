window.Dish = class Dish
  constructor: (rawDescription="") ->
    [all, @title, @price] = @parseRawDescription rawDescription
    @price = new Money @price

  parseRawDescription: (rawDescription) ->
    pattern = ///
      ([^$]+)
      (\$\d+\.\d+)
    ///
    result = rawDescription.match pattern
    r.trim() for r in result

window.Money = class Money
  constructor: (rawString='') ->
    @cents = @parseCents rawString

  parseCents: (rawString) ->
    [dollars, cents] = (rawString.match /(\d+)/g) ? [0,0]
    +cents + 100*dollars

  toString: ->
    "$#{Math.floor(@cents / 100)}.#{@cents % 100}"

window.Meal = class Meal
  constructor: ->
    @dishes = []

  add: (dishes...) -> @dishes.push dishes...

  totalPrice: ->
    total = new Money
    total.cents = total.cents + dish.price.cents for dish in @dishes
    total
