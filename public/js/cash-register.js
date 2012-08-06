// Generated by CoffeeScript 1.3.3
(function() {
  var Dish, Money;

  window.Dish = Dish = (function() {

    function Dish(rawDescription) {
      var all, _ref;
      if (rawDescription == null) {
        rawDescription = "";
      }
      _ref = this.parseRawDescription(rawDescription), all = _ref[0], this.title = _ref[1], this.price = _ref[2];
      this.price = new Money(this.price);
    }

    Dish.prototype.parseRawDescription = function(rawDescription) {
      var pattern, r, result, _i, _len, _results;
      pattern = /([^$]+)(\$\d+\.\d+)/;
      result = rawDescription.match(pattern);
      _results = [];
      for (_i = 0, _len = result.length; _i < _len; _i++) {
        r = result[_i];
        _results.push(r.trim());
      }
      return _results;
    };

    return Dish;

  })();

  window.Money = Money = (function() {

    function Money(rawString) {
      this.cents = this.parseCents(rawString);
    }

    Money.prototype.parseCents = function(rawString) {
      var cents, dollars, _ref, _ref1;
      _ref1 = (_ref = rawString.match(/(\d+)/g)) != null ? _ref : [0, 0], dollars = _ref1[0], cents = _ref1[1];
      return +cents + 100 * dollars;
    };

    Money.prototype.toString = function() {
      return "$" + (Math.floor(this.cents / 100)) + "." + (this.cents % 100);
    };

    return Money;

  })();

}).call(this);
