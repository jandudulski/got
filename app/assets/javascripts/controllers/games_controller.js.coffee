angular.module('got').controller 'GamesCtrl', ['$scope', 'Games', ($scope, Games) ->
  Games.index().then (result) ->
    $scope.games = result.data
]
