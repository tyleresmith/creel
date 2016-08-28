function species() {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, element, attrs, ngModel) {
            ngModel.$validators.species = function (value) {
                var patt = /^[A-Z](\w)\w+ [a-z](\w+)/g;
                return patt.test(value);
            };
        }
    };
}
 
angular
    .module('creel')
    .directive('species', species);