var TableFilter = {};
TableFilter.initialize = function(table, class_for_filtering, input_to_bind) {
  return new ViewController($(table), {
    initialize: function() {
      this.rows = this.root.find('tr');
      this.elements_for_filtering = this.root.find('.' + class_for_filtering);
      this.input_to_bind = $(input_to_bind);
      this._bind();
    },
    unbind: function() {
      this.input_to_bind.unbind('input.table_filter change.table_filter')
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
      this.input_to_bind.bind('input.table_filter change.table_filter', this._filterEvent).trigger('change.table_filter');
    }
  });
};
