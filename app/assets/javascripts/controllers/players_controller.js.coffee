angular.module('got').controller 'PlayersCtrl', ['$scope', 'Players', ($scope, Players) ->
  Players.list (players) ->
    $scope.players = players
]
