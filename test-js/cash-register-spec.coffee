describe "Dish", ->
  beforeEach ->
    @dish = new Dish 'Sirloin Steak $18.99 mains'
  it "extracts title", ->
    expect(@dish.title).toEqual 'Sirloin Steak'
