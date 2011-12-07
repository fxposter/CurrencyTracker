var LineChart = {};
LineChart.initialize = function(root, table) {
  return new ViewController($(root), {
    initialize: function() {
      this.table = $(table);
      this.render();    
    },
    getDatesFromTable: function(table) {
      var dates = [];
      table.find('.status[data-visit-date]').each(function() {
        var date = $(this).attr('data-visit-date');
        if (date) {
          date = new Date(date);
          date = new Date(date.getFullYear(), date.getMonth(), 1);
          dates.push(date);
        }
      });
      return dates;
    },
    makeKeysAndValues: function(dates) {
      var data = {}, min_date, max_date, time, array, keys, values;
      _.each(dates, function(date) {
        time = date.getTime();
        
        if (!min_date || min_date > date) {
          min_date = date;
        }
      
        if (!max_date || max_date < date) {
          max_date = date;
        }
        
        data[time] = data[time] ? data[time] + 1 : 1;
      });
      
      while (min_date < max_date) {
        time = min_date.setMonth(min_date.getMonth() + 1).toString();
        if (!data[time]) {
          data[time] = 0;
        }
      }
      array = _.map(data, function(value, key) { return [key, value]; });
      array = _.sortBy(array, function(pair) { return parseInt(pair[0], 10); });
      keys = _.map(array, function(pair) { return this.formatDate(new Date(parseInt(pair[0], 10))); }.bind(this));
      values = _.map(array, function(pair) { return pair[1] });
      for (key in values) {
        if (key > 0) {
          values[key] += values[key - 1]
        }
      }
      return [keys, values];
    },
    formatDate: function(date) {
      return date.getFullYear() + "-" + (date.getMonth() + 1).toString().lpad('0', 2);
    },
    
    render: function() {
      var dates = this.getDatesFromTable(this.table);
      var keys_and_values = this.makeKeysAndValues(dates);
      if (keys_and_values[0].length >= 1) {
        this.root.show().empty();
        new Ico.LineGraph(this.root.attr('id'),
          [keys_and_values[1]],
          { font_size: 16
            , labels: { values: keys_and_values[0], long_values: keys_and_values[0], angle: 30 }
            , units: '', units_position: 0
            , legend: {
              labels: ['Actual'],
              font: { 'font-size': 48, stroke: 'none', fill: 'orange', 'fill-opacity' : 0.5 }
            }
            , x_padding_right: 40
            , colors: ['#228899']
            , mouseover_attributes: { stroke: 'green' }
            , background: { color: '#ccf', corners: 5 }
            , curve_amount: 1
            , grid: { stroke: "#a9b", 'stroke-width': 1 }
            , mouse_pointer: true
            , status_bar : true
          }
        );
      } else {
        this.root.hide();
      }
    }
  });
};