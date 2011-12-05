$(document).ready(function() {
  $('.simple_pie_chart').each(function() {
    SimplePieChart.initialize(this);
  });
  
  TableFilter.initialize($('#countries'), 'name', $('#filter_country_name'));
  TableFilter.initialize($('#currencies'), 'name', $('#filter_currency_name'));
});
