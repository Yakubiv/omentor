addEventListener('turbolinks:load', function () {
  var priceRange = $('#price-range');
  if (priceRange.length > 0) {
    var minValue = priceRange.attr('min');
    var maxValue = priceRange.attr('max');
    var stepValue = priceRange.attr('step');
    var priceRangeValues = $('#price-range_values');

    $("#price-range").jRange({
      from: minValue,
      to: maxValue,
      step: stepValue,
      format: '%s',
      width: 250,
      showLabels: false,
      showScale: false,
      isRange: true,
      onstatechange: function(range) {
        var minPrice = range.split(',')[0];
        var maxPrice = range.split(',')[1];
        var result = `${minPrice} - ${maxPrice}`;
        priceRangeValues.text(result);
      }
    });
  }

});

