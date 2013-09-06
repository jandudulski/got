angular.module('got').directive 'serverError', ->
  {
    restrict: 'A'
    require: '?ngModel'
    link: (scope, element, attrs, ctrl) ->
      element.on 'change', ->
        scope.$apply ->
          ctrl.$setValidity('server', true)
  }
