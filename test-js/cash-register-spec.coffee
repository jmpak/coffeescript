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

  descibe "invalid value", ->
    it "sets cents to zero if a money value can't be parsed", ->
      m = new Money 'NOT A MONETARY VALUE'
      expects(m.cents).toEqual 0
