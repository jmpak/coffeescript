describe "Dish", ->
  beforeEach ->
    @dish = new Dish 'Sirloin Steak $18.99 mains'
  it "extracts title", ->
    expect(@dish.title).toEqual 'Sirloin Steak'

  it "extracts price", ->
    expect(@dish.price.cents).toEqual 1899

describe "Money", ->
  describe "valid value", ->
    beforeEach ->
      @money = new Money '15.99'
    it "parses to cents", ->
      (expect @money.cents).toEqual 1599
    it "formats to string", ->
      (expect @money.toString()).toEqual "$15.99"

  describe "valid value", ->
    it "parses to cents", ->
      m = new Money 'NOT A MONETARY VALUE'
      expect(m.cents).toEqual 0

describe "Meal", ->
  beforeEach ->
    @donut = new Dish 'Maple Bacon Donut $1.99'
    @fish = new Dish 'Salmon Filet $14.99'

  describe "blank object", ->
    beforeEach ->
      @meal = new Meal

    it "adds a single dish", ->
      @meal.add @donut
      (expect @meal.dishes.length).toEqual 1

    it "add several dishes", ->
      @meal.add @donut, @fish
      (expect @meal.dishes.length).toEqual 2
    
    it "calculates the total price", ->
      @meal.add @donut, @fish
      (expect @meal.totalPrice().cents).toEqual 1698

