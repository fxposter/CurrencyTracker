// dx_javascript_extensions.js
// Provides prototype extensions to basic Javascript/DOM classes.

// binds method local scope to its object
Function.prototype.bind = function(scope) {
  var _function = this;
  
  return function() {
    return _function.apply(scope, arguments);
  }
};

String.prototype.lpad = function(padString, length) {
  var str = this;
  while (str.length < length) {
    str = padString + str;
  }
  return str;
}
