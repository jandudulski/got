angular.module('got').factory 'Players', ['$http', ($http) ->
  {
    index: -> $http.get('/players', params: {format: 'json'})
  }
]
