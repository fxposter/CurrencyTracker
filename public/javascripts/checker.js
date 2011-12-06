var Checker = {};
Checker.initialize = function(table) {
  return new ViewController($(table), {
    initialize: function() {
      this.checkboxes = this.root.find('.check');
      this.checkboxes.bind('change', this.are_all_checked);
      this.check_all = this.root.find('.check_all');
      this.check_all.bind('change', function(e) {
        this.checkboxes.filter(':visible').attr('checked', $(e.currentTarget).attr('checked'));
      }.bind(this));
    },
    are_all_checked: function() {
      if (this.checkboxes.filter(':visible:not(:checked)').size() == 0) {
        this.check_all.attr('checked', 'checked');
      } else {
        this.check_all.attr('checked', '');
      }
    }
  });
};