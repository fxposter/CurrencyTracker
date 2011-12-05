var TableFilter = {};
TableFilter.initialize = function(table, class_for_filtering, input_to_bind) {
  return new ViewController($(table), {
    initialize: function() {
      this.rows = this.root.find('tr');
      this.elements_for_filtering = this.root.find('.' + class_for_filtering);
      this.input_to_bind = $(input_to_bind);
      this._bind();
    },
    _filter: function(value) {
      this.rows.hide();
      this._findElementsToShow(value).closest('tr').show();
    },
    _findElementsToShow: function(value) {
      return this.elements_for_filtering.filter(":contains('" + value + "')");
    },
    _filterEvent: function(e) {
      var value = $(e.currentTarget).val();
      this._filter(value);
    },
    _bind: function() {
      this.input_to_bind.bind('input change', this._filterEvent).trigger('change');
    }
  });
}

$(document).ready(function() {
  TableFilter.initialize($('#countries'), 'name', $('#filter_country_name'));
  TableFilter.initialize($('#currencies'), 'name', $('#filter_currency_name'));
});