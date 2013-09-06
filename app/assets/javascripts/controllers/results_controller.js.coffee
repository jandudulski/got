angular.module('got').controller 'NewResultCtrl', [
  '$scope', '$location', '$routeParams', 'Games', 'Results', 'Houses', 'Players',
  ($scope, $location, $routeParams, Games, Results, Houses, Players) ->
    Games.find $routeParams.game_id, (game) ->
      $scope.game = game

    Houses.list (houses) ->
      $scope.houses = houses

    Players.list (players) ->
      $scope.players = players

    $scope.positions = [1..9]

    Results.new $routeParams.game_id, (result) ->
      $scope.errors = {}
      $scope.result = result

    $scope.save = (data) ->
      success = (result) ->
        $location.path("games/#{$routeParams.game_id}")
      error = (result) ->
        $scope.errors = {}

        angular.forEach result.data.errors, (errors, field) ->
          $scope.newResultForm[field].$setValidity('server', false)
          $scope.errors[field] = errors.join(', ')

      Results.create($routeParams.game_id, data).then(success, error)
]
