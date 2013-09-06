angular.module('got').factory 'Houses', ['$http', ($http) ->
  {
    list: (next) ->
      $http.get('/houses', params: {format: 'json'}).then (result) ->
        next(result.data)
  }
]
