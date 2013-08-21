angular.module('got').factory 'Games', ['$http', ($http) ->
  {
    index: -> $http.get('/', params: {format: 'json'})
  }
]
