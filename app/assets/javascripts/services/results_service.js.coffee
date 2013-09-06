angular.module('got').factory 'Results', ['$http', ($http) ->
  {
    new: (game_id, next) ->
      $http.get("/games/#{game_id}/results/new", params: {format: 'json'}).then (result) ->
        next(result.data)
    create: (game_id, data) ->
      $http.post("/games/#{game_id}/results", {format: 'json', result: data})
  }
]
