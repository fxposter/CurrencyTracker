$(document).ready(function() {
  var enhance_table = function(table, chart, filter_input, submit_form, success_status) {
    table = $(table);
    if (table.size() > 0) {
      chart = $(chart);
      filter_input = $(filter_input);
      submit_form = $(submit_form);
    
      var chart = SimplePieChart.initialize(chart[0], table.find('.status'));
      var checker = Checker.initialize(table);
      TableFilter.initialize(table, 'name', filter_input, checker.are_all_checked);
      
      var line_chart = LineChart.initialize('#line_chart', table);

      submit_form.ajaxForm({
        success: function() {
          var statuses = table.find('.check:checked').closest('tr').find('.status')
          statuses.filter(':not([data-visit-date])').attr('data-visit-date', (new Date()).toString());
          statuses.text(success_status);
          chart.render();
          line_chart.render();
        }
      });
    }
  };
  
  enhance_table($('#currencies'), '#collected_currencies_chart', '#filter_currency_name', '#visits_form', 'Collected')
  enhance_table($('#countries'), '#visited_countries_chart', '#filter_country_name', '#visits_form', 'Visited')
});
