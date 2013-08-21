angular.module('got').controller 'PlayersCtrl', ['$scope', 'Players', ($scope, Players) ->
  Players.index().then (result) ->
    $scope.players = result.data
]
