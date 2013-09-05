angular.module('got').factory 'GameVersions', ['$http', ($http) ->
  {
    list: (next) ->
      $http.get('/game_versions', params: {format: 'json'}).then (result) ->
        next(result.data)
  }
]
