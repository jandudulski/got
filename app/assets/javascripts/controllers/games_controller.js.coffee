angular.module('got').controller 'GamesCtrl', ['$scope', 'Games', ($scope, Games) ->
  Games.list (games) ->
    $scope.games = games
]

angular.module('got').controller 'GameCtrl', ['$scope', '$routeParams', 'Games', ($scope, $routeParams, Games) ->
  Games.find $routeParams.id, (game) ->
    $scope.game = game
]

angular.module('got').controller 'NewGameCtrl', ['$scope', '$location', 'Games', 'GameVersions', ($scope, $location, Games, GameVersions) ->
  GameVersions.list (versions) ->
    $scope.versions = versions

  Games.new (game) ->
    $scope.errors = {}
    $scope.game = game

  $scope.save = (data) ->
    success = (result) ->
      $location.path("games/#{result.data.id}")
    error = (result) ->
      $scope.errors = {}

      angular.forEach result.data.errors, (errors, field) ->
        $scope.newGameForm[field].$setValidity('server', false)
        $scope.errors[field] = errors.join(', ')

    Games.create(data).then(success, error)
]

angular.module('got').controller 'EditGameCtrl', [
  '$scope', '$location', '$routeParams', 'Games', 'GameVersions',
  ($scope, $location, $routeParams, Games, GameVersions) ->
    GameVersions.list (versions) ->
      $scope.versions = versions

    Games.find $routeParams.id, (game) ->
      $scope.errors = {}
      $scope.game = game

    $scope.save = (data) ->
      success = (result) ->
        $location.path("games/#{$routeParams.id}")
      error = (result) ->
        $scope.errors = {}

        angular.forEach result.data.errors, (errors, field) ->
          $scope.editGameForm[field].$setValidity('server', false)
          $scope.errors[field] = errors.join(', ')

      Games.update($routeParams.id, data).then(success, error)
]
