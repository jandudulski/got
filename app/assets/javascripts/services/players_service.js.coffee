angular.module('got').factory 'Players', ['$http', ($http) ->
  {
    index: -> $http.get('/players', params: {format: 'json'})
    list: (next) ->
      $http.get('/players', params: {format: 'json'}).then (result) ->
        next(result.data)
  }
]
